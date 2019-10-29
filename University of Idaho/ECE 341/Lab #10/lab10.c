#include <plib.h>
#include <stdio.h>
#include <string.h>

#include "CerebotMX7cK.h"
#include "lab10.h"
#include "LCDlib.h"
#include "pwm.h"

float rps_buffer[BUFFER_LEN] = {0};

int main() {
	system_init();

	while (1) {
		hw_ms_delay(100);
		mCNIntEnable(FALSE);				// Disable CN interrupts
		
		// Calculate the average value to be put on the LCD
		float avg = 0;
		unsigned int i = 0;
		for (i = 0; i < BUFFER_LEN; i++)
			avg += rps_buffer[i];
		avg /= BUFFER_LEN;

		// Format the LCD string, place onto the first line
		char lcd_str[16] = {'\0'};
		sprintf(lcd_str, "Average: %06.2f", avg);
		set_cursor_LCD(SECOND_LINE_START);	// Move to the second line
		put_string_LCD("				");	// Clear the second line
		set_cursor_LCD(SECOND_LINE_START);	// Return to second line
		put_string_LCD(lcd_str);			// Place the average 

		mCNIntEnable(TRUE);					// Reenable CN interrupts
	}

	return 1;
}

void system_init() {
	// Hardware Initialization
	Cerebot_mx7cK_setup();
	PORTSetPinsDigitalOut(IOPORT_B, SM_LEDS);		// LED Signaling pins
	PORTSetPinsDigitalOut(IOPORT_D, BIT_1);			// Motor direction pin
	LATBCLR = SM_LEDS;
	LATDCLR = BIT_1; 

	// LCD Initialization
	init_LCD();
	reset_clear_LCD();

	// Input capture initialization
	PORTSetPinsDigitalIn(IOPORT_D, BIT_3 | BIT_12);	// Tachometer inputs
	mIC5ClearIntFlag();	
	OpenCapture5(IC_ON | IC_CAP_16BIT | IC_IDLE_STOP | IC_FEDGE_FALL | IC_TIMER3_SRC | IC_INT_1CAPTURE | IC_EVERY_FALL_EDGE);
	ConfigIntCapture5(IC_INT_ON | IC_INT_PRIOR_3 | IC_INT_SUB_PRIOR_0);
	
	// Change notice interrupt for BTN1 and BTN2
	mCNOpen(CN_ON, (CN8_ENABLE | CN9_ENABLE), 0);
	mCNSetIntPriority(1);
	mCNSetIntSubPriority(0);
	unsigned int x = PORTReadBits(IOPORT_G, BTN1 | BTN2);
	mCNClearIntFlag();
	mCNIntEnable(1);

	// Timer 3 initialization
	OpenTimer3(T3_ON | T3_SOURCE_INT | T3_PS_1_256, 0xFFFF);
	mT3SetIntPriority(2);
	mT3SetIntSubPriority(2);
	mT3IntEnable(1);

	// PWM Output & Timer 2
	init_pwm(40, 1000);	// 40% duty cycle, 1000Hz frequency

	// Turn on the mutliple Interrupt Vectors
	INTEnableSystemMultiVectoredInt();
}

void __ISR(_INPUT_CAPTURE_5_VECTOR, IPL3) InputCapture5Handler (void) {
	LATBINV = LEDD;
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
	for (i = BUFFER_LEN-1; i > 0; i--)	// Loop through buffer, shift elements down
		rps_buffer[i] = rps_buffer[i-1];
	rps_buffer[0] = rev_per_sec;

	mIC5ClearIntFlag();	// Clear interrupt flag
}

// Interrupt Routine for Button Presses
void __ISR(_CHANGE_NOTICE_VECTOR, IPL1) CNIntHandler(void) {
	LATBINV = LEDB;
	hw_ms_delay(20);
	unsigned int buttons = read_buttons();
	unsigned int pwm_cycle = decode_buttons(buttons);
	set_pwm(pwm_cycle);

	// Create the string to be put on the LCD
	char pwm_str[8] = {'\0'};			// Part 1 - The PWM number
	sprintf(pwm_str, "%u\%%\n", pwm_cycle);
	
	char lcd_str[50] = "PWM Cycle: ";	// Part 2 - The header
	strcat(lcd_str, pwm_str);

	set_cursor_LCD(FIRST_LINE_START);	// Go to the beginning of line 1
	put_string_LCD("				");	// Clear the first line
	set_cursor_LCD(FIRST_LINE_START);	// Return to the beginning of line 1
	put_string_LCD(lcd_str);

	LATBINV = LEDB;
	mCNClearIntFlag();
}

// Timer 3 ISR for input capture
void __ISR(_TIMER_3_VECTOR, IPL2) Timer3Handler(void) {
	LATBINV = LEDC;
	mT3ClearIntFlag();
}

unsigned int read_buttons() {
	return (PORTG & (BTN1 | BTN2));	 // Read only BTN1, BTN2
}

unsigned int decode_buttons(unsigned int portG_state) {
	unsigned int btns = portG_state >> 6;	// Shift so bits 1|0 are BTN2|BTN1
	unsigned int cases[] = {40, 65, 80, 95};

	return cases[btns];
}

// Hardware-assisted Delay
void hw_ms_delay(unsigned int mS) {
	unsigned int tWait, tStart;
	tStart = ReadCoreTimer(); // Read core timer count - SW Start breakpoint
	tWait  = (CORE_MS_TICK_RATE * mS); // Set time to wait

	while ((ReadCoreTimer() - tStart) < tWait); // Wait for the time to pass
}