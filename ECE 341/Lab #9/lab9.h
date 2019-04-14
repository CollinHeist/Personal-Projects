#ifndef __LAB9_H__
	#define __LAB9_H__

	#define COUNTS_PER_MS		8890

	// Timer 2 configuration macros
	#define T2_PRESCALE			1
	#define TOGGLES_PER_SEC		1000
	#define T2_TICK				(FPB / T2_PRESCALE / TOGGLES_PER_SEC)

	// Helpful boolean macros
	#define FALSE				0
	#define TRUE				1
#endif

// Function prototypes
void system_init(void);
unsigned int read_buttons(void);
unsigned int decode_buttons(unsigned int portG_state);
void hw_delay(unsigned int mS);