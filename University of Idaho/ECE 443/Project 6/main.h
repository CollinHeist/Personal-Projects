#ifndef __MAIN_H__
	#define __MAIN_H__
	
	#define MS_TO_TICKS(ms)                 (ms / portTICK_RATE_MS)	// Convert a passed number of ms to ticks in FreeRTOS space

	#define LCD_WIDTH						16	// Line width of the LCD
    #define SPEED_BUFFER_LEN                32  // How long of a buffer to keep for the motor speed

	/// Task Priority Levels
	#define TASK_CN_GENERATOR_PRIORITY		3
	#define TASK_CN_ISR_HANDLER_PRIORITY	2
	#define TASK_DISPLAY_LCD_MSG_PRIORITY	1
	#define TASK_LEDA_TOGGLE_PRIORITY       0

	#define PWM_FREQUENCY_HZ				1000	// What frequency the PWM module is operating at 

    #define IO_FREQ_MS                      500		// How often the IO is checked (in ms)
    #define RTR_FREQ_MS                     2000	// How often RTRs are sent (in ms)
	#define DEBOUNCE_MS						25		// How long to debounce a button press (in ms)

	// PWM Settings
	#define PWM_MIN_VAL						20.0
	#define PWM_MAX_VAL						95.0
	#define PWM_LINEAR_MIN					30.0
	#define PWM_LINEAR_MAX					85.0

	/// DIY Boolean variables
	#define FALSE							0
	#define TRUE							1

	/// Function Prototypes
	static void initialize_hardware();
	static unsigned int create_RTOS_objects();
	static unsigned int create_tasks();
	static void task_cn_generator(void* task_params);
	void isr_change_notice_handler(void);
	static void task_change_notice_handler(void* task_params);
	static void task_display_lcd(void* task_params);
	static void task_leda_toggle(void* task_params);
#endif

