#ifndef __PWM_H__
	#define __PWM_H__

	// Timer 2 configuration macros
	#define T2_PRESCALE			1
	#define T2_CLOCK_RATE		(FPB / T2_PRESCALE)
#endif

// Function prototypes
unsigned int init_pwm(unsigned int duty_cycle, unsigned int pwm_freq);
unsigned int set_pwm(unsigned int duty_cycle);