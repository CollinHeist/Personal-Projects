#ifndef __MAIN_H__
	#define __MAIN_H__
	
	
	#define MS_TO_TICKS(ms)				(ms / portTICK_RATE_MS)	// Convert a passed number of ms to ticks in FreeRTOS space
	#define DEBOUNCE_TIME_MS			20		// How long to wait for debounce (in milliseconds)

	#define EEPROM_SLAVE_ADDR			0x0050	// The I2C Slave Address of the EEPROM

	#define UART_MAX_MSG_SIZE			80		// Maximum number of characters in one given UART transmission
	#define LCD_CHAR_WIDTH				16		// How many characters the LCD screen is wide
	#define LCD_MAX_NEWLINE_ADDITIONS	(unsigned int) (UART_MAX_MSG_SIZE / LCD_CHAR_WIDTH)
	#define MAX_NUM_MSGS				5		// Maximum number of full messages that are stored in the EEPROM - Also determines the queue sizes
	#define LCD_BLANK_PERIOD_MS			1000	// How many milliseconds to blank the LCD before a message start

	// Task Priority Levels
	#define CN_HANDLER_TASK_PRIORITY	1
	#define EEPROM_WRITE_TASK_PRIORITY	2		// 
	#define EEPROM_READ_TASK_PRIORITY	3		// Higher than the WRITE task so it finishes operation
	#define HEARTBEAT_TASK_PRIORITY		4		// Needs to be the highest of all tasks

	// DIY Boolean variables
	#define FALSE						0
	#define TRUE						1
#endif

// Function Prototypes