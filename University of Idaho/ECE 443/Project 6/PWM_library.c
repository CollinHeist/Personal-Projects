/** 
 *	@file	PWM.c
 *	@brief	PWM source file. Uses Timer 2 for PWM implementation.
 *	@author	Collin Heist
 **/

// File Inclusion
#include <plib.h>
#include "chipKIT_Pro_MX7.h"
#include "PWM_library.h"

// Global Variables
static unsigned int t2_tick;

/**	
 *	@brief		Initalize the PWM module for a given starting duty cycle and frequency.
 *	@param[in]	duty_cycle: What duty cycle (as a %) to initialize the PWM output to.
 *	@param[in]	pwm_freq: What frequency to initialize Timer 2 to.
 *	@return		Boolean flag (TRUE or FALSE) if there was an error or not.
 **/
unsigned int initialize_pwm(unsigned int duty_cycle, unsigned int pwm_freq) {
	// Motor Directionality
//	PORTSetPinsDigitalOut(IOPORT_D, BIT_1 | BIT_8);
//	LATDCLR = BIT_1;
    
	// Timer 2 Initialization
	t2_tick = T2_CLOCK_RATE / pwm_freq;
	if (t2_tick > (1 << 15))
		return 1;
    
	OpenTimer2(T2_ON | T2_SOURCE_INT | T2_PS_1_1, t2_tick - 1);
	mT2SetIntPriority(2);
	mT2SetIntSubPriority(1);
	mT2IntEnable(1);

	
	if (duty_cycle > 100)
		return 1;
    
    // Output Compare Module
	unsigned int start_val = duty_cycle * (t2_tick - 1);
	OpenOC3(OC_ON | OC_TIMER_MODE16 | OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE, start_val, start_val);

	return 0;
}

/**	
 *	@brief		Set the PWM output to a given duty cycle (between 0% and 100%).
 *	@param[in]	duty_cycle: What duty cycle (as a %) to set the PWM output to.
 *	@return		Boolean flag (TRUE or FALSE) if there was an error or not.
 **/
unsigned int set_pwm(unsigned int duty_cycle) {
	if (duty_cycle > 100)
		return 1;

	SetDCOC3PWM((float) duty_cycle / 100.0 * (t2_tick - 1));

	return 0;
}

/**	
 *	@brief	ISR for Timer 2 - the PWM timer.
 *	@param	None.
 *	@return	None.
 **/
void __ISR(_TIMER_2_VECTOR, IPL2) Timer2Handler(void) {
    Nop();
	mT2ClearIntFlag();
}