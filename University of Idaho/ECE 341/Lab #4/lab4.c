#include <plib.h>
#include "CerebotMX7cK.h"
#include "lab4.h"

int main() {
	system_init();
	unsigned int button_delay  = BTN_PRD;
    unsigned int step_delay    = MOT_PRD;
	unsigned int rev_min       = 10;
	unsigned int del_mode      = 0;
	unsigned int button_status = 0;
	unsigned int control_mode  = 0;
	unsigned int motor_hexcode = 0;
    
	while (1) {
		// Read the buttons every 100ms
		if (!button_delay) {
			button_status = read_buttons();
			control_mode  = decode_buttons(button_status);

			button_delay  = BTN_PRD;
			LATBINV       = LEDB;
		}

		// Step the motor every variable time (based on control_mode)
		if (!step_delay) {
			motor_hexcode = stepper_state_machine(control_mode);
			output_to_stepper_motor(motor_hexcode);

			// Look at bits 2-3 for the proper time delay
			del_mode = (control_mode & 12) >> 2;
			rev_min  = (del_mode == RPM10) ? 10 : (del_mode == RPM15) ? 15 : 25;
            step_delay = 1.0 / ((float)rev_min * 100.0 / 60.0 / 1000.0);
            
			LATBINV  = LEDC;
		}
		// See if 1ms has passed, decrement the delays if so
		Timer1_delay(&button_delay, &step_delay);
	}
    
	return 0;
}

// Initialize the necessary I/O pins and timers
void system_init(void) {
	Cerebot_mx7cK_setup();
	OpenTimer1(T1_ON | T1_PS_1_1, T1_TICK-1);		// Initialize T1 to 1ms
	PORTSetPinsDigitalIn(IOPORT_G, BTN1 | BTN2);	// Set BTN1, BTN2 as inputs
	PORTSetPinsDigitalOut(IOPORT_B, SM_COILS | BIT_2 | BIT_3 | BIT_4);
	LATBCLR =  SM_COILS | BIT_2 | BIT_3 | BIT_4;
}

// Reads the PORTG values of BTN1, BTN2
unsigned int read_buttons() {
	return (PORTG & (BTN1 | BTN2));     // Read only BTN1, BTN2
}

// Returns a two bit number
// 	bit 0 is STEP MODE: 0 is HS, 1 is FS
//  bit 1 is DIRECTION: 0 is CW, 1 is CCW
//  bit 2/3 is SPEED  : 00 is 10, 01 is 15, 10 is 25
unsigned int decode_buttons(unsigned int portG_state) {
	unsigned int buttons = portG_state >> 6;	// Shift so bits 1-0 are BTN2-BTN1
	// 00 -> 0100, 01 -> 0101, 10 -> 0010, 11 -> 1011
	return (buttons < 2 ? 4 + buttons : ((buttons & 1) << 3) + buttons);
}

// Increment the state machine
unsigned int stepper_state_machine(unsigned int control_mode) {
	enum {S0_5, S1, S1_5, S2, S2_5, S3, S3_5, S4};
    unsigned int return_modes[] = {S0_5_HEX, S1_HEX, S1_5_HEX, S2_HEX,
        S2_5_HEX, S3_HEX, S3_5_HEX, S4_HEX
    };
	static int state = S0_5;		// Initialize to 0_5
    
	switch (control_mode & 0x03) {	// Ignore speed bits
        case H_CW:
            state = (state - 1) < S0_5 ? S4        : state - 1;
            break;
        case F_CW:
            state = (state - 2) < S0_5 ? state + 6 : state - 2;
            break;
        case H_CCW:
            state = (state + 1) > S4   ? S0_5      : state + 1;
            break;
        case F_CCW:
            state = (state + 2) > S4   ? state - 6 : state + 2;
            break;
    }
    
    return return_modes[state];
}

// Send four bit hexcode to motor pins
void output_to_stepper_motor(unsigned int hexcode) {
	unsigned int output = hexcode << 7;	// Shift so 1A-2B is on pins 10-7
    unsigned int curr   = LATB & (BIT_7 | BIT_8 | BIT_9 | BIT_10);
    
    // Reset old output, apply new one
    PORTClearBits(IOPORT_B, ~output & curr); // Only clear bits that are 1 -> 0
	PORTSetBits(IOPORT_B, output);
}

void Timer1_delay(unsigned int* button_delay, unsigned int* step_delay) {
	while (!mT1GetIntFlag()) {}
	mT1ClearIntFlag();			// Clear the flag
	LATBINV = LEDA;				// Toggle LEDA

	*step_delay -= 1;
	*button_delay -= 1;
}