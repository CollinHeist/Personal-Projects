/** 
 *	@file 	main.c
 *	@brief	Main program file, displays the temperature of the IR sensor
 *			connected via I2C1 on the LCD every 5 milliseconds.
 *	@author	Collin Heist
 **/

/* ----------------------------- Included Files ----------------------------- */
// Hardware dependent setting
#include "chipKIT_Pro_MX7.h"
#include <plib.h>

// FreeRTOS includes
#include "FreeRTOS.h"		// FreeRTOS API
#include "FreeRTOSConfig.h"	// FreeRTOS configuration
#include "task.h"			// Generic task
#include "queue.h"			// Queues
#include "semphr.h"			// Semaphore

// File-Header includes
#include "main.h"
#include "LCDlib.h"
#include "SMBus_IR.h"

/* -------------------------- Function Prototypes --------------------------- */
// CN ISR for button presses - Directly calls wrapper function
void __ISR(_CHANGE_NOTICE_VECTOR, IPL2) isr_change_notice_wrapper(void);
static void initialize_hardware();
static unsigned int create_RTOS_objects();
static unsigned int create_tasks();
static void task_cn_generator(void* task_params);
static void task_change_notice_handler(void* task_params);
static void task_display_lcd(void* task_params);
static void task_leda_toggle(void* task_params);

/* ---------------------------- Global Variables ---------------------------- */
xSemaphoreHandle cn_semaphore;		// Semaphore for unblocking the handler task from the CN ISR when BTN1 is pressed

xQueueHandle lcd_string_queue;		// Queue that contains pointer to string to display on LCD

#if (configUSE_TRACE_FACILITY == 1)
	traceString trace_cn;			// TraceAlyzer channel for logging change notice events
	traceString trace_lcd;			// TraceAlyzer channel for logging LCD events
	traceString trace_leda_toggle;	// TraceAlyzer channel for logging the 3ms toggle of LEDA
#endif

/* ------------------------------ Main Program ------------------------------ */
int main() {
	// Initialize and configure the hardware
	initialize_hardware();

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

/**
 *	@brief	Initialize the hardware / modules required for this project.
 *	@return	None.
 */
static void initialize_hardware() {
	chipKIT_PRO_MX7_Setup();	// Set up board
	initialize_LCD();			// Initialize the LCD
	initialize_ir_sensor();		// Initialize the IR Sensor

	// Set up LEDs
	PORTSetPinsDigitalOut(IOPORT_B, SM_LEDS);
	LATBCLR = SM_LEDS;

	// Enable the CN interrupt
	mCNOpen(CN_ON, CN8_ENABLE, 0);
	mCNSetIntPriority(1);
	mCNSetIntSubPriority(0);
	unsigned int x = PORTReadBits(IOPORT_G, BTN1);
	mCNClearIntFlag();
	mCNIntEnable(1);

	// Turn on the multiple interrupt Vectors
	INTEnableSystemMultiVectoredInt();
}

/**
 *	@brief	Create all the FreeRTOS objects for this project.
 *	@return	Boolean flag (TRUE or FALSE) if there was an error or not.
 */
static unsigned int create_RTOS_objects() {
	// Turn on the TraceAlyzer - assign user event labels to each channel
	if (configUSE_TRACE_FACILITY) {
		vTraceEnable(TRC_START);
		trace_cn = xTraceRegisterString("Change Notice");
		trace_lcd = xTraceRegisterString("LCD");
		trace_leda_toggle = xTraceRegisterString("LEDA Toggle");
	}

	// Create the semaphore needed for the CN ISR -> Handler, and UART-RX ISR -> Handler
	vSemaphoreCreateBinary(cn_semaphore);
	if (cn_semaphore == NULL)
		return TRUE;	// Error creating the semaphore(s)

	// Create the lcd string queue
	lcd_string_queue = xQueueCreate(1, (LCD_WIDTH + 1) * sizeof(char));
	if (!lcd_string_queue)
		return TRUE;	// Error creating the queue

	return FALSE;
}

/**
 *	@brief	Create all the FreeRTOS tasks for this project.
 *	@return	Boolean flag (TRUE or FALSE) if there was an error or not.
 */
static unsigned int create_tasks() {
	BaseType_t task_success;	// Whether the task creation(s) were successful

	// Create the CN ISR handler task
	task_success = xTaskCreate(task_cn_generator, "Change Notice Generator Task",
		configMINIMAL_STACK_SIZE, NULL, TASK_CN_GENERATOR_PRIORITY, NULL);
	// Create the write-to-EEPROM task
	task_success |= xTaskCreate(task_change_notice_handler, "CN ISR Handler Task",
		configMINIMAL_STACK_SIZE, NULL, TASK_CN_ISR_HANDLER_PRIORITY, NULL);
	// Create the read-from-EEPROM task
	task_success |= xTaskCreate(task_display_lcd, "Display Formatted Message on LCD Task",
		configMINIMAL_STACK_SIZE, NULL, TASK_DISPLAY_LCD_MSG_PRIORITY, NULL);
	// Create the 1ms heartbeat task
	task_success |= xTaskCreate(task_leda_toggle, "LEDA Blink Task",
		configMINIMAL_STACK_SIZE, NULL, TASK_LEDA_TOGGLE_PRIORITY, NULL);

	// Error creating a task - return a failure
	if (task_success != pdPASS)
			return TRUE; 

	return FALSE;
}

/* --------------------------- 'Normal' Functions --------------------------- */

/**
 *	@brief		FreeRTOS task that generates a CN interrupt every 5 milliseconds.
 *	@param[in]	task_params		Contains the parameters for this task - not used.
 *	@return		None.
 */
static void task_cn_generator(void* task_params) {
	const TickType_t task_frequency_ticks = MS_TO_TICKS(5);			//< How many ticks to wait
	TickType_t last_time_awake = xTaskGetTickCount();
	for (;;) {
		INTSetFlag(INT_CN);										 	//< Turn on CN flag
		vTaskDelayUntil(&last_time_awake, task_frequency_ticks);	//< Delay again
	}
}

/**
 *	@brief	Change Notice ISR wrapper. Unblocks the CN handler task.
 *	@return	None.
 */
void isr_change_notice_handler() {
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

/**
 *	@brief		Change Notice Handler task. Reads the object temperature, loads string pointer into the queue.
 *	@param[in]	task_params		Contains the parameters for this task - not used.
 *	@return		None.
 */
static void task_change_notice_handler(void* task_params) {
	float temp = 0.0;						//< Current temperature as read by the IR Sensor
	char lcd_message[LCD_WIDTH+1] = {0};	//< String to contain the formatted LCD message
	portBASE_TYPE queue_status;				//< Status of adding to LCD queue
	
	xSemaphoreTake(cn_semaphore, 0);
	for (;;) {
		// Wait for the change notice semaphore forever
		// This only unblocks when the change notice handler detects a completed message
		xSemaphoreTake(cn_semaphore, portMAX_DELAY);
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_cn, "Received semaphore, reading from IR sensor");
		
		// Read the temperature from the IR Sensor
		temp = read_ir_temp();
		if (temp == ERROR_TEMP) {
			// If an error occurred while reading from the sensor
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_cn, "Error in temperature reading");
		}
		else {
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_cn, "Temperature read successfully - adding to Queue");
			sprintf(lcd_message, "Temp: %3.1f", temp);
			
			// Add to the Queue
			queue_status = xQueueSendToBack(lcd_string_queue, &lcd_message, portMAX_DELAY);
			if (configUSE_TRACE_FACILITY && queue_status == errQUEUE_FULL)
				vTracePrint(trace_cn, "Unable to add to Queue, Queue is full");
		}
	}
}

/*!
 *	@brief		Task that displays a message on the LCD.
 *	@param[in]	task_params		Contains the parameters for this task - not used.
 *	@return		None.
 */
static void task_display_lcd(void* task_params) {
	char lcd_message[LCD_WIDTH+1] = {0};	//< String to contain the formatted LCD message
	unsigned int i = 0;
	for (;;) {
		// Block forever trying to read message to queue
		xQueueReceive(lcd_string_queue, &lcd_message, portMAX_DELAY);
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_lcd, "Received pointer from Queue - writing to LCD");
		
		// Start at the beginning of the LCD, write the message
		set_cursor_LCD(FIRST_LINE_START);
		put_string_LCD(lcd_message);
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_lcd, "Message written to LCD, waiting for value in Queue");
		
		// Clear out the LCD buffer
		for (i = 0; i < LCD_WIDTH + 1; i++)
			lcd_message[i] = '\0';
	}
}

/**
 *	@brief		Task to toggle LEDA every 3 milliseconds.
 *	@param[in]	task_params that contains the parameters for this task - not used.
 *	@return		None.
 */
static void task_leda_toggle(void* task_params) {
	unsigned int t_wait, t_start;
	
	for (;;) {
		t_start = ReadCoreTimer();
		t_wait = CORE_MS_TICK_RATE * LEDA_TOGGLE_MS;
		// Do nothing while waiting for the desired time to pass
		while (ReadCoreTimer() - t_start < t_wait);
		LATBINV = LEDA;
	}
}

/* --------------------------- 'Helper' Functions --------------------------- */


/* --------------------- FreeRTOS Functional Functions ---------------------- */

/**
 *	@brief	Tick Hook function that is called on task switches.
 *	@return	None.
 */
void vApplicationTickHook(void) {
	
}

/**
 *	@brief	Idle hook function that operates when no tasks are running.
 *	@return	None.
 */
void vApplicationIdleHook(void) {

}

/**
 *	@brief	Function that is called whenever a stack overflows
 */
void vApplicationStackOverflowHook() {
	for(;;) {}
}

/**
 *	@brief		Generic exception handler - Called when an error occurs during runtime.
 *	@param[in]	ulCause		The cause of the error.
 *	@param[in]	ulStatus 	The status of the error.
 */
void _general_exception_handler(unsigned long ulCause, unsigned long ulStatus) {
	for(;;) {}
}