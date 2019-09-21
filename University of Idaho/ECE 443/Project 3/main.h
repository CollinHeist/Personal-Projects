#ifndef __MAIN_H__
	#define __MAIN_H__
	
	
	#define MS_TO_TICKS(ms)				(ms / portTICK_RATE_MS)	// Convert a passed number of ms to ticks in FreeRTOS space
	#define DEBOUNCE_TIME_MS			20		// How long to wait for debounce (in milliseconds)

	#define EEPROM_SLAVE_ADDR			0x0050	// The I2C Slave Address of the EEPROM

	#define UART_MAX_NUM_CHARS			80		// Maximum number of characters in one given UART transmission
	#define MAX_NUM_MSGS				5		// Maximum number of full messages that are stored in the EEPROM - Also determines the queue sizes

	// Task Priority Levels
	#define CN_HANDLER_TASK_PRIORITY	1
	#define EEPROM_WRITE_TASK_PRIORITY	2

	// DIY Boolean variables
	#define FALSE						0
	#define TRUE						1
#endif

// Function Prototypes