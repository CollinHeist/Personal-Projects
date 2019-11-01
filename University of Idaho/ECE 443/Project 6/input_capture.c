/** 
 *	@file 	input_capture.c
 *	@brief 	Input Capture source file. Allows for use of the IC5 peripheral (along with Timer 3)
 *			to measure the average RPS of the motor.
 *	@author	Collin Heist
 **/

// Necessary Includes
#include <plib.h>
#include "input_capture.h"

// Global Variables
static float rps_buffer[SPEED_BUFFER_LEN];	// Buffer of RPS readings

void initialize_input_capture(void) {
	// Timer 3 initialization
	OpenTimer3(T3_ON | T3_SOURCE_INT | T3_PS_1_256, 0xFFFF);
	mT3SetIntPriority(2);
	mT3SetIntSubPriority(2);
	mT3IntEnable(1);
	
	// Input Capture Initialization
	PORTSetPinsDigitalIn(IOPORT_D, BIT_3 | BIT_12);	// Tachometer inputs
	mIC5ClearIntFlag();	
	OpenCapture5(IC_ON | IC_CAP_16BIT | IC_IDLE_STOP | IC_FEDGE_FALL | IC_TIMER3_SRC | IC_INT_1CAPTURE | IC_EVERY_FALL_EDGE);
	ConfigIntCapture5(IC_INT_ON | IC_INT_PRIOR_3 | IC_INT_SUB_PRIOR_0);
}

/**	
 *	@brief	Function to calculate the average RPS from the global rps_buffer.
 *	@param  None.
 *	@return	Float that is the average of all values in the global rps_buffer.
 **/
float get_average_rps(void) {
	float avg = 0;	// Current average
	unsigned int i;	// Iterating variable
	for (i = 0; i < SPEED_BUFFER_LEN; i++)
		avg += rps_buffer[i];
				
	return (avg / ((float) SPEED_BUFFER_LEN));
}

/**	
 *	@brief	ISR for the input capture module. Adds the latest reading to the rps_buffer.
 *	@param	None.
 *	@return	None.
 **/
void __ISR(_INPUT_CAPTURE_5_VECTOR, IPL3) isr_input_capture(void) {
	unsigned int input_buffer[4] = {0};
	static unsigned short int new_capture = 0;
	static unsigned short int old_capture = 0;
	unsigned short int delta_t = 0;

	// Read the input capture FIFO and increment variables
	ReadCapture5(input_buffer);
	new_capture = input_buffer[0];
	delta_t = new_capture - old_capture;
	old_capture = new_capture;

	// Compute the newest rev/s calculation, add to the buffer
	float rev_per_sec = 10.0E6 / 256.0 / (float) delta_t;
	unsigned int i = 0;
	for (i = SPEED_BUFFER_LEN - 1; i > 0; i--)	// Loop through buffer, shift elements down
		rps_buffer[i] = rps_buffer[i-1];
	rps_buffer[0] = rev_per_sec;

	mIC5ClearIntFlag();	// Clear interrupt flag
}

// Timer 3 ISR for input capture
/**	
 *	@brief	ISR for Timer 3.
 *	@param	None.
 *	@return	None.
 **/
void __ISR(_TIMER_3_VECTOR, IPL2) isr_timer3(void) {
	mT3ClearIntFlag();
}