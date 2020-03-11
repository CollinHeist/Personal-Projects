#ifndef __LAB4_H__
	#define __LAB4_H__

	#define COUNTS_PER_MS   8890

	#define T1_PRESCALE			1
	#define TOGGLES_PER_SEC		1000
	#define T1_TICK				(FPB/T1_PRESCALE/TOGGLES_PER_SEC)

	// Useful remaps of motor states
	#define H_CW			0
	#define F_CW			1  
	#define H_CCW			2
	#define F_CCW			3

	// Useful remaps for motor state outputs
	#define S0_5_HEX		0x0A
	#define S1_HEX			0x08
	#define S1_5_HEX		0x09
	#define S2_HEX			0x01
	#define S2_5_HEX		0x05
	#define S3_HEX			0x04
	#define S3_5_HEX		0x06
	#define S4_HEX			0x02

	// Default values for sampling / outputting to 
	#define BTN_PRD			100
	#define MOT_PRD			10

	#define RPM10			0
	#define RPM15			1
	#define RPM25			2
#endif

// Function prototypes
void system_init(void);
unsigned int read_buttons();
unsigned int decode_buttons(unsigned int portG_state);
unsigned int stepper_state_machine(unsigned int control_mode);
void output_to_stepper_motor(unsigned int hexcode);
void Timer1_delay(unsigned int* button_delay, unsigned int* step_delay);