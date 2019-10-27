/** 
 *	@file 	main.c
 *	@brief 	Main program file, implements a temperature-based remote motor control
 * 			program over the CAN network.
 *	@author	Collin Heist
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
#include "LCDlib.h"			// LCD Library
#include "SMBus_IR.h"		// IR Sensor
#include "CAN.h"			// CAN implementation
#include "PWM.h"			// PWM

/* --------------------------- Function Prototypes -------------------------- */
// CN ISR for button presses - Directly calls wrapper function
void __ISR(_CHANGE_NOTICE_VECTOR, IPL2) isr_change_notice_wrapper(void);

/* ---------------------------- Global Variables ---------------------------- */
xSemaphoreHandle cn_semaphore;		// Semaphore for unblocking the handler task from the CN ISR when BTN1 is pressed

typedef enum MODE_STATES {CONFIGURATION_MODE, OPERATIONAL_MODE} current_state;

float latest_temp;					// Current temperature as read by the IR Sensor
float latest_rps;					// Current RPS of the motor
float latest_pwm_setting;			// Current PWM setting to the motor

float rps_buffer[SPEED_BUFFER_LEN];	// Buffer of previous RPS readings

unsigned int previous_BTN1_status;	// Previous status of BTN1 (used to detect PRESSES)

#if (configUSE_TRACE_FACILITY == 1)
	traceString trace_IO;			// TraceAlyzer channel for logging change notice events
	traceString trace_RTR;			// TraceAlyzer channel for RTR events
	traceString trace_CN;			// TraceAlyzer channel for change notice events
	traceString trace_control_fsm;	// TraceAlyzer channel for the Control Unit FSM
#endif

/* ------------------------------ Main Program ------------------------------ */
int main() {
	// Initialize and configure the hardware
	initialize_hardware();

	// Initialize the state machine to config mode
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
	chipKIT_PRO_MX7_Setup();				// Set up board
	initialize_LCD();						// Initialize the LCD
	initialize_ir_sensor();					// Initialize the IR Sensor
	initialize_pwm(0, PWM_FREQUENCY_HZ);	// Initialize the PWM module 

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
	// Turn on the TraceAlyzer - assign user event labels to each channel
	if (configUSE_TRACE_FACILITY) {
		vTraceEnable(TRC_START);
		trace_IO = xTraceRegisterString("IO");
		trace_RTR = xTraceRegisterString("RTR");
		trace_CN = xTraceRegisterString("Change Notice");
		trace_control_fsm = xTraceRegisterString("Control Unit FSM")
	}

	// Create the semaphore needed for the CN ISR -> Handler, and UART-RX ISR -> Handler
	vSemaphoreCreateBinary(cn_semaphore);
	if (cn_semaphore == NULL)
		return TRUE;	// Error creating the semaphore(s)

	return FALSE;
}

/**	
 *	@brief	Create all the FreeRTOS tasks for this project.
 *	@param	None.
 *	@return	Boolean flag (TRUE or FALSE) if there was an error or not.
 **/
static unsigned int create_tasks() {
	BaseType_t task_success;	// Whether the task creation(s) were successful

	task_success = xTaskCreate(task_read_IO, "Temperature and Motor Speed Reading Task",
		configMINIMAL_STACK_SIZE, NULL, TASK_READ_IO_PRIORITY, NULL);
	task_success |= xTaskCreate(task_send_RTR, "RTR Sending Task",
		configMINIMAL_STACK_SIZE, NULL, TASK_CN_ISR_HANDLER_PRIORITY, NULL);
	task_success |= xTaskCreate(task_change_notice_handler, "Change Notice Handler Task",
		configMINIMAL_STACK_SIZE, NULL, TASK_CHANGE_NOTICE_PRIORITY, NULL);
	task_success |= xTaskCreate(task_control_FSM, "Control Unit FSM Task",
		configMINIMAL_STACK_SIZE, NULL, TASK_CONTROL_FSM_PRIORITY, NULL);
	task_success |= xTaskCreate(task_update_pwm, "PWM Updating Task",
		configMINIMAL_STACK_SIZE, NULL, TASK_UPDATE_PWM_PRIORITY, NULL);

	// Error creating a task - return failure
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
	if (configUSE_TRACE_FACILITY)
		vTracePrint(trace_IO, "Input Capture interrupt triggered. Reading speed");
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
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_IO, "Reading IO values. Attempting to refill RTR Buffer");
		// Read the temperature and calculate the average RPS - update the global variables
		latest_temp = read_ir_temp();
		latest_rps = average_rps_calculator();

		// Attempt to refill the RTR buffer if necessary
		CAN2_refill_RTR_buffer(latest_temp, latest_rps, latest_pwm_setting);
		
		vTaskDelayUntil(&last_time_awake, task_frequency_ticks);	// Wait
	}
}

/**	
 *	@brief		FreeRTOS task that sends an RTR from CAN1 to CAN2 every RTR_FREQ_MS milliseconds.
 *	@param[in]	Void Pointer that contains the parameters for this task - not used.
 *	@return		None.
 **/
static void task_send_RTR(void* task_params) {
	const TickType_t task_frequency_ticks = MS_TO_TICKS(RTR_FREQ_MS);
	TickType_t last_time_awake = xTaskGetTickCount();
	for (;;) {
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_RTR, "Sending RTR from CAN1 to CAN2");
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
		vTracePrint(trace_CN, "Giving semaphore from CN ISR");
	xSemaphoreGiveFromISR(cn_semaphore, &move_to_higher_priority);

	// Clear the interrupt flag
	mCNClearIntFlag();
	mCNOpen(CN_OFF, CN8_ENABLE, 0);

	// Exit the ISR, returning to the higher priority task if necessary
	portEND_SWITCHING_ISR(move_to_higher_priority);
}

/**
 *	@brief		Change Notice Handler task. Changes the current state on presses of BTN1.
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
			vTracePrint(trace_CN, "Received semaphore - debouncing");

		vTaskDelay(MS_TO_TICKS(DEBOUNCE_MS));	// Debounce
		current_BTN1_status = PORTG & BTN1;

		// Make sure this was a PRESS only
		if (previous_BTN1_status == 0 && current_BTN1_status) {
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_CN, "Button press detected - changing control modes");

			// Transition to the next state
			current_state = (current_state == CONFIGURATION_MODE) ? OPERATIONAL_MODE : CONFIGURATION_MODE;
		}
		
		previous_BTN1_status = current_BTN1_status;	// Update button status
	}
}

/**	
 *	@brief		FreeRTOS task that implements the two control unit modes.
 *	@param[in]	Void Pointer that contains the parameters for this task - not used.
 *	@return		None.
 **/
static void task_control_FSM(void* task_params) {
	char top_lcd_str[18] = {'\0'};					// Character string written to top of the LCD
	char bottom_lcd_str[18] = {'\0'};				// Character string written to the bottom of the LCD
	float temp = 0, rps = 0, pwm = 0;				// Values read from the CAN1 RX channel
	float pwm_low_point = 0, pwm_high_point = 0;	// Set points for low/high PWM
	float desired_pwm = 0;							// Desired PWM based on temperature reading

	for (;;) {
		// Clear both string buffers
		clear_string_buffer(top_lcd_str, sizeof(top_lcd_str));
		clear_string_buffer(bottom_lcd_str, sizeof(bottom_lcd_str));

		// Implement the 'FSM' as a switch-case
		switch (current_state) {
			case CONFIGURATION_MODE:
				if (configUSE_TRACE_FACILITY)
					vTracePrint(trace_control_fsm, "In CONFIGURATION mode");

				// Format the string in the given format (--temp.x--) only if a temperature has been read
				if (temp == 0)
					strcpy(top_lcd_str, "                ");
				else
					sprintf(top_lcd_str, "      %02.1f      ", temp);

				// Write the temperature string to the first line of the LCD
				set_cursor_LCD(FIRST_LINE_START);
				put_string_LCD(top_lcd_str);

				// If BTN3 is pressed, update the PWM low point
				pwm_low_point = (PORTA & BTN3) ? temp : pwm_low_point;

				// If BTN2 is pressed, update the PWM high point
				pwm_high_point = (PORTG & BTN2) ? temp : pwm_high_point;

				// Clear the low / high points if high < low
				pwm_low_point = (pwm_high_point < pwm_low_point) ? 0 : pwm_low_point;
				pwm_high_point = (pwm_high_point < pwm_low_point) ? 0 : pwm_high_point;

				// If the low and high points are zero, the bottom lcd string is empty
				if (pwm_low_point == 0 && pwm_high_point == 0)
					strcpy(bottom_lcd_str, "                ");
				else
					sprintf(bottom_lcd_str, "%02.1f        %02.1f", pwm_low_point, pwm_high_point);

				// Write the string to the 2nd line of the LCD
				set_cursor_LCD(SECOND_LINE_START);
				put_string_LCD(bottom_lcd_str);
				break;
			case OPERATIONAL_MODE:
				if (configUSE_TRACE_FACILITY)
					vTracePrint(trace_control_fsm, "In OPERATIONAL mode");

				// Read from the CAN1 RX channel
				if (CAN1_process_RX(&temp, &rps, &pwm) == CAN_MESSAGE_RECIEVED) {
					if (configUSE_TRACE_FACILITY)
						vTracePrint(trace_control_fsm, "RTR was responded to by CAN2 - updating LCD");
					// A message WAS received - update the LCD
					sprintf(top_lcd_str, "%02.0f%%         %03.2f", pwm, rps);
					sprintf(bottom_lcd_str, "%02.1f  %02.1f  %02.1f", pwm_low_point, temp, pwm_high_point);

					// Write the messsage to the LCD line-by-line
					set_cursor_LCD(FIRST_LINE_START);
					put_string_LCD(top_lcd_str);
					set_cursor_LCD(SECOND_LINE_START);
					put_string_LCD(bottom_lcd_str);

					// Calculate the desired PWM value and send that to CAN2
					if (temp < pwm_low_point)
						desired_pwm = PWM_MIN_VAL;
					else if (temp > pwm_high_point)
						desired_pwm = PWM_MAX_VAL;
					else
						desired_pwm = (PWM_LINEAR_MAX - PWM_LINEAR_MIN) * (temp - pwm_low_point) / (pwm_high_point - pwm_low_point) + PWM_LINEAR_MIN;

					if (configUSE_TRACE_FACILITY)
						vTracePrint(trace_control_fsm, "Sending desired PWM setting to CAN2");
					CAN1_send_TX(desired_pwm);
				}
				break;
		}

		taskYIELD();	// Allow other tasks to run
	}
}

/**	
 *	@brief		FreeRTOS task that gets the CAN2 RX channel for new PWM settings
 *	@param[in]	Void Pointer that contains the parameters for this task - not used.
 *	@return		None.
 **/
static void task_update_pwm(void* task_params) {
	float desired_pwm = 0;
	for (;;) {
		if (CAN2_process_RX(&desired_pwm) == CAN_MESSAGE_RECIEVED) {
			if (configUSE_TRACE_FACILITY)
				vTracePrint(trace_IO, "New PWM setting receieved - updating PWM output");

			if (set_pwm((unsigned int) desired_pwm)) {
				// Error occurred while setting PWM (i.e. non-valid entry)
				if (configUSE_TRACE_FACILITY)
					vTracePrint(trace_IO, "Requested PWM setting is invalid");
			}
		}

		taskYIELD();	// Allow other tasks to run
	}
}


/* --------------------------- 'Helper' Functions --------------------------- */

/**	
 *  @brief	Function to calculate the average RPS from the global rps_buffer.
 *  @param  None.
 *  @return	None.
 **/
static float average_rps_calculator(void) {
	float avg = 0;	  // Current average
	unsigned int i = 0; // Iterating variable
	for (i = 0; i < SPEED_BUFFER_LEN; i++)
		avg += rps_buffer[i];
				
	return (avg / ((float) SPEED_BUFFER_LEN));
}

/**	
 *  @brief		Function to clear the contents of a given string.
 *  @param[in]	buffer: Pointer to the character array being cleared
 *  @param[in]	buffer_length: Length of the buffer (how many characters to clear)
 *  @return		None.
 **/
static void clear_string_buffer(char* buffer, unsigned int buffer_length) {
	unsigned int i = 0;
	for (i = 0; i < buffer_length; i++)
		buffer[i] = '\0';
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