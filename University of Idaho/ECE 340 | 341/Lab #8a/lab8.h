#ifndef __LAB8_H__
	#define __LAB8_H__

	// Macros for initializing the I2C Module
	#define FSCK			400000
	#define BRG_VAL			((FPB / 2 / FSCK) - 2)
	#define TEST_DATA		0x6969
	#define SLAVE_ADDR		0x0050

	#define FALSE				0
	#define TRUE				1
#endif

// Function prototypes
void system_init(void);