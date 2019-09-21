/* ----------------------------- Included Files ----------------------------- */
#include <plib.h>

// FreeRTOS includes
#include "FreeRTOS.h"	   // FreeRTOS API
#include "FreeRTOSConfig.h" // FreeRTOS Configuration file
#include "task.h"		   // Generic task
#include "queue.h"		  // Queues
#include "semphr.h"		 // Semaphore

// Hardware dependent setting
#include "chipKIT_Pro_MX7.h"

// File-Header includes
#include "main.h"
#include "LCDlib.h"
#include "comm.h"
#include "I2C_EEPROM_LIB.h"

/* --------------------------- Function Prototypes -------------------------- */
// CN ISR for button presses - Directly calls wrapper function
void __ISR(_CHANGE_NOTICE_VECTOR, IPL1) isr_changeNoticeWrapper(void);
// UART-RX ISR - Directly calls wrapper function
void __ISR(_UART1_VECTOR, IPL2SOFT) isr_uartRXWrapper(void)

/* ---------------------------- Global Variables ---------------------------- */
xSemaphoreHandle cn_semaphore;			// Semaphore for unblocking the handler task from the ISR
xSemaphoreHandle send_to_eeprom;		// Semaphore for unblocking the send-to-EEPROM task when a message is ready

xQueueHandle eeprom_read_queue;			// Queue of addresses the EEPROM needs to read from

unsigned int previous_BTN1_status;		// Previous status of BTN1 - used to detect a PRESS
unsigned int eeprom_write_addr;			// Current address in EEPROM memory we are writing to

char current_uart_input[UART_MAX_NUM_CHARS];	// Character string of the current UART input

#if (configUSE_TRACE_FACILITY == 1)		// TraceAlyzer variables
	traceString trace_cn;				// Channel for the Change Notice ISR & Handler
	traceString trace_heartbeat;		// Channel for the 1ms "heartbeat"
	traceString trace_uartRX_isr;		// Channel for the UART-RX ISR
	traceString trace_send_msg_eeprom;	// Channel for sending a complete message to the EEPROM
	traceString trace_read_eeprom;		// Channel for reading from the EEPROM
#endif

	
/* ------------------------------ Main Program ------------------------------ */
int main() {
	// Initialize and configure the hardware
	initHardware();

	unsigned int failure_flag = FALSE;
	failure_flag = createRTOSObjects();
	failure_flag |= createTasks();

	// If anything failed to initialize, exit
	if (failure_flag)
		return 0;

	// Start the scheduler
	vTaskStartScheduler();

	// Should only reach here if there is insufficient heap available to start scheduler
	return 0;
}

// Hardware initialization task
static void initHardware() {
	chipKIT_PRO_MX7_Setup();				// Set up board
	initialize_LCD();					   // Initialize the LCD
	initialize_uart1(19200, ODD_PARITY);	// Initialize UART1 at 19200, odd-parity

	// Set up LEDs
	PORTSetPinsDigitalOut(IOPORT_B, SM_LEDS);
	LATBCLR = SM_LEDS;
	
	// Configure button
	PORTSetPinsDigitalIn(IOPORT_G, BTN1);
	
	// Enable the Interrupt for BTN1
	mCNOpen(CN_ON, CN8_ENABLE, 0);
	mCNSetIntPriority(1);
	mCNSetIntSubPriority(0);
	unsigned int x = PORTReadBits(IOPORT_G, BTN1);
	mCNClearIntFlag();
	mCNIntEnable(1);

	// Turn on the interrupt for UART1-RX
	ConfigIntUART1(UART_ERR_INT_DIS | UART_RX_INT_EN | UART_INT_PR2 |
		UART_INT_SUB_PR0 | UART_TX_INT_DIS);

	// Turn on the multiple Interrupt Vectors
	INTEnableSystemMultiVectoredInt();
}

// Create all FreeRTOS Objects - i.e. queues, semaphores, traces, etc.
static unsigned int createRTOSObjects() {
	// Turn on the TraceAlyzer
	// -> Also assign user-event labels to each of the TraceAlyzer Channels
	if (configUSE_TRACE_FACILITY) {
		vTraceEnable(TRC_START);	// Initialize and start recording
		trace_cn = xTraceRegisterString("Change Notice");
		trace_heartbeat = xTraceRegisterString("1ms LEDC Heartbeat");
		trace_uartRX_isr = xTraceRegisterString("UART RX ISR");
		trace_send_msg_eeprom = xTraceRegisterString("EEPROM Writing Task");
		trace_read_eeprom = xTraceRegisterString("EEPROM Reading Task");
	}

	// Create the semaphore needed for the CN ISR to trigger a handler task
	vSemaphoreCreateBinary(cn_semaphore);
	if (cn_semaphore == NULL)
		return TRUE;	// Error creating the semaphore

	// Create the EEPROM read queue
	eeprom_read_queue = xQueueCreate(MAX_NUM_MSGS, sizeof(unsigned int));
	if (eeprom_read_queue == NULL)
		return TRUE;	// Error creating the queue
} 

// Create all FreeRTOS tasks needed for this project
static unsigned int createTasks() {
	BaseType_t task_success;
	// Create the CN ISR handler task
	task_success = xTaskCreate(task_changeNoticeHandler, "CN ISR Handler Task",
							   configMINIMAL_STACK_SIZE, NULL, CN_HANDLER_TASK_PRIORITY, NULL);
	// Create the send-to-EEPROM task
	task_success |= xTaskCreate(task_sendMessageEEPROM, "Sending Messages to EEPROM Task",
								configMINIMAL_STACK_SIZE, NULL, EEPROM_SEND_TASK_PRIORITY, NULL);
	
	// Error creating a task - return a failure
	if (task_success != pdPASS)
		return TRUE; 
}

// ISR for UART1 RX and TX
// void __ISR(_UART1_VECTOR, IPL2SOFT) isr_uart1Handler() {
void isr_uartRXHandler(void) {
	// The RX and TX flags trigger the same interrupt vector
	// Was this specifically the RX flag?
	portBASE_TYPE move_to_higher_priority = pdFALSE;
	if (INTGetFlag(INT_SOURCE_UART_RX(UART1))) {
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_uartRX_isr, "Entering C-Portion of UART-RX ISR");
		// Maybe echo the new character?

		// Add the current character to the current character string
		// -> If the return was TRUE, it's the EOL and give semaphore to send message to EEPROM
		if (getStrU1(current_uart_input, sizeof(current_uart_input))) {
			xSemaphoreGiveFromISR(send_to_eeprom, &move_to_higher_priority);
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_uartRX_isr, "Detected a complete message - Giving semaphore");
		}

		// Clear the RX Interrupt Flag
		// INTClearFlag(INT_SOURCE_UART_RX(UART1));
		// mU1RXClearIntFlag(); 
		mU1ClearAllIntFlag();

		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_uartRX_isr, "Exiting C-Portion of UART-RX ISR");
	}

	// Was this the TX Flag? Clear it right away
	if (INTGetFlag(INT_SOURCE_UART_TX(UART1)))
		INTClearFlag(INT_SOURCE_UART_TX(UART1));

	// Exit the ISR, returning to the higher priority task if necessary
	portEND_SWITCHING_ISR(move_to_higher_priority);
}

// This task is unblocked when the incoming UART message is finished
// This task writes the message to the EEPROM then adds that memory location to the read queue
// While the queue is being written to the EEPROM / reset, interrupts are disabled
static void task_sendMessageEEPROM(void *task_params) {
	unsigned int i = 0; // Used for iterating over message buffer
	portBASE_TYPE queue_status;
	// Try and take the semaphore to start (no delay) in case it was given
	// before the task started
	xSemaphoreTake(send_to_eeprom, 0);
	for (;;) {
		// Wait for the send-to-EEPROM semaphore forever
		// -> Only unblocks when the UART-RX ISR detects a completed message
		xSemaphoreTake(send_to_eeprom, portMAX_DELAY);
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_send_msg_eeprom, "Received the semaphore");

		// Disable interrupts
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_send_msg_eeprom, "Disabling interrupts");
		INTDisableInterrupts();

		// Write the UART message to the EEPROM
		unsigned int write_error = NO_ERR;
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_send_msg_eeprom, "Writing to the EEPROM");
		write_error = write_eeprom(EEPROM_SLAVE_ADDR, eeprom_write_addr, current_uart_input, UART_MAX_NUM_CHARS);
		if (write_error && configUSE_TRACE_FACILITY)
			vTracePrint(trace_send_msg_eeprom, "An error occurred while writing to the EEPROM");

		// Add the latest message's starting position to the READ queue
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_send_msg_eeprom, "Added EEPROM memory address to read Queue");
		queue_status = xQueueSendToBack(eeprom_read_queue, &eeprom_write_addr, 0);
		if (configUSE_TRACE_FACILITY && queue_status == errQUEUE_FULL)
			vTracePrint(trace_send_msg_eeprom, "Error adding to read Queue: Queue full");

		// Increase the memory address where we're currently writing to on the EEPROM - don't run over 'x' messages
		eeprom_write_addr += message_length;
		eeprom_write_addr %= UART_MAX_NUM_CHARS * MAX_NUM_MSGS;

		// Clear the message buffer - prevents long messages from being rewritten to the EEPROM
		for (i = 0; i < UART_MAX_NUM_CHARS; i++)
			current_uart_input[i] = 0;

		// Turn interrupts back on
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_send_msg_eeprom, "Reenabling interrupts");
		INTEnableInterrupts();
	}
}

// This function is called when the CN ISR triggers
// Clears the CN flag and gives a semaphore to unblock the handler TASK
void isr_changeNoticeHandler(void) {
	// Flag for if returning to a higher priority task is necessary
	portBASE_TYPE move_to_higher_priority = pdFALSE;
	
	// Give the semaphore to unlock the task
	xSemaphoreGiveFromISR(cn_semaphore, &move_to_higher_priority);
	if (configUSE_TRACE_FACILITY)
		vTracePrint(trace_cn, "Giving semaphore from CN ISR");
	
	// Clear the interrupt flag
	mCNClearIntFlag();
	mCNOpen(CN_OFF, (CN8_ENABLE), 0);
	
	// Exit the ISR, returning to the higher priority task if necessary
	portEND_SWITCHING_ISR(move_to_higher_priority);
}

// This is the handler TASK that executes the CN code
// Unblocks only from the CN ISR
static void task_changeNoticeHandler(void *task_params) {
	unsigned int new_BTN1_status = 0;
	// Try and take the semaphore to start (no delay) in case it was given
	// before the task started
	xSemaphoreTake(cn_semaphore, 0);
	
	for (;;) {
		// Wait for the semaphore forever
		// -> this only unblocks when the semaphore is GIVEN by the ISR
		// -> this take is also noted in Tracealyzer
		xSemaphoreTake(cn_semaphore, portMAX_DELAY);
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_cn, "Received the semaphore in handler");
		
		// Debounce the task for (x) milliseconds
		// -> note this in Tracealyzer
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_cn, "Debouncing button in handler");
		vTaskDelay(MS_TO_TICKS(DEBOUNCE_TIME_MS));
		
		//  Read BTN1
		new_BTN1_status = PORTG & BTN1; // Read BTN1 
		if (previous_BTN1_status == 0 && new_BTN1_status > 0) {
			// Button PRESS
		}
		
		// Update the previous button status
		previous_BTN1_status = new_BTN1_status;
	}
}

// This task reads from the EEPROM - Only unblocked when the read queue has items in it
static void task_readMessageEEPROM(void* task_params) {
	portBASE_TYPE queue_status;
	unsigned int eeprom_read_addr;	// The memory address to read from

	for (;;) {
		// Try and read from the queue forever
		queue_status = xQueueReceive(eeprom_read_queue, &eeprom_read_addr, portMAX_DELAY);
		char latest_message[UART_MAX_NUM_CHARS] = {0}; 
	}
}

// Function to return how many characters are in the message buffer
// -> Increments until the return or null character is found
static unsigned int getMessageLength(char* message_buffer, unsigned int max_buffer_length) {
	unsigned int current_size = 0; // Current size of the buffer
	while (max_buffer_length--) {
		if (message_buffer[current_size++] == '\r' || message_buffer[current_size] == '\0')
			return current_size - 1;
	}

	return max_buffer_length;
}

/* The below functions are overwriting FreeRTOS tasks for specific functionality */

// Tick hook task that toggles LEDC every 1ms 
void vApplicationTickHook(void) {
	// Note the LEDB toggle in TraceAlyzer
	if (configUSE_TRACE_FACILITY) 
		vTracePrint(trace_heartbeat, "Toggling LEDC");
	
	LATBINV = LEDC; // Invert LEDC
}

// Idle task sets LEDA to the status of BTN1
void vApplicationIdleHook(void) {
	
}

// Function that is called whenever a stack overflows
void vApplicationStackOverflowHook() {
	for(;;) {}
}

// Generic exception handler
void _general_exception_handler(unsigned long ulCause, unsigned long ulStatus) {
	for(;;) {}
}