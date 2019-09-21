/* ----------------------------- Included Files ----------------------------- */
#include <plib.h>

// FreeRTOS includes
#include "FreeRTOS.h"	   // FreeRTOS API
#include "FreeRTOSConfig.h" // FreeRTOS Configuration file
#include "task.h"		   // Generic task
#include "queue.h"		  // Queues
#include "semphr.h"		 // Semaphore

// Hardware dependent setting
#include "chipKIT_Pro_MX7.h"

// File-Header include
#include "main.h"

/* --------------------------- Function Prototypes -------------------------- */
// CN ISR for button presses - Directly calls wrapper function
// -> Not technically a prototype, but needed for the assembly code implementation
void __ISR(_CHANGE_NOTICE_VECTOR, IPL1) isr_changeNoticeWrapper(void);

/* ---------------------------- Global Variables ---------------------------- */
xSemaphoreHandle cn_semaphore;		  // Semaphore for unblocking the handler task from the ISR

unsigned int previous_BTN1_status = 0;  // Variable for the LAST status of BTN1
unsigned int trace_ledb_count = 0;	  // How many times the toggle LEDB task has been called while LEDC is lit

#if (configUSE_TRACE_FACILITY == 1)	 // TraceAlyzer variables
	traceString trace_cn_handler;	   // Channel for LEDB
	traceString trace_cn_isr;		   // Channel for LEDD
	traceString trace_1ms_task;		 // Channel for the 1ms LEDB channel
#endif

	
/* ------------------------------ Main Program ------------------------------ */
int main() {
	// Initialize and configure the hardware
	initHardware();
	
	// Turn on the TraceAlyzer
	// -> Also assign user-event labels to each of the Tracealyzer Channels
	if (configUSE_TRACE_FACILITY) {
		vTraceEnable(TRC_START);	// Initialize and start recording
		trace_cn_handler = xTraceRegisterString("Change Notice Handler Task");
		trace_cn_isr = xTraceRegisterString("Change Notice ISR");
		trace_1ms_task = xTraceRegisterString("1ms LEDB Task");
	}
	
	// Create the semaphore needed for the CN ISR to trigger a handler task
	vSemaphoreCreateBinary(cn_semaphore);
	if (cn_semaphore == NULL) { return 0; } // Error creating the semaphore

	// 1ms LEDB toggle task - Highest priority so the kernel always calls it every 1 ms
	BaseType_t task_success;
	task_success = xTaskCreate(task_changeNoticeHandler, "CN ISR Handler Task",
							   configMINIMAL_STACK_SIZE, NULL, 1, NULL);
	if (task_success != pdPASS) { return 0; } // Error creating the task

	// Start the scheduler
	vTaskStartScheduler();

	// Should only reach here if there is insufficient heap available to start scheduler
	return 0;
}

// Hardware initialization task
static void initHardware() {
	chipKIT_PRO_MX7_Setup();

	// Set up LEDs
	PORTSetPinsDigitalOut(IOPORT_B, SM_LEDS);
	LATBCLR = SM_LEDS;
	
	// Configure button
	PORTSetPinsDigitalIn(IOPORT_G, BTN1);
	
	// Enable the Interrupt for BTN1
	mCNOpen(CN_ON, CN8_ENABLE, 0);
	mCNSetIntPriority(1);
	mCNSetIntSubPriority(0);
	unsigned int x = PORTReadBits(IOPORT_G, BTN1);
	mCNClearIntFlag();
	mCNIntEnable(1);

	// Turn on the multiple Interrupt Vectors
	INTEnableSystemMultiVectoredInt();
}

// This function is called when the CN ISR triggers
// Clears the CN flag and gives a semaphore to unblock the handler TASK
void isr_changeNoticeHandler(void) {
	// Turn on LEDD while running this
	// -> Note this in Tracealyzer if needed
	mPORTBSetBits(LEDD);
	if (configUSE_TRACE_FACILITY)
		vTracePrint(trace_cn_isr, "LEDD on: Entering C-Portion of CN ISR");
	
	// Flag for if returning to a higher priority task is necessary
	portBASE_TYPE move_to_higher_priority = pdFALSE;
	
	// Give the semaphore to unlock the task
	// -> Note the semaphore give in Tracealyzer
	xSemaphoreGiveFromISR(cn_semaphore, &move_to_higher_priority);
	if (configUSE_TRACE_FACILITY)
		vTracePrint(trace_cn_isr, "Giving semaphore from CN ISR");
	
	// Clear the interrupt flag
	mCNClearIntFlag();
	mCNOpen(CN_OFF, (CN8_ENABLE | CN9_ENABLE), 0);
	
	// Turn off LEDD now that the C-portion of the code is over
	// -> Note this in Tracealyzer if needed
	mPORTBClearBits(LEDD);
	if (configUSE_TRACE_FACILITY)
		vTracePrint(trace_cn_isr, "LEDD off: Exiting C-Portion of CN ISR");
	
	// Exit the ISR, returning to the higher priority task if necessary
	portEND_SWITCHING_ISR(move_to_higher_priority);
}

// This is the handler TASK that executes the CN code
// Unblocks only from the CN ISR
static void task_changeNoticeHandler(void *task_params) {
	unsigned int new_BTN1_status = 0;
	// Try and take the semaphore to start (no delay) in case it was given
	// before the task started
	xSemaphoreTake(cn_semaphore, 0);
	
	for (;;) {
		// Wait for the semaphore forever
		// -> this only unblocks when the semaphore is GIVEN by the ISR
		// -> this take is also noted in Tracealyzer
		xSemaphoreTake(cn_semaphore, portMAX_DELAY);
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_cn_handler, "Received the semaphore");
		
		// Debounce the task for (x) milliseconds
		// -> note this in Tracealyzer
		if (configUSE_TRACE_FACILITY)
			vTracePrint(trace_cn_handler, "Debouncing button");
		vTaskDelay(MS_TO_TICKS(DEBOUNCE_TIME_MS));
		
		//  Read BTN1 and toggle LEDC if the previous status was 0
		new_BTN1_status = PORTG & BTN1; // Read BTN1 
		if (previous_BTN1_status == 0 && new_BTN1_status > 0)
			LATBINV = LEDC;
		
		// Update the previous button status
		previous_BTN1_status = new_BTN1_status;
	}
}

/* The below functions are overwriting FreeRTOS tasks for specific functionality */

// Tick hook task that toggles LEDB every tick operation
void vApplicationTickHook(void) {
	// Note the LEDB toggle in TraceAlyzer
	if (configUSE_TRACE_FACILITY) 
		vTracePrint(trace_1ms_task, "Toggling LEDB");
	
	LATBINV = LEDB; // Invert LEDB
	
	// If TraceAlyzer is available, and we're in debug mode
	// -> After two toggles of LEDB while LEDC is on, break
	if (configUSE_TRACE_FACILITY && DEBUG_MODE) {
		if (LATB & LEDC)
			trace_ledb_count++;
	
		if (trace_ledb_count >= 2)
			LATB = LATB;
	}
}

// Idle task sets LEDA to the status of BTN1
void vApplicationIdleHook(void) {
	// If the button status is non-zero (pressed), turn on LEDA - Otherwise, turn it off
	if (PORTG & BTN1)
		mPORTBSetBits(LEDA);
	else
		mPORTBClearBits(LEDA);
}

// Function that is called whenever a stack overflows
void vApplicationStackOverflowHook() {
	for(;;) {}
}

// Generic exception handler
void _general_exception_handler(unsigned long ulCause, unsigned long ulStatus) {
	for(;;) {}
}