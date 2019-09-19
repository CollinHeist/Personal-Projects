/* The config_bits.h must be included once and only once in any project */
#include "config_bits.h"    /* Processor configuration definitions */

#include <plib.h>           /* PIC32 Perihperal Library header file */
#include "CerebotMX7cK.h"   /* Cerebot MX7cK pin definitions */

void Cerebot_mx7cK_setup(void) {
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Statement configures cache and wait states for maximum performance
 * Given the options, this function will change the flash wait states, RAM
 * wait state and enable prefetch cache but will not change the PBDIV.
 * The PBDIV value is set via pragma FPBDIV in config_bits.h.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    SYSTEMConfig(SYS_FREQ, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);

    DDPCONbits.JTAGEN = 0;  // Statement is required to use Pin RA0 as IO
    PORTSetPinsDigitalIn(IOPORT_G, BTN1 | BTN2);	// Set BTN1, BTN2 as inputs
	PORTSetPinsDigitalOut(IOPORT_B, SM_LEDS); // Motor driver pins + LEDA/B
	LATBCLR = SM_LEDS;
}