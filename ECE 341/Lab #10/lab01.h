#ifndef __LAB10_H__
	#define __LAB10_H__

	#define BUFFER_LEN			32

	// Helpful boolean macros
	#define FALSE				0
	#define TRUE				1
#endif

// Function prototypes
void system_init(void);
unsigned int read_buttons(void);
unsigned int decode_buttons(unsigned int portG_state);
void hw_delay(unsigned int mS);