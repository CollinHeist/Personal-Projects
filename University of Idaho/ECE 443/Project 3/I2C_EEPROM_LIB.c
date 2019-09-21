#include <plib.h>

#include "CerebotMX7cK.h"
#include "I2C_EEPROM_LIB.h"

// Initialize the I2C2 peripheral for interacting with the EEPROM
void init_eeprom() {
	OpenI2C2(I2C_EN, BRG_VAL);
	IdleI2C2();
}

int is_multiple(int value, int multiple) {
	return (value % multiple ? FALSE : TRUE)
}

// Read the specified number of bytes from the device with the provided
// slave address, at the provided memory address, into the character array
int read_eeprom(int slave_addr, int mem_addr, char* i2c_data, int length) {
	if (!length)
		return ERR_ZERO_LENGTH;

	if (mem_addr + length > 0x7FFF || mem_addr < 0)
		return ERR_INVALID_MEM_ADDR;

	int i2c_error = 0;
	StartI2C2();
	IdleI2C2();

	i2c_error |= send_control_byte(slave_addr, mem_addr, WRITE);
	RestartI2C2();
	IdleI2C2();
	i2c_error |= send_control_byte(slave_addr, CURR_MEM_ADDR, READ);

	if (i2c_error)
		return ERR_INVALID_READ;
	
	int index = 0;
	while (length-- > 1) { // Stop one bit short
		i2c_data[index++] = MasterReadI2C2();
		AckI2C2();
		IdleI2C2();
	}
	i2c_data[index++] = MasterReadI2C2();
	NotAckI2C2();	// End read operation NACK
	IdleI2C2();
	StopI2C2();
	IdleI2C2();

	return NO_ERR;
}

// Write the provided length of bytes from the character array into the
// specified location in memory at the specified slave address
int write_eeprom(int slave_addr, int mem_addr, char* i2c_data, int length) {
	if (!length)
		return ERR_ZERO_LENGTH;

	if (mem_addr + length > EEPROM_MAX_MEM_ADDR || mem_addr < 0)
		return ERR_INVALID_MEM_ADDR;

	int index = 0;
	int i2c_error = 0;

	StartI2C2();
	IdleI2C2();
	while (length--) {
		if (is_multiple(mem_addr + index, PAGE_LEN)) {
			StopI2C2();
			IdleI2C2();
			poll_eeprom(slave_addr);
			StartI2C2();
			IdleI2C2();
			i2c_error |= send_control_byte(slave_addr, mem_addr + index, WRITE);
		}
		i2c_error |= MasterWriteI2C2(i2c_data[index++]);
	}
	StopI2C2();
	IdleI2C2();
	
	return i2c_error;
}

// Blocking to wait for the EEPROM to become free
void poll_eeprom(int slave_addr) {
	StartI2C2();
	IdleI2C2();
	while (MasterWriteI2C2(slave_addr << 1 | WRITE)) {
		RestartI2C2();
		IdleI2C2();
	}
	StopI2C2();
	IdleI2C2();
}

// Send the control byte to the passed slave for targeting this address
// Does not terminate the I2C sequence, so a read or write can continue
int send_control_byte(int slave_addr, int mem_addr, int r_w) {
	int i2c_error = 0;
	int control_len = (mem_addr < 0) ? 1 : 3; // Use negative to denote no memory address
	int control_byte[3];
	control_byte[0] = slave_addr << 1 | r_w;

	if (control_len == 3) { // If we're re-adressing the EEPROM
		control_byte[1] = (mem_addr & 0xFF00) >> 8;
		control_byte[2] = mem_addr & 0x00FF;
	}

	int index = 0;
	while (control_len--)
		i2c_error |= MasterWriteI2C2(control_byte[index++]);

	return i2c_error;
}