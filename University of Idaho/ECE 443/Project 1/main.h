#ifndef __MAIN_H__
    #define __MAIN_H__

	// To enter debug mode, where LEDs are toggled on operations, put a non-
    // zero number for DEBUG_MODE
    #define DEBUG_MODE          1

	// How long to wait between debounces 
    #define DEBOUNCE_TIME_MS    20

	// Useful macros
	#define FALSE               0
	#define TRUE                1
#endif

// Function prototypes
static void initHardware(void);
static void initTask(void *task_parameters);
static void sendButton(void *task_parameters);
static void toggleLED(void *task_parameters);
void hwDelay(unsigned int mS);