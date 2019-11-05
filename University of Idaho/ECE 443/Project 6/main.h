/** 
 *	@file	main.h
 *	@brief	Main header file. Defines buffer lengths, task priority levels, and event timings.
 *	@author	Collin Heist
 **/

#ifndef __MAIN_H__
	#define __MAIN_H__
	
	#define MS_TO_TICKS(ms)					(ms / portTICK_RATE_MS)	// Convert a passed number of ms to ticks in FreeRTOS space

	// Task Priority Levels
	#define TASK_READ_IO_PRIORITY			3
	#define TASK_SEND_RTR_PRIORITY			3
	#define TASK_CHANGE_NOTICE_PRIORITY		4
	#define TASK_CONTROL_FSM_PRIORITY		2
	#define TASK_UPDATE_PWM_PRIORITY		2

	// Event timings
	#define IO_FREQ_MS						500		// How often the IO is checked (in ms)
	#define RTR_FREQ_MS						2000	// How often RTRs are sent (in ms)
	#define DEBOUNCE_MS						25		// How long to debounce a button press (in ms)
	#define PWM_FREQUENCY_HZ				1000	// What frequency the PWM module is operating at 

	// PWM Settings
	#define PWM_MIN_VAL						20.0
	#define PWM_MAX_VAL						95.0
	#define PWM_LINEAR_MIN					30.0
	#define PWM_LINEAR_MAX					85.0

	// Boolean variables
	#define FALSE							0
	#define TRUE							1

	// Function Prototypes
	static void initialize_hardware();
	static unsigned int create_RTOS_objects();
	static unsigned int create_tasks();
	static void task_read_IO(void* task_params);
	static void task_send_RTR(void* task_params);
	void isr_change_notice_handler(void);
	static void task_change_notice_handler(void* task_params);
	static void task_control_FSM(void* task_params);
	static void task_update_pwm(void* task_params);
	static float average_rps_calculator(void);
	static void clear_string_buffer(char* buffer, unsigned int buffer_length);
#endif

