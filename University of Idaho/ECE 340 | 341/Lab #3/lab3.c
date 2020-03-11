#include <plib.h>
#include "CerebotMX7cK.h"
#include "lab3.h"

int main() {
	system_init();		// Initialize I/O Pins
	unsigned int button_status = 0;
	unsigned int control_mode  = 0;
	unsigned int motor_hexcode = 0;
    
	while (1) {
        LATBINV = LEDC;                                     // Toggle LEDC for timing purposes
		button_status = read_buttons();						// Read BTN1, BTN2
		control_mode  = decode_buttons(button_status);		// Turn button status -> motor control mode
		motor_hexcode = stepper_state_machine(control_mode);// Adjust SM, get new output for motor
		sw_delay(RPM, control_mode, motor_hexcode);			// Delay the appropriate amount
	}
    
	return 0;
}

void system_init(void) {
	Cerebot_mx7cK_setup();
}

unsigned int read_buttons() {
	return (PORTG & (BTN1 | BTN2));     // Read only BTN1, BTN2
}

// Returns a two bit number
// 	bit 0 is STEP MODE: 0 is HS, 1 is FS
//  bit 1 is DIRECTION: 0 is CW, 1 is CCW
unsigned int decode_buttons(unsigned int portG_state) {
	unsigned int buttons = portG_state >> 6;	// Shift so bits 1-0 are BTN2-BTN1
	// 00 -> 01, 01 -> 00, 10 -> 10, 11 -> 11
	return ((buttons < 2) ? buttons ^ 1 : buttons);
}

unsigned int stepper_state_machine(unsigned int control_mode) {
	enum {S0_5, S1, S1_5, S2, S2_5, S3, S3_5, S4};
    unsigned int return_modes[] = {S0_5_HEX, S1_HEX, S1_5_HEX, S2_HEX,
        S2_5_HEX, S3_HEX, S3_5_HEX, S4_HEX
    };
	static int state = S0_5;	// Initialize to 0_5
    
	switch (control_mode) {
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

void output_to_stepper_motor(unsigned int hexcode) {
	unsigned int output = hexcode << 7;	// Shift so 1A-2B is on pins 10-7

    // Rest old output, apply new one
    PORTClearBits(IOPORT_B, BIT_7 | BIT_8 | BIT_9 | BIT_10);
	PORTSetBits(IOPORT_B, output);
}

// Software-only delay that toggles LEDA every millisecond
void delayMS (unsigned int MS) {
	int i;
	while (MS--) {
		for (i = 0; i < COUNTS_PER_MS; i++) {}
	
		LATBINV = LEDA;
	}
}

void sw_delay(unsigned int rpm, unsigned int control_mode, unsigned int hexcode) {
	unsigned int delay = (control_mode & 0x01) ? (60000 / (rpm * 100)) : (60000 / (rpm * 200));

	output_to_stepper_motor(hexcode);	// Send the current motor config
    LATBINV = LEDC;
	delayMS(delay);                     // Wait the appropriate amount of time

	LATBINV = LEDB; 					// Toggle LED since motor stepped
}