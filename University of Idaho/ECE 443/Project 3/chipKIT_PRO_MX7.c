#include <plib.h>               /* PIC32 System header file */
#include "config_bits.h"        /* Processor configuration definitions */
#include "chipKIT_PRO_MX7.h"    /* chipKIT PRO MX7  pin definitions */

/* chipKIT_PRO_MX7_Setup FUNCTION DESCRIPTION ********************************
 * SYNTAX:          void chipKIT_PRO_MX7_Setup(void);
 * KEYWORDS:        chipKIT PRO MX7, PIC32, setup
 * Parameters:      None
 * Return:          None
 * Notes:           None
 * END DESCRIPTION ********************************************************/
void chipKIT_PRO_MX7_Setup(void) {
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Statement configure cache, wait states and peripheral bus clock
 * Configure the device for maximum performance but do not change the PBDIV
 * Given the options, this function will change the flash wait states, RAM
 * wait state and enable prefetch cache but will not change the PBDIV.
 * The PBDIV value is already set via the pragma FPBDIV option above..
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    SYSTEMConfig(GetSystemClock(), SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);

    DDPCONbits.JTAGEN = 0;  // Statement is required to use Pin RA0 as IO
}