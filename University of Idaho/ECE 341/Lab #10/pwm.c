#include <plib.h>
#include "CerebotMX7cK.h"
#include "pwm.h"

unsigned int t2_tick;

// Initialize the OC module, as well as timer 2
unsigned int init_pwm(unsigned int duty_cycle, unsigned int pwm_freq) {
	// Timer 2 Initialization
	t2_tick = T2_CLOCK_RATE / pwm_freq;
	if (t2_tick > 2^16)
		return 1;
	OpenTimer2(T2_ON | T2_SOURCE_INT | T2_PS_1_1, t2_tick - 1);
	mT2SetIntPriority(2);
	mT2SetIntSubPriority(1);
	mT2IntEnable(1);

	// Output Compare Module
	if (duty_cycle > 100)
		return 1;
	unsigned int start_val = duty_cycle * (t2_tick - 1);
	OpenOC3(OC_ON | OC_TIMER_MODE16 | OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE, start_val, start_val);

	return 0;
}

// Set the PWM output to a set duty cycle [0%, 100%]
unsigned int set_pwm(unsigned int duty_cycle) {
	if (duty_cycle > 100)
		return 1;

	SetDCOC3PWM((float) duty_cycle / 100.0 * (t2_tick - 1));

	return 0;
}

// Timer 2, 1ms ISR
void __ISR(_TIMER_2_VECTOR, IPL2) Timer2Handler(void) {
	LATBINV = LEDA;
	mT2ClearIntFlag();
}