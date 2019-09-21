#ifndef __MAIN_H__
    #define __MAIN_H__
    
    // Macro function to convert a passed number of ms to ticks in FreeRTOS space
    #define MS_TO_TICKS(ms)         (ms / portTICK_RATE_MS)

	// Whether to enter debug mode or not
    #define DEBUG_MODE              1

	// How long to wait for debounce (in milliseconds)
    #define DEBOUNCE_TIME_MS        20

	// The I2C Slave Address of the EEPROM
	#define EEPROM_SLAVE_ADDR		0x0050

	// Maximum number of characters in one given UART transmission
	#define UART_MAX_NUM_CHARS		80

	#define FALSE                   0
	#define TRUE                    1
#endif

// Function Prototypes
static void initHardware();
static void task_changeNoticeHandler(void *task_params);