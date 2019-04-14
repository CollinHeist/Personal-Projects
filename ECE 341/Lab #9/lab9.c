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
	
	// Timer 2 Initialization
	OpenTimer2(T2_ON | T2_SOURCE_INT | T2_PS_1_1, T2_TICK - 1);
	mT2SetIntPriority(2);
	mT2SetIntSubPriority(0);
	mT2IntEnable(1);

	// Enable the Interrupt for BTN1 and BTN2
	mCNOpen(CN_ON, (CN8_ENABLE | CN9_ENABLE), 0);
	mCNSetIntPriority(1);
	mCNSetIntSubPriority(0);
	unsigned int x = PORTReadBits(IOPORT_G, BTN1 | BTN2);
	mCNClearIntFlag();
	mCNIntEnable(1);

	// Output Compare Module
	OpenOC3(OC_ON | OC_TIMER_MODE16 | OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE, 0, 0);

	// Turn on the mutliple Interrupt Vectors
	INTEnableSystemMultiVectoredInt();
}

// Timer 2, 1ms ISR
void __ISR(_TIMER_2_VECTOR, IPL2) Timer2Handler(void) {
	LATBINV = LEDA;
	mT2ClearIntFlag();
}

// Interrupt Routine for Button Presses
void __ISR(_CHANGE_NOTICE_VECTOR, IPL1) CNIntHandler(void) {
	LATBINV = LEDC;
	hw_delay(20);
	unsigned int buttons = read_buttons();
	pwm_cycle = decode_buttons(buttons);
	SetDCOC3PWM((float) pwm_cycle / 100.0 * T2_TICK); // Set the PWM cycle

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

// Hardware-assisted Delay
void hw_delay(unsigned int mS) {
	unsigned int tWait, tStart;
	tStart = ReadCoreTimer(); // Read core timer count - SW Start breakpoint
	tWait  = (CORE_MS_TICK_RATE * mS); // Set time to wait

	while ((ReadCoreTimer() - tStart) < tWait); // Wait for the time to pass
	LATBINV = LEDA; // Toggle LED at end of delay period
}