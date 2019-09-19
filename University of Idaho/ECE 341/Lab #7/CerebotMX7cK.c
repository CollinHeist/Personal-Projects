#include "config_bits.h"

#include <plib.h>
#include "CerebotMX7cK.h"

void Cerebot_mx7cK_setup(void) {
    SYSTEMConfig(SYS_FREQ, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);

    DDPCONbits.JTAGEN = 0;
}