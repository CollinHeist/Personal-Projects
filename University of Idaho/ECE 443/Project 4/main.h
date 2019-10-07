/** 
 *	@file 	main.h
 *	@brief	Main program header file, defines useful macros and prototypes functions
 *	@author	Collin Heist
 **/

#ifndef __MAIN_H__
	#define __MAIN_H__
	
	/// Convert a passed number of ms to ticks in FreeRTOS space
	#define MS_TO_TICKS(ms)					(ms / portTICK_RATE_MS)	

	#define LCD_WIDTH						16	//!< Line width of the LCD

	// Task Priority Levels
	#define TASK_CN_GENERATOR_PRIORITY		3	//!< Priority of the change notice generator task
	#define TASK_CN_ISR_HANDLER_PRIORITY	2	//!< Priority of the change notice handler task
	#define TASK_DISPLAY_LCD_MSG_PRIORITY	1	//!< Priority of the LCD display task
	#define TASK_LEDA_TOGGLE_PRIORITY		0	//!< Priority of the LEDA toggle task

	#define LEDA_TOGGLE_MS					3	//!< How often (in ms) to toggle LEDA

	// DIY Boolean variables
	#define FALSE							0	//!< Logical False
	#define TRUE							1	//!< Logical True

	// Function Prototypes (Public Functions Only)
	void isr_change_notice_handler();
#endif