/** 
 * @file 	main.c
 * @brief 	Main program file, _________________________
 * @author	Collin Heist
 **/

/* ----------------------------- Included Files ----------------------------- */
#include <plib.h>

// FreeRTOS includes
#include "FreeRTOS.h"		// FreeRTOS API
#include "FreeRTOSConfig.h"	// FreeRTOS configuration
#include "task.h"			// Generic task
#include "queue.h"			// Queues
#include "semphr.h"			// Semaphore

// Hardware dependent setting
#include "chipKIT_Pro_MX7.h"

// File-Header includes
#include "main.h"
#include "LCDlib.h"
#include "SMBus_IR.h"
#include "CAN.h"

/* --------------------------- Function Prototypes -------------------------- */
// CN ISR for button presses - Directly calls wrapper function
void __ISR(_CHANGE_NOTICE_VECTOR, IPL2) isr_change_notice_wrapper(void);

/* ---------------------------- Global Variables ---------------------------- */
xSemaphoreHandle cn_semaphore;		// Semaphore for unblocking the handler task from the CN ISR when BTN1 is pressed

xQueueHandle lcd_string_queue;		// Queue that contains pointer to string to display on LCD

typedef enum MODE_STATES {CONFIGURATION_MODE, OPERATIONAL_MODE} current_state;

float latest_temp;					// Current temperature as read by the IR Sensor
float latest_rps;					// Current RPS of the motor
float rps_buffer[SPEED_BUFFER_LEN];	// Buffer of previous RPS readings
float latest_pwm_setting;			// Current PWM setting to the motor

unsigned int previous_BTN1_status;	// Previous status of BTN1 (used to detect PRESSES)

#if (configUSE_TRACE_FACILITY == 1)
	traceString trace_cn;			   // TraceAlyzer channel for logging change notice events
	traceString trace_lcd;			  // TraceAlyzer channel for logging LCD events
	traceString trace_leda_toggle;	  // TraceAlyzer channel for logging the 3ms toggle of LEDA
#endif

/* ------------------------------ Main Program ------------------------------ */
int main() {
	// Initialize and configure the hardware
	initialize_hardware();

	// Initialize the state machine
	current_state = CONFIGURATION_MODE;

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
 *	@brief	Initialize the hardware resources required for this project.
 *	@param	None.
 *	@return	None.
 **/
static void initialize_hardware() {
	chipKIT_PRO_MX7_Setup();		// Set up board
	initialize_LCD();			   // Initialize the LCD
	initialize_ir_sensor();		 // Initialize the IR Sensor

	// Set up LEDs
	PORTSetPinsDigitalOut(IOPORT_B, SM_LEDS);
	LATBCLR = SM_LEDS;
	
	// Configure BTN1-3
	PORTSetPinsDigitalIn(IOPORT_G, BTN1 | BTN2);
	PORTSetPinsDigitalIn(IOPORT_A, BTN3); 
	
	// Input Capture Initialization
	PORTSetPinsDigitalIn(IOPORT_D, BIT_3 | BIT_12);	// Tachometer inputs
	mIC5ClearIntFlag();	
	OpenCapture5(IC_ON | IC_CAP_16BIT | IC_IDLE_STOP | IC_FEDGE_FALL | IC_TIMER3_SRC | IC_INT_1CAPTURE | IC_EVERY_FALL_EDGE);
	ConfigIntCapture(IC_INT_ON | IC_INT_PRIOR_3 | IC_INT_SUB_PRIOR_0);

	// Enable the CN interrupt for BTN1
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
 *	@param	None.
 *	@return	Boolean flag (TRUE or FALSE) if there was an error or not.
 **/
static unsigned int create_RTOS_objects() {
	/// Turn on the TraceAlyzer - assign user event labels to each channel
	if (configUSE_TRACE_FACILITY) {
		vTraceEnable(TRC_START);
		trace_cn = xTraceRegisterString("Change Notice");
		trace_lcd = xTraceRegisterString("LCD");
		trace_leda_toggle = xTraceRegisterString("LEDA Toggle");
	}

	/// Create the semaphore needed for the CN ISR -> Handler, and UART-RX ISR -> Handler
	vSemaphoreCreateBinary(cn_semaphore);
	if (cn_semaphore == NULL)
		return TRUE;	// Error creating the semaphore(s)

	/// Create the lcd string queue
	lcd_string_queue = xQueueCreate(1, (LCD_WIDTH + 1) * sizeof(char));
	if (!lcd_string_queue)
		return TRUE;	// Error creating the queue

	return FALSE;
}

/**	
 *	@brief	Create all the FreeRTOS tasks for this project.
 *	@param	None.
 *	@return	Boolean flag (TRUE or FALSE) if there was an error or not.
 **/
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
 *	@brief	ISR for the input capture module. Adds the latest reading to the rps_buffer.
 *	@param	None.
 *	@return	None.
 **/
void __ISR(_INPUT_CAPTURE_5_VECTOR, IPL3) isr_input_capture (void) {
	unsigned int input_buffer[4] = {0};
	static unsigned short int new_capture = 0;
	static unsigned short int old_capture = 0;
	unsigned short int delta_t = 0;

	// Read the input capture FIFO and increment variables
	ReadCapture5(input_buffer);
	new_capture = input_buffer[0];
	delta_t = new_capture - old_capture;
	old_capture = new_capture;

	// Compute the newest rev/s calculation, add to the buffer
	float rev_per_sec = 10.0E6 / 256.0 / (float) delta_t;
	unsigned int i = 0;
	for (i = SPEED_BUFFER_LEN - 1; i > 0; i--)	// Loop through buffer, shift elements down
			rps_buffer[i] = rps_buffer[i-1];
	rps_buffer[0] = rev_per_sec;

	mIC5ClearIntFlag();	// Clear interrupt flag
}

/* --------------------------------- Tasks ---------------------------------- */

/**	
 *	@brief		FreeRTOS task that reads the temperature and motor speed buffer.
 *	@param[in]	Void Pointer that contains the parameters for this task - not used.
 *	@return		None.
 **/
static void task_read_IO(void* task_params) {
	const TickType_t task_frequency_ticks = MS_TO_TICKS(IO_FREQ_MS);
	TickType_t last_time_awake = xTaskGetTickCount();
	for (;;) {
		// Read the temperature and calculate the average RPS - update the global variables
		latest_temp = read_ir_temp();
		latest_rps = average_rps_calculator();

		// Attempt to refill the RTR buffer if necessary
		CAN2_refill_RTR_buffer(latest_temp, latest_rps, latest_pwm_setting);
		
		vTaskDelayUntil(&last_time_awake, task_frequency_ticks);	// Wait
	}
}

/**	
 *	@brief		FreeRTOS task that sends an RTR from CAN1 to CAN2
 *	@param[in]	Void Pointer that contains the parameters for this task - not used.
 *	@return		None.
 **/
static void task_send_RTR(void* task_params) {
	const TickType_t task_frequency_ticks = MS_TO_TICKS(RTR_FREQ_MS);
	TickType_t last_time_awake = xTaskGetTickCount();
	for (;;) {
		CAN1_send_RTR();	// Send RTR through CAN1 to CAN2
		
		vTaskDelayUntil(&last_time_awake, task_frequency_ticks);	// Wait
	}
}

/**	
 *	@brief	Change Notice ISR wrapper. Unblocks the CN handler task.
 *	@param	None.
 *	@return	None.
 **/
void isr_change_notice_handler(void) {
	// Flag for if returning to a higher priority task is necessary
	portBASE_TYPE move_to_higher_priority = pdFALSE;

	// Give the semaphore to unlock the task
	if (configUSE_TRACE_FACILITY)
		vTracePrint(trace_cn, "Giving semaphore from CN ISR");
	xSemaphoreGiveFromISR(cn_semaphore, &move_to_higher_priority);

	// Clear the interrupt flag
	mCNClearIntFlag();
	mCNOpen(CN_OFF, CN8_ENABLE, 0);

	// Exit the ISR, returning to the higher priority task if necessary
	portEND_SWITCHING_ISR(move_to_higher_priority);
}

/**
 *	@brief		Change Notice Handler task. Changes the current state on presses
 *	@param[in]	(void*) that contains the parameters for this task - not used.
 *	@return		None.
 **/
static void task_change_notice_handler(void* task_params) {
	portBASE_TYPE queue_status;			 	// Status of adding to LCD queue
	unsigned int current_BTN1_status = 0;	// Current status of BTN1
	
	xSemaphoreTake(cn_semaphore, 0);
	for (;;) {
		// Wait for the change notice semaphore forever
		// This only unblocks when the change notice handler detects a completed message
		xSemaphoreTake(cn_semaphore, portMAX_DELAY);
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_cn, "Received semaphore - debouncing");

		vTaskDelay(MS_TO_TICKS(DEBOUNCE_MS));	// Debounce
		current_BTN1_status = PORTG & BTN1;

		// Make sure this was a PRESS only
		if (previous_BTN1_status == 0 && current_BTN1_status) {
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_cn, "Button press detected - changing control modes");

			// Transition to the next state
			current_state = (current_state == CONFIGURATION_MODE) ? OPERATIONAL_MODE : CONFIGURATION_MODE;
		}
		
		previous_BTN1_status = current_BTN1_status;	// Update button status
	}
}


/* --------------------------- 'Helper' Functions --------------------------- */

/**	
 *  @brief	Function to calculate the average RPS from the global rps_buffer.
 *  @param  None.
 *  @return	None.
 **/
float average_rps_calculator(void) {
	float avg = 0;	  // Current average
	unsigned int i = 0; // Iterating variable
	for (i = 0; i < SPEED_BUFFER_LEN; i++)
		avg += rps_buffer[i];
				
	return (avg / ((float) SPEED_BUFFER_LEN));
}

/* --------------------- FreeRTOS Functional Functions ---------------------- */

// Tick hook task
void vApplicationTickHook(void) {
	
}

// Idle task
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