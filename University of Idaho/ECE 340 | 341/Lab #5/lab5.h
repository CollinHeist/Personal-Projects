#ifndef __LAB5_H__
	#define __LAB5_H__

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

	#define RPM10			0
	#define RPM15			1
	#define RPM25			2
#endif

// Function prototypes
void system_init(void);
void __ISR(_TIMER_1_VECTOR, IPL2) Timer1Handler(void);
void __ISR(_CHANGE_NOTICE_VECTOR, IPL1) CNIntHandler(void);
unsigned int read_buttons(void);
void decode_buttons(unsigned int portG_state);
void stepper_state_machine(void);
void output_to_stepper_motor(unsigned int hexcode);
void hw_delay(unsigned int mS);