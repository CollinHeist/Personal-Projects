/* ----------------------------- Included Files ----------------------------- */
#include <plib.h>

// FreeRTOS includes
#include "FreeRTOS.h"		// FreeRTOS API
#include "FreeRTOSConfig.h" // FreeRTOS configuration
#include "task.h"			// Generic task
#include "queue.h"			// Queues
#include "semphr.h"			// Semaphore

// Hardware dependent setting
#include "chipKIT_Pro_MX7.h"

// File-Header includes
#include "main.h"
#include "LCDlib.h"
#include "comm.h"
#include "I2C_EEPROM_LIB.h"

/* --------------------------- Function Prototypes -------------------------- */
// CN ISR for button presses - Directly calls wrapper function
void __ISR(_CHANGE_NOTICE_VECTOR, IPL1) isr_change_notice_wrapper(void);
// UART-RX ISR - Directly calls wrapper function
void __ISR(_UART1_VECTOR, IPL2SOFT) isr_uart_RX_wrapper(void);

/* ---------------------------- Global Variables ---------------------------- */
xSemaphoreHandle cn_semaphore;			// Semaphore for unblocking the handler task from the CN ISR when BTN1 is pressed
xSemaphoreHandle write_to_eeprom;		// Semaphore for unblocking the write-to-EEPROM task when a message is ready

xQueueHandle eeprom_addr_queue;			// Queue of addresses the EEPROM needs to read from
xQueueHandle eeprom_pending_queue;		// Queue of pending retrievals to send to the LCD

unsigned int previous_btn1_status;		// Previous status of BTN1 - used to detect a PRESS
unsigned int eeprom_write_addr;			// Current address in EEPROM memory we are writing to

char uart_input[UART_MAX_MSG_SIZE+1];	// Character string of the current UART input + space for '\0'

#if (configUSE_TRACE_FACILITY == 1)		// TraceAlyzer variables
	traceString trace_cn;				// Channel for the Change Notice ISR & Handler
	traceString trace_heartbeat;		// Channel for the 1ms "heartbeat"
	traceString trace_uartRX_isr;		// Channel for the UART-RX ISR
	traceString trace_write_msg_eeprom;	// Channel for writing a complete message to the EEPROM
	traceString trace_read_eeprom;		// Channel for reading from the EEPROM
#endif

/* ------------------------------ Main Program ------------------------------ */
int main() {
	// Initialize and configure the hardware
	init_hardware();

	// Initalize other components of the system
	unsigned int failure_flag = FALSE;
	failure_flag = create_RTOS_objects();
	failure_flag |= create_tasks();

	// If anything failed to initialize, exit
	if (failure_flag)
		return 0;

	// Start the scheduler
	vTaskStartScheduler();

	// Should only reach here if there is insufficient heap available to start scheduler
	return 0;
}

/* ------------------------ Initialization Functions ------------------------ */
// Hardware initialization task
static void init_hardware() {
	chipKIT_PRO_MX7_Setup();				// Set up board
	initialize_LCD();						// Initialize the LCD
	init_eeprom();							// Initialize the EEPROM
	initialize_uart1(19200, ODD_PARITY);	// Initialize UART1 at 19200, odd-parity

	// Set up LEDs
	PORTSetPinsDigitalOut(IOPORT_B, SM_LEDS);
	LATBCLR = SM_LEDS;

	// Configure BTN1
	PORTSetPinsDigitalIn(IOPORT_G, BTN1);

	// Enable the CN interrupt for BTN1
	mCNOpen(CN_ON, CN8_ENABLE, 0);
	mCNSetIntPriority(1);
	mCNSetIntSubPriority(0);
	unsigned int x = PORTReadBits(IOPORT_G, BTN1);
	mCNClearIntFlag();
	mCNIntEnable(1);

	// Turn on the interrupt for UART1-RX
	ConfigIntUART1(UART_ERR_INT_DIS | UART_RX_INT_EN | UART_INT_PR2 |
		UART_INT_SUB_PR0 | UART_TX_INT_DIS);

	// Turn on the multiple interrupt Vectors
	INTEnableSystemMultiVectoredInt();
}

// Create all FreeRTOS Objects - i.e. queues, semaphores, traces, etc.
static unsigned int create_RTOS_objects() {
	// Turn on the TraceAlyzer
	// -> Also assign user-event labels to each of the TraceAlyzer Channels
	if (configUSE_TRACE_FACILITY) {
		vTraceEnable(TRC_START);
		trace_cn = xTraceRegisterString("Change Notice");
		trace_heartbeat = xTraceRegisterString("1ms LEDC Heartbeat");
		trace_uartRX_isr = xTraceRegisterString("UART RX ISR");
		trace_write_msg_eeprom = xTraceRegisterString("EEPROM Writing Task");
		trace_read_eeprom = xTraceRegisterString("EEPROM Reading Task");
	}

	// Create the semaphore needed for the CN ISR -> Handler, and UART-RX ISR -> Handler
	vSemaphoreCreateBinary(cn_semaphore);
	vSemaphoreCreateBinary(write_to_eeprom);
	if (cn_semaphore == NULL || write_to_eeprom == NULL)
		return TRUE;	// Error creating the semaphore(s)

	// Create the EEPROM address queue, and the EEPROM pending retrieval queue
	eeprom_addr_queue = xQueueCreate(MAX_NUM_MSGS, sizeof(unsigned int));
	eeprom_pending_queue = xQueueCreate(MAX_NUM_MSGS, sizeof(unsigned int));
	if (!eeprom_addr_queue || !eeprom_pending_queue)
		return TRUE;	// Error creating the queue

	return FALSE;
}

// Create all FreeRTOS tasks needed for this project
static unsigned int create_tasks() {
	BaseType_t task_success;	// Whether the task creation(s) were successful

	// Create the CN ISR handler task
	task_success = xTaskCreate(task_change_notice_handler, "CN ISR Handler Task",
		configMINIMAL_STACK_SIZE, NULL, CN_HANDLER_TASK_PRIORITY, NULL);
	// Create the write-to-EEPROM task
	task_success |= xTaskCreate(task_write_EEPROM, "Writing to EEPROM Task",
		configMINIMAL_STACK_SIZE * 5, NULL, EEPROM_WRITE_TASK_PRIORITY, NULL);
	// Create the read-from-EEPROM task
	task_success |= xTaskCreate(task_read_EEPROM, "Reading from EEPROM Task",
		2500, NULL, EEPROM_READ_TASK_PRIORITY, NULL);
	// Create the 1ms heartbeat task
	task_success |= xTaskCreate(task_1ms_heartbeat, "1ms Heartbeat Task",
		configMINIMAL_STACK_SIZE, NULL, HEARTBEAT_TASK_PRIORITY, NULL);
	
	// Error creating a task - return a failure
	if (task_success != pdPASS)
		return TRUE; 
	
	return FALSE;
}

/* --------------------------- 'Normal' Functions --------------------------- */

// ISR for UART1 RX
void isr_uart_RX_handler(void) {
	portBASE_TYPE move_to_higher_priority = pdFALSE;
	if (configUSE_TRACE_FACILITY)
		vTracePrint(trace_uartRX_isr, "Character received");

	// Add the current character to the current character string
	if (getStrU1(uart_input, sizeof(uart_input))) {
		putcU1('\n');	// Put newline character
		// If the return was TRUE, it's the EOL and give semaphore to write message to EEPROM
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_uartRX_isr, "Detected a complete message - Giving semaphore");
		xSemaphoreGiveFromISR(write_to_eeprom, &move_to_higher_priority);
			
		// Turn off LEDA while the message parses
		mPORTBClearBits(LEDA);
	}

	// Clear the RX Interrupt Flag
	mU1RXClearIntFlag();

	if (configUSE_TRACE_FACILITY)
		vTracePrint(trace_uartRX_isr, "Exiting ISR");
	
	// Exit the ISR, returning to the higher priority task if necessary
	portEND_SWITCHING_ISR(move_to_higher_priority);
}

// This task is unblocked when the incoming UART message is finished
// This task writes the message to the EEPROM then adds that memory location to the read queue
static void task_write_EEPROM(void *task_params) {
	unsigned int i = 0; // Used for iterating over message buffer
	portBASE_TYPE queue_status;
	
	// Try and take the semaphore to start (no delay) in case it was given already
	xSemaphoreTake(write_to_eeprom, 0);
	for (;;) {
		// Wait for the write-to-EEPROM semaphore forever
		// -> Only unblocks when the UART-RX ISR detects a completed message
		xSemaphoreTake(write_to_eeprom, portMAX_DELAY);
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_write_msg_eeprom, "Received the semaphore");

		// See if there is room to write the message
		if (uxQueueMessagesWaiting(eeprom_addr_queue) >= MAX_NUM_MSGS) {
			// The queue is full, the message CANNOT be written
			if (configUSE_TRACE_FACILITY) {
				vTracePrint(trace_write_msg_eeprom, "Cannot write message - Queue full");
				Nop();
			}
		}
		else {
			// The queue is not full, the message can be written
			// Write the UART message to the EEPROM
			unsigned int write_error = NO_ERR;
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_write_msg_eeprom, "Writing to the EEPROM");
			
			// Write to the EEPROM, if that was successful, add that address to the queue
			write_error = write_eeprom(EEPROM_SLAVE_ADDR, eeprom_write_addr, uart_input, UART_MAX_MSG_SIZE);
			if (write_error) {
				// A write error occured
				if (configUSE_TRACE_FACILITY)
					vTracePrint(trace_write_msg_eeprom, "An error occurred while writing to the EEPROM");
			}
			else {
				// No write errors occurred - add to the address queue
				queue_status = xQueueSendToBack(eeprom_addr_queue, &eeprom_write_addr, 0);
				if (configUSE_TRACE_FACILITY)
					vTracePrint(trace_write_msg_eeprom, "Finished writing - added EEPROM memory address to read Queue");

				// Increase the memory address where we're currently writing to on the EEPROM - don't run over 'x' messages
				eeprom_write_addr += UART_MAX_MSG_SIZE;
				eeprom_write_addr %= UART_MAX_MSG_SIZE * MAX_NUM_MSGS;
			}
		}

		// Clear the message buffer - prevents long messages from being rewritten to the EEPROM
		for (i = 0; i < UART_MAX_MSG_SIZE; i++)
			uart_input[i] = 0;

		// Turn on LEDA to indicate a new message can be entered (if the queue isn't full)
		if (uxQueueMessagesWaiting(eeprom_addr_queue) != MAX_NUM_MSGS)
			mPORTBSetBits(LEDA);
	}
}

// This function is called when the CN ISR triggers
// Clears the CN flag and gives a semaphore to unblock the handler task
void isr_change_notice_handler(void) {
	// Flag for if returning to a higher priority task is necessary
	portBASE_TYPE move_to_higher_priority = pdFALSE;
	
	// Give the semaphore to unlock the task
	if (configUSE_TRACE_FACILITY)
		vTracePrint(trace_cn, "Giving semaphore from CN ISR");
	xSemaphoreGiveFromISR(cn_semaphore, &move_to_higher_priority);
	
	// Clear the interrupt flag
	mCNClearIntFlag();
	mCNOpen(CN_OFF, (CN8_ENABLE), 0);
	
	// Exit the ISR, returning to the higher priority task if necessary
	portEND_SWITCHING_ISR(move_to_higher_priority);
}

// This is the handler TASK that executes the CN code
// -> Unblocks only from the CN ISR, adds to the pending queue
static void task_change_notice_handler(void *task_params) {
	portBASE_TYPE queue_status;
	unsigned int dummy_val = 1;
	unsigned int current_btn1_status = 0;
	// Try and take the semaphore to start (no delay) in case it was given
	// before the task started
	xSemaphoreTake(cn_semaphore, 0);
	
	for (;;) {
		// Wait for the semaphore forever
		// -> this only unblocks when the semaphore is GIVEN by the ISR
		xSemaphoreTake(cn_semaphore, portMAX_DELAY);
		current_btn1_status = PORTG & BTN1;
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_cn, "Received the semaphore in handler");
		
		// Debounce the task for (x) milliseconds
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_cn, "Debouncing button in handler");
		vTaskDelay(MS_TO_TICKS(DEBOUNCE_TIME_MS));
		
		// Check if this CN was triggered by a PRESS - If so, add to the pending queue
		if (previous_btn1_status == 0 && current_btn1_status) {
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_cn, "BTN1 pressed - Adding retrieval to pending queue");
			queue_status = xQueueSendToBack(eeprom_pending_queue, &dummy_val, 0);
		}
		if (configUSE_TRACE_FACILITY && queue_status == errQUEUE_FULL) {
			vTracePrint(trace_cn, "Error adding to pending Queue: Queue full");
			Nop();
		}
		
		// Update the previous button status
		previous_btn1_status = current_btn1_status;
	}
}

// This task reads from the EEPROM
// -> Only unblocked when the CN ISR gives adds to pending queue, AND the read queue has items in it
static void task_read_EEPROM(void* task_params) {
	portBASE_TYPE queue_status;
	unsigned int eeprom_read_addr;						// The memory address to read from
	unsigned int dummy_val, i, line_index;

	for (;;) {
		char eeprom_message[UART_MAX_MSG_SIZE] = {0};	// Empty message buffer for EEPROM read
		char lcd_message[LCD_CHAR_WIDTH + 1] = {0};		// Empty buffer for the LCD string

		// Wait for item in pending queue - signifies a button press requested a new retrieval
		xQueueReceive(eeprom_pending_queue, &dummy_val, portMAX_DELAY);
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_read_eeprom, "Retrieval request read from pending queue");

		// Look in the address queue for an address to read at - do not wait any time
		queue_status = xQueueReceive(eeprom_addr_queue, &eeprom_read_addr, 0);
		if (queue_status == pdTRUE) {
			// There was an address in the address queue - read from the EEPROM
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_read_eeprom, "Address received from address queue - reading from EEPROM");
			unsigned int read_error = NO_ERR;	// Error status of I2C read
			read_error = read_eeprom(EEPROM_SLAVE_ADDR, eeprom_read_addr, eeprom_message, UART_MAX_MSG_SIZE);
			if (configUSE_TRACE_FACILITY && read_error)
				vTracePrint(trace_read_eeprom, "Error occurred while reading from EEPROM");

			// Format the string read from the EEPROM for writing to the LCD
			format_message_LCD(eeprom_message, UART_MAX_MSG_SIZE, LCD_CHAR_WIDTH);
			
			// Determine how many lines are in this message
			unsigned int num_lines = get_line_count(eeprom_message, UART_MAX_MSG_SIZE);
			
			// Write to the newly formatted message to the LCD - start w/ line one
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_read_eeprom, "Message formatted - Writing to LCD");
			reset_clear_LCD();								// Clear the LCD
			vTaskDelay(MS_TO_TICKS(LCD_BLANK_PERIOD_MS));	// Keep blank for desired time
			set_cursor_LCD(SECOND_LINE_START);				// Start on the second line of the LCD
			get_row_string(eeprom_message, UART_MAX_MSG_SIZE, 0, lcd_message, LCD_CHAR_WIDTH + 1);
			put_string_LCD(lcd_message);					// Write that string to the LCDs
			
			// Loop through all remaining lines of the message (if any)
			for (line_index = 1; line_index < num_lines + 1; line_index++) {
				vTaskDelay(MS_TO_TICKS(LCD_ROLLING_DELAY_MS));	// Wait between each new line
				reset_clear_LCD();								// Clear the LCD
				set_cursor_LCD(FIRST_LINE_START);				// Start on first line
				get_row_string(eeprom_message, UART_MAX_MSG_SIZE, line_index - 1, lcd_message, LCD_CHAR_WIDTH + 1);
				put_string_LCD(lcd_message);					// Put the previous line on the first LCD line
				set_cursor_LCD(SECOND_LINE_START);				// Go to second line of LCD
				get_row_string(eeprom_message, UART_MAX_MSG_SIZE, line_index, lcd_message, LCD_CHAR_WIDTH + 1);
				put_string_LCD(lcd_message);					// Put this line on the second LCD line
			}
			
			// Put the last line of the message on the top line of the LCD
			vTaskDelay(MS_TO_TICKS(LCD_ROLLING_DELAY_MS));	// Wait between each new line
			reset_clear_LCD();								// Clear the LCD
			set_cursor_LCD(FIRST_LINE_START);				// Go to first line of LCD
			get_row_string(eeprom_message, UART_MAX_MSG_SIZE, num_lines, lcd_message, LCD_CHAR_WIDTH + 1);
			put_string_LCD(lcd_message);					// Write last message to top of LCD
			vTaskDelay(MS_TO_TICKS(LCD_ROLLING_DELAY_MS));	// Wait between each new line
			reset_clear_LCD();
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_read_eeprom, "Finished displaying message on LCD");
		}
		else {
			// There was a request initiated, but no addresses to read from
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_read_eeprom, "Retrieval requested, but the address queue is empty");
			Nop();
		}
	}
}

// Task to toggle LEDC every 1ms
static void task_1ms_heartbeat(void* task_params) {
	for (;;) {
		if (configUSE_TRACE_FACILITY && SHOW_HEARBEAT_TASK) 
			vTracePrint(trace_heartbeat, "Toggling LEDC");

		mPORTBToggleBits(LEDC);		// Invert LEDC
		vTaskDelay(MS_TO_TICKS(1)); // Come back in one millisecond
	}
}

/* --------------------------- 'Helper' Functions --------------------------- */

// Changes the given message to contain '\n' where necessary for proper LCD formatting
void format_message_LCD(char* message, unsigned int max_message_length, unsigned int lcd_width) {
	unsigned int last_space_pos = 0;	// Last location a space was found in the message
	unsigned int curr_pos;				// Current position in message being looked at
	unsigned int line_pos;				// Current position in the LCD line

	// Loop through every character of the message
	for (curr_pos = 0, line_pos = 0; curr_pos < max_message_length; curr_pos++, line_pos++) {
		if (message[curr_pos] == '\0')	// Stop when we've reached the end of the message
			return;

		// Update last_space_pos if a new space or return character has been found
		if (message[curr_pos] == ' ' || message[curr_pos] == '\r')
			last_space_pos = curr_pos;

		// If we've reached the end of the LCD line - reset line count, change ' ' to '\n'
		if (line_pos % (lcd_width+1) == 0 && line_pos != 0) {
			message[last_space_pos] = '\n';		// Replace the last space with newline
			curr_pos = last_space_pos;			// Re-evaluate stating at newlines
			line_pos = 0;						// Reset the line position counter
		}
	}
}

// Changes row_str to obtain the string contained on the given row number of message
void get_row_string(char* message, unsigned int max_message_length, unsigned int row, char* row_str, unsigned int max_row_length) {
	unsigned int row_number = 0;	// Current row 
	unsigned int char_index = 0;	// Current index of message being evaluated
	unsigned int row_str_index = 0;	// Current index of the row string being placed into

	// Clear the previous values of row_str - prevents buggy messages
	for (char_index; char_index < max_row_length; char_index++)
		row_str[char_index] = '\0';

	// Iterate through all characters, placing the ones of the correct row into row_str
	for (char_index = 0; char_index < max_message_length; char_index++) {
		if (message[char_index] == '\0')		// If we're on the last character of the message
			return;
		
		if (row_number == row) {				// If we're iterating over the desired row, copy it
			if (message[char_index] == '\n') {	// If we're at the end of line - null terminate the string
				row_str[row_str_index++] = '\0';
				return;
			}
			else
				row_str[row_str_index++] = message[char_index];
		}

		if (message[char_index] == '\n')		// If a new row is detected - increase count
			row_number++;
	}

	row_str[row_str_index] = '\0';				// Terminate the row string
}

// Returns how many lines are in the given message
unsigned int get_line_count(char* message, unsigned int max_message_length) {
	unsigned int index = 0;
	unsigned int line_count = 0;
	for (index = 0; index < max_message_length; index++) {
		if (message[index] == '\0')	// End of message detected
			return line_count;
	
		if (message[index] == '\n')	// If a newline is detected, increment count
			line_count++;
	}
	
	return line_count;				// Return the count
}

/* --------------------- FreeRTOS Functional Functions ---------------------- */

// Tick hook task
void vApplicationTickHook(void) {
	
}

// Idle task
// Looks if the eeprom_addr_queue is empty and sets LEDB accordingly
void vApplicationIdleHook(void) {
	// If the address queue is empty, turn LEDB off
	if (uxQueueMessagesWaiting(eeprom_addr_queue) == 0)
		mPORTBSetBits(LEDB);
	else
		mPORTBClearBits(LEDB);
	
	// If the address queue is full, turn LEDA off
	if (uxQueueMessagesWaiting(eeprom_addr_queue) == MAX_NUM_MSGS)
		mPORTBClearBits(LEDA);
}

// Function that is called whenever a stack overflows
void vApplicationStackOverflowHook() {
	for(;;) {}
}

// Generic exception handler
void _general_exception_handler(unsigned long ulCause, unsigned long ulStatus) {
	for(;;) {}
}