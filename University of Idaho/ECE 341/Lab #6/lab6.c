#include <plib.h>

#include "CerebotMX7cK.h"
#include "LCDlib.h"
#include "lab6.h"

char string1[] = "Does Dr J prefer PIC32 or FPGA??";
char string2[] = "Answer: \116\145\151\164\150\145\162\041";
char *msgs[]   = {string1, string2};

int main() {
	system_init();

	unsigned int mode = 0;
	
	while (1) {
		reset_clear_LCD();
		put_string_LCD(msgs[mode++ % 2]);
		sw_delay_ms(5000);
	}
	
	return 0;
}

// Hardware initialization
void system_init() {
	Cerebot_mx7cK_setup();
	initialize_LCD();
}