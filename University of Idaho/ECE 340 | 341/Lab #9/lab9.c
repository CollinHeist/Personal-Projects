#include <plib.h>
#include <stdio.h>
#include <string.h>

#include "CerebotMX7cK.h"
#include "lab9.h"
#include "LCDlib.h"

unsigned int pwm_cycle = 0;
int main() {
	system_init();

	while (1);

	return 1;
}

void system_init() {
	// Hardware Initialization
	Cerebot_mx7cK_setup();
	init_LCD();
	reset_clear_LCD();
	PORTSetPinsDigitalOut(IOPORT_B, SM_LEDS);		// LED Signaling pins
	PORTSetPinsDigitalOut(IOPORT_D, BIT_1);			// Motor direction pin
	PORTSetPinsDigitalIn(IOPORT_D, BIT_3 | BIT_12);	// Tachometer inputs
	LATBCLR = SM_LEDS;
	LATDCLR = BIT_1; 
	
	// Enable the Interrupt for BTN1 and BTN2
	mCNOpen(CN_ON, (CN8_ENABLE | CN9_ENABLE), 0);
	mCNSetIntPriority(1);
	mCNSetIntSubPriority(0);
	unsigned int x = PORTReadBits(IOPORT_G, BTN1 | BTN2);
	mCNClearIntFlag();
	mCNIntEnable(1);

	init_pwm(40, 1000);

	// Turn on the mutliple Interrupt Vectors
	INTEnableSystemMultiVectoredInt();
}

// Interrupt Routine for Button Presses
void __ISR(_CHANGE_NOTICE_VECTOR, IPL1) CNIntHandler(void) {
	LATBINV = LEDC;
	sw_ms_delay(20);
	unsigned int buttons = read_buttons();
	pwm_cycle = decode_buttons(buttons);
	set_pwm(pwm_cycle);

	// Create the string to be put on the LCD
	char pwm_str[8] = {'\0'};				// Part 1 - The PWM number
	sprintf(pwm_str, "%u\%%\n", pwm_cycle);
	
	char lcd_str[50] = "PWM Cycle: ";		// Part 2 - The header
	strcat(lcd_str, pwm_str);

	char dash_str[20] = {'\0'};						// Part 3 - The dashes
	unsigned int num_dashes = (float) pwm_cycle / ((float) 100 / (float) 16);
	unsigned int i;
	for (i = 0; i < num_dashes; i++)
		dash_str[i] = '-';

	strcat(lcd_str, dash_str);

	reset_clear_LCD();
	put_string_LCD(lcd_str);

	LATBINV = LEDC;
	mCNClearIntFlag();
}

unsigned int read_buttons() {
	return (PORTG & (BTN1 | BTN2));	 // Read only BTN1, BTN2
}

unsigned int decode_buttons(unsigned int portG_state) {
	unsigned int btns = portG_state >> 6;	// Shift so bits 1|0 are BTN2|BTN1
	unsigned int cases[] = {40, 65, 80, 95};

	return cases[btns];
}

// Software-only delay
void sw_ms_delay(unsigned int mS) {
	unsigned int tWait, tStart;
	tStart = ReadCoreTimer(); // Read core timer count - SW Start breakpoint
	tWait  = (CORE_MS_TICK_RATE * mS); // Set time to wait

	while ((ReadCoreTimer() - tStart) < tWait); // Wait for the time to pass
	LATBINV = LEDA; // Toggle LED at end of delay period
}