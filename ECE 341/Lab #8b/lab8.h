#define TIMING_TEST

#ifndef __LAB8_H__
	#define __LAB8_H__

	// Macros for the EEPROM
	#define SLAVE_ADDR		0x0050

	// Different case-tests
	#ifdef MIDDLE_1_TEST
		#define DATA_LEN	1
		#define START_ADDR	0x42
	#endif

	#ifdef END_1_TEST
		#define DATA_LEN	1
		#define START_ADDR	63
	#endif

	#ifdef START_64_TEST
		#define DATA_LEN	64
		#define START_ADDR  0
	#endif

	#ifdef MIDDLE_64_TEST
		#define DATA_LEN	64
		#define START_ADDR	0x42
	#endif

	#ifdef MIDDLE_150_TEST
		#define DATA_LEN	150
		#define START_ADDR	0x42
	#endif

	#ifdef TIMING_TEST
		#define DATA_LEN	32768
		#define START_ADDR	0x00
	#endif


	// Helpful boolean macros
	#define FALSE			0
	#define TRUE			1
#endif

// Function prototypes
void system_init(void);