#include <plib.h>

#include "CerebotMX7cK.h"
#include "lab8.h"
#include "LCDlib.h"


char BusyI2C2() {
	return (I2C2CONbits.SEN || I2C2CONbits.PEN || I2C2CONbits.RSEN ||
			I2C2CONbits.RCEN || I2C2CONbits.ACKEN || I2C2STATbits.TRSTAT);
}

int main() {
	unsigned char i2c_byte, write_err = 0;
	char i2c_data[10] = {0};
	int data_count, index;
	
	system_init();
	
	// Create I2C Frame
	i2c_data[0] = ((SLAVE_ADDR << 1) | 0);  // Control Byte
	i2c_data[1] = 0x0000;		// Memory Address MSB
	i2c_data[2] = 0x0420;		// Memory Address LSB
	i2c_data[3] = TEST_DATA;	// The data itself
	
	// Send I2C Frame to EEPROM
	data_count = 4;			// How many bytes to send
	index = 0;				// Start at position zero of i2c_data
	StartI2C2();			// Send I2C STARt
	IdleI2C2();				// Set I2C lines to idle
	while (data_count--)	// Write the data data_count many times
		write_err |= MasterWriteI2C2(i2c_data[index++]);
	StopI2C2();				// Send STOP bit
	IdleI2C2();				// Set I2C lines to idle
	
	if (write_err)			// Return if any error occured during write
		return 1;	
	
	// Poll EEPROM for Write completion
	StartI2C2();			// Initiate I2C START
	IdleI2C2();				// set I2C IDLE
	while (MasterWriteI2C2(i2c_data[0])) {
		RestartI2C2();
		IdleI2C2();
	}
	StopI2C2(); // ACK recieved, write completed
	IdleI2C2();

	// Initiate read from EEPROM
	data_count = 3;
	index = 0;
	StartI2C2();
	IdleI2C2();
	while (data_count--)	// Send control byte & Memory Address
		MasterWriteI2C2(i2c_data[index++])
	RestartI2C2();	// Reverse I2C direction
	IdleI2C2();
	MasterWriteI2C2((SLAVE_ADDR << 1) | 1); // Read operation
	i2c_byte = MasterReadI2C2();
	NotAckI2C2();	// End the read operation with NACK
	IdleI2C2();
	StopI2C2();
	IdleI2C2();

	// Verify the read data == write data
	reset_clear_LCD();
	if (i2c_byte == TEST_DATA)
		put_string_LCD("TEST PASSED");
	else
		put_string_LCD("TEST FAILED");

	while (1);

	return 1;
}

void system_init() {
	Cerebot_mx7cK_setup();
	initialize_LCD();
	OpenI2C2(I2C_EN, BRG_VAL);
}