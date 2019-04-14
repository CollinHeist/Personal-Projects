#include <plib.h>
#include "CerebotMX7cK.h"
#include "Project2.h"

int main() {
	int mS = 1; /* Set total delay time – change as needed */

	system_init();
	while (1) {
		LATBINV = LEDB;		// LEDB represents time delay between calls of main
							// LEDA represents time delay for the msDelay functions
		sw_msDelay(mS);
		// hw_msDelay(mS);
	}
	return 0;
}

void system_init(void) {
	Cerebot_MX7cK_setup();
	PORTSetPinsDigitalOut(IOPORT_B, SM_LEDS);
	LATBCLR = SM_LEDS;
}

void sw_msDelay (unsigned int mS) {
	int i;
	while (mS--) {
		for (i = 0; i < COUNTS_PER_MS; i++) {}
	
		LATBINV = LEDA; // Toggle LEDA each ms for instrumentation
	}
}

void hw_msDelay(unsigned int mS) {
	unsigned int tWait, tStart;
	tStart = ReadCoreTimer(); // Read core timer count - SW Start breakpoint
	tWait  = (CORE_MS_TICK_RATE * mS); // Set time to wait

	while ((ReadCoreTimer() - tStart) < tWait); // Wait for the time to pass
	LATBINV = LEDA; // Toggle LED at end of delay period
}