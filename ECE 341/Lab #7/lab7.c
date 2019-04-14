#include <plib.h>
#include <stdio.h>
#include <string.h>

#include "CerebotMX7cK.h"
#include "LCDlib.h"
#include "comm.h"
#include "lab7.h"

unsigned int dir;
unsigned int step_mode;
unsigned int RPM = 15;
unsigned int step_delay = 40;

int main() {
	system_init();

	char input[15];
	char in_dir[3], in_mode[4];
	
	while (1) {
		while (!getstrU1(input, sizeof(input)));
		putsU1("\r\n");
		mCNIntEnable(FALSE);	// Disable CN interrupts
		sscanf(input, "%s %s %d", in_dir, in_mode, &RPM);

		// Assign the global variables accordingly; limit RPM
		dir	   = (strcmp(in_dir, "CW")) ? CCW : CW;
		step_mode = (strcmp(in_mode, "HALF")) ? FS : HS;
		RPM	   = (RPM > 30) ? 30 : RPM;

		reset_clear_LCD();
		put_string_LCD(input);
		mCNIntEnable(TRUE);		// Enable CN Interrupts
	}
	
	return 0;
}

// Initialize the necessary I/O pins and timers
void system_init() {
	Cerebot_mx7cK_setup();
	initialize_LCD();
	initialize_uart1(19200, ODD_PARITY);

	// I/O for motor
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

	// Turn on the multiple Interrupt Vectors
	INTEnableSystemMultiVectoredInt();
}

// Interrupt Routine for Timer 1 (1 ms)
void __ISR(_TIMER_1_VECTOR, IPL2) timer1_routine(void) {
	LATBINV = LEDA;
	if (!(--step_delay)) {
		stepper_state_machine();
		step_delay = 600.0 / RPM;
	}
	mT1ClearIntFlag();
}

// Interrupt Routine for Button Presses
void __ISR(_CHANGE_NOTICE_VECTOR, IPL1) button_routine(void) {
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

void decode_buttons(unsigned int portG) {
	unsigned int btns = portG >> 6;	// Shift so bits 1-0 are BTN2-BTN1
	
	step_mode = btns & 0x01;		// BTN1 -> Step Mode
	dir		  = (btns & 0x02) >> 1;	// BTN2 -> Direction
	RPM		  = (btns & BIT_0) ? (btns & BIT_1 ? 10 : 25) : 15;

	// Prepare string to be sent to LCD
	char buffer[15];
	
	if (dir == CW) { strcpy(buffer, "CW "); }
	else { strcpy(buffer, "CCW "); }
	
	if (step_mode == HS) { strcat(buffer, "HS "); }
	else { strcat(buffer, "FS "); }
	
	if (RPM == 10) { strcat(buffer, "10"); }
	else if (RPM == 15) { strcat(buffer, "15"); }
	else { strcat(buffer, "25"); }

	reset_clear_LCD();			// Clear display, reset cursor
	put_string_LCD(buffer);		// Send to LCD
	putsU1(buffer);				// Send to the console, ignore flag
}

// Increment the state machine -> Outputs to the motor
void stepper_state_machine() {
	enum {S0_5, S1, S1_5, S2, S2_5, S3, S3_5, S4};
	unsigned int return_modes[] = {S0_5_HEX, S1_HEX, S1_5_HEX, S2_HEX,
		S2_5_HEX, S3_HEX, S3_5_HEX, S4_HEX
	};
	static int state = S0_5;
	
	unsigned int control_mode = step_mode + (dir << 1);
	switch (control_mode) {
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
	
	// Only clear bits that are 1 -> 0
	PORTClearBits(IOPORT_B, ~output & curr); 
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