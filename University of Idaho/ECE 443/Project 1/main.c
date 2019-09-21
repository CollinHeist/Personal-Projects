// Standard includes
#include <plib.h>

// Scheduler includes
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

// Hardware dependent setting
#include "chipKIT_Pro_MX7.h"

// File-Header include
#include "main.h"

// Global Variables
xQueueHandle button1_queue; // Queue for BTN1
xQueueHandle button2_queue; // Queue for BTN2

unsigned int button1_status_prev = 0; // Status of BTN1
unsigned int button2_status_prev = 0; // Status of BTN2

unsigned int add_to_button1_queue = FALSE; // Flag to add to BTN1 queue
unsigned int add_to_button2_queue = FALSE; // Flag to add to BTN2 queue

int main() {
	// Configure hardware
	initHardware();

	// Create the starter task
	xTaskCreate(initTask, "Initialization Task", configMINIMAL_STACK_SIZE, NULL, 3, NULL);

	// Start the scheduler
	vTaskStartScheduler();

	// Should only reach here if there is insufficient heap available to start scheduler
	return 0;
}

// Hardware initialization task
static void initHardware() {
	chipKIT_PRO_MX7_Setup();

	// Set up LEDs
	PORTSetPinsDigitalOut(IOPORT_G, LED1 | LED2);
	LATGCLR = SM_LEDS;
	
	// Set up debug LEDs
	if (DEBUG_MODE) { 
		// LEDA: sendButton(1), LEDB: sendButton(2), LEDC: toggleLED(), LEDD: CN ISR
		PORTSetPinsDigitalOut(IOPORT_B, SM_LEDS);
		LATBCLR = SM_LEDS;
	}
	
	// Configure buttons
	PORTSetPinsDigitalIn(IOPORT_G, BTN1 | BTN2);
	
	// Enable the Interrupt for BTN1 and BTN2
	mCNOpen(CN_ON,(CN8_ENABLE | CN9_ENABLE), 0);
	mCNSetIntPriority(1);
	mCNSetIntSubPriority(0);
	unsigned int x = PORTReadBits(IOPORT_G, BTN1 | BTN2);
	mCNClearIntFlag();
	mCNIntEnable(1);

	// Turn on the multiple Interrupt Vectors
	INTEnableSystemMultiVectoredInt();
}

// Interrupt Routine for Button Presses
void __ISR(_CHANGE_NOTICE_VECTOR, IPL1) CNIntHandler(void) {
	if (DEBUG_MODE) { LATBINV = LEDD; }
	
	hwDelay(DEBOUNCE_TIME_MS);
	// Read the new statues of the buttons
	unsigned int button1_status_new = PORTG & BTN1;
	unsigned int button2_status_new = PORTG & BTN2;

	// If the previous status was OFF and the new status is ON, set the flag
	if ((button1_status_prev == 0) && (button1_status_new == BTN1))
		add_to_button1_queue = TRUE;
	if ((button2_status_prev == 0) && (button2_status_new == BTN2))
		add_to_button2_queue = TRUE;

	// Update the previous button state
	button1_status_prev = button1_status_new;
	button2_status_prev = button2_status_new;

	if (DEBUG_MODE) { LATBINV = LEDD; }
	mCNClearIntFlag();
}

// Initialization task
static void initTask(void *task_params) {
	// Create two queues
	button1_queue = xQueueCreate(1, sizeof(unsigned int));
	button2_queue = xQueueCreate(1, sizeof(unsigned int));
	
	// Create two send-button tasks -> Priority 1, param is the button number
	xTaskCreate(sendButton, "Send BTN1 Task", configMINIMAL_STACK_SIZE, (void *)1, 1, NULL);
	xTaskCreate(sendButton, "Send BTN2 Task", configMINIMAL_STACK_SIZE, (void *)2, 1, NULL);
	
	// Create one toggle-LED task -> Priority 2
	xTaskCreate(toggleLED, "Toggle LED Task", configMINIMAL_STACK_SIZE, NULL, 2, NULL);
	
	// Delete this initialization task
	vTaskDelete(NULL);
}

// Task to read from the passed button position on PORTG
static void sendButton(void *task_params) {
	unsigned int button1_status_new, button2_status_new;
	portBASE_TYPE queue_status; // The status of the last queue addition, not used currently
	unsigned int toggle = 1; // Holds a dummy value, just used to initiate the toggle

	for(;;) {
		// Debug LED toggling
		if (DEBUG_MODE) {
			if (((unsigned int) task_params) == 1) { LATBINV = LEDA; }
			else								   { LATBINV = LEDB; }
		}
		
		// See if the passed button number's matching queue flag is set
		// If the flag is set, add to that queue and reset it 
		if ((((unsigned int) task_params) == 1) && add_to_button1_queue) {
			queue_status = xQueueSendToBack(button1_queue, &toggle, 0);
			add_to_button1_queue = FALSE;
		}
		else if ((((unsigned int) task_params) == 2) && add_to_button2_queue) {
			queue_status = xQueueSendToBack(button2_queue, &toggle, 0);
			add_to_button2_queue = FALSE;
		}
		
		if (DEBUG_MODE) {
			if (((unsigned int) task_params) == 1) { LATBINV = LEDA; }
			else								   { LATBINV = LEDB; }
		}
		
		taskYIELD(); // Allow this task to switch to the other tasks
	}
}

// Task to toggle the LEDs based on the presence of values in the button queues
static void toggleLED(void *task_params) {
	unsigned int toggle; // Holds the data received from the queue - useless
	portBASE_TYPE queue_status; // The status of the last queue read, not used currently
	
	for(;;) {
		if (DEBUG_MODE) { LATBINV = LEDC; }
		// If either of the queues exist
		if (button1_queue != 0 | button2_queue != 0) {
			// If the queue has a value, then invert that queues associated LED
			if (xQueueReceive(button1_queue, &toggle, (DEBOUNCE_TIME_MS + 1) / portTICK_RATE_MS))
				LATGINV = LED1;
			if (xQueueReceive(button2_queue, &toggle, (DEBOUNCE_TIME_MS + 1) / portTICK_RATE_MS))
				LATGINV = LED2;
		}
	}
}

void vApplicationStackOverflowHook() {
	for(;;) {}
}

void _general_exception_handler(unsigned long ulCause, unsigned long ulStatus) {
	for(;;) {}
}

// Hardware-assisted Delay
void hwDelay(unsigned int mS) {
	unsigned int tWait, tStart;
	tStart = ReadCoreTimer(); // Read core timer count - SW Start breakpoint
	tWait  = (CORE_MS_TICK_RATE * mS); // Set time to wait

	while ((ReadCoreTimer() - tStart) < tWait); // Wait for the time to pass
}