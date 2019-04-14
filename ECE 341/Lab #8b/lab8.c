#include <plib.h>
#include <stdio.h>
#include <string.h>

#include "CerebotMX7cK.h"
#include "lab8.h"
#include "I2C_EEPROM_LIB.h"
#include "LCDlib.h"

int main() {
	system_init();

	// Variable Declaration & Initialization
	char write_buff[DATA_LEN] = {0};
	char read_buff[DATA_LEN]  = {0};
	int i;
	for (i = 0; i < DATA_LEN; i++)
		write_buff[i] = i;

	// Start writing the data to the EEPROM
	reset_clear_LCD();
	sw_delay_ms(20);
	put_string_LCD("Writing to the EEPROM");

	write_eeprom(SLAVE_ADDR, START_ADDR, write_buff, DATA_LEN);

	// Start reading the data from the EEPROM
	reset_clear_LCD();
	sw_delay_ms(20);
	put_string_LCD("Reading from the EEPROM");

	read_eeprom(SLAVE_ADDR, START_ADDR, read_buff, DATA_LEN);

	// Determine if the data was valid
	int valid = TRUE;
	for (i = 0; i < DATA_LEN; i++)
		valid = (!valid ? FALSE : (write_buff[i] == read_buff[i] ? TRUE : FALSE));

	reset_clear_LCD();
	sw_delay_ms(20);
	
	char number_str[5];
	char corr_str[25] = "All ";

	sprintf(number_str, "%d", DATA_LEN);
	strcat(corr_str, number_str);
	strcat(corr_str, " bytes match");
	if (valid) 
		put_string_LCD(corr_str);
	else
		put_string_LCD("One of the bytes does not match");

	while (1);

	return 1;
}

void system_init() {
	Cerebot_mx7cK_setup();
	init_LCD();
	init_eeprom();
}