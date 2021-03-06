/** 
 *	@file	PWM.h
 *	@brief	PWM header file. Defines the clock rate for timer 2.
 *	@author	Collin Heist
 **/

#ifndef __PWM_LIBRARY_H__
	#define __PWM_LIBRARY_H__

	// Timer 2 configuration macros
	#define T2_PRESCALE			1
	#define T2_CLOCK_RATE		(FPB / T2_PRESCALE)

	// Function prototypes
	unsigned int initialize_pwm(unsigned int duty_cycle, unsigned int pwm_freq);
	unsigned int set_pwm(unsigned int duty_cycle);
#endif