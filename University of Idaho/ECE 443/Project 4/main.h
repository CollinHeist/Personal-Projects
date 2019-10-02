#ifndef __MAIN_H__
	#define __MAIN_H__

    #define SHOW_HEARBEAT_TASK          0
	
	#define MS_TO_TICKS(ms)				(ms / portTICK_RATE_MS)	// Convert a passed number of ms to ticks in FreeRTOS space

	// Task Priority Levels
	#define TASK_CN_GENERATOR_PRIORITY		3
	#define TASK_CN_ISR_HANDLER_PRIORITY	2
	#define TASK_DISPLAY_LCD_MSG_PRIORITY	1
	#define TASK_LEDA_3MS_TOGGLE_PRIORITY	0

	// DIY Boolean variables
	#define FALSE						0
	#define TRUE						1
#endif

// Function Prototypes
static void init_hardware();
static unsigned int create_RTOS_objects();
static unsigned int create_tasks();