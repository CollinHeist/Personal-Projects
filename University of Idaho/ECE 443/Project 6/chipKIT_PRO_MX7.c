#include <plib.h>
#include "config_bits.h"
#include "chipKIT_PRO_MX7.h"

void chipKIT_PRO_MX7_Setup(void) {
	SYSTEMConfig(GetSystemClock(), SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);

	DDPCONbits.JTAGEN = 0;  // Statement is required to use Pin RA0 as IO
}