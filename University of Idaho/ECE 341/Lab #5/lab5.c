#include <plib.h>
#include "CerebotMX7cK.h"
#include "lab5.h"

unsigned int control_mode;
unsigned int step_delay = 40;

int main() {
	system_init();
	
	while (1) {}
	
	return 0;
}

// Initialize the necessary I/O pins and timers
void system_init() {
	Cerebot_mx7cK_setup();
	PORTSetPinsDigitalIn(IOPORT_G, BTN1 | BTN2);
	PORTSetPinsDigitalOut(IOPORT_B, SM_COILS | BIT_2 | BIT_3 | BIT_4);
	LATBCLR =  SM_COILS | BIT_2 | BIT_3 | BIT_4;

	// Enabling the Interrupt for Timer 1
	OpenTimer1(T1_ON | T1_SOURCE_INT | T1_PS_1_1, T1_TICK-1);
	mT1SetIntPriority(2);
	mT1SetIntSubPriority(0);
	mT1IntEnable(1);

	// Enable the Interrupt for BTN1 and BTN2
	mCNOpen(CN_ON,(CN8_ENABLE | CN9_ENABLE), 0);
	mCNSetIntPriority(1);
	mCNSetIntSubPriority(0);
	unsigned int x = PORTReadBits(IOPORT_G, BTN1 | BTN2);
	mCNClearIntFlag();
	mCNIntEnable(1);

	// Turn on the mutliple Interrupt Vectors
	INTEnableSystemMultiVectoredInt();
}

// Interrupt Routine for Timer 1 (1 ms)
void __ISR(_TIMER_1_VECTOR, IPL2) Timer1Handler(void) {
	LATBINV = LEDA;
	if (!(--step_delay)) {
		stepper_state_machine();
		unsigned int del_mode = (control_mode & 12) >> 2;
		unsigned int rev_min  = (del_mode == RPM10) ? 10 : (del_mode == RPM15) ? 15 : 25;
		step_delay = 1.0 / ((float) rev_min * 100.0 / 60.0 / 1000.0);
	}
	mT1ClearIntFlag();
}

// Interrupt Routine for Button Presses
void __ISR(_CHANGE_NOTICE_VECTOR, IPL1) CNIntHandler(void) {
	LATBINV = LEDC;
	hw_delay(20);
	unsigned int buttons = read_buttons();
	decode_buttons(buttons);

	mCNClearIntFlag();
	LATBINV = LEDC;
}

// Reads the PORTG values of BTN1, BTN2
unsigned int read_buttons() {
	return (PORTG & (BTN1 | BTN2));	 // Read only BTN1, BTN2
}

// Returns a two bit number
// 	bit 0 is STEP MODE: 0 is HS, 1 is FS
//  bit 1 is DIRECTION: 0 is CW, 1 is CCW
//  bit 2/3 is SPEED  : 00 is 10, 01 is 15, 10 is 25
void decode_buttons(unsigned int portG_state) {
	unsigned int btns = portG_state >> 6;	// Shift so bits 1-0 are BTN2-BTN1
	// 00 -> 0100, 01 -> 0101, 10 -> 0010, 11 -> 1011
	control_mode = (btns < 2 ? 4 + btns : ((btns & 1) << 3) + btns);
}

// Increment the state machine -> Outputs to the motor
void stepper_state_machine() {
	enum {S0_5, S1, S1_5, S2, S2_5, S3, S3_5, S4};
	unsigned int return_modes[] = {S0_5_HEX, S1_HEX, S1_5_HEX, S2_HEX,
		S2_5_HEX, S3_HEX, S3_5_HEX, S4_HEX
	};
	static int state = S0_5;		// Initialize to 0_5
	
	switch (control_mode & 0x03) {	// Ignore speed bits
		case H_CW:
			state = (state - 1) < S0_5 ? S4		   : state - 1;
			break;
		case F_CW:
			state = (state - 2) < S0_5 ? state + 6 : state - 2;
			break;
		case H_CCW:
			state = (state + 1) > S4   ? S0_5	   : state + 1;
			break;
		case F_CCW:
			state = (state + 2) > S4   ? state - 6 : state + 2;
			break;
	}
	LATBINV = LEDB;
	output_to_stepper_motor(return_modes[state]);
}

// Send four bit hexcode to motor pins
void output_to_stepper_motor(unsigned int hexcode) {
	unsigned int output = hexcode << 7;	// Shift so 1A-2B is on pins 10-7
	unsigned int curr   = LATB & (BIT_7 | BIT_8 | BIT_9 | BIT_10);
	
	// Reset old output, apply new one
	PORTClearBits(IOPORT_B, ~output & curr); // Only clear bits that are 1 -> 0
	PORTSetBits(IOPORT_B, output);
}

// Hardware-assisted Delay
void hw_delay(unsigned int mS) {
	unsigned int tWait, tStart;
	tStart = ReadCoreTimer(); // Read core timer count - SW Start breakpoint
	tWait  = (CORE_MS_TICK_RATE * mS); // Set time to wait

	while ((ReadCoreTimer() - tStart) < tWait); // Wait for the time to pass
	LATBINV = LEDA; // Toggle LED at end of delay period
}