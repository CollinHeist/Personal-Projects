/** 
 *	@file 	SMBus_IR.c
 *	@brief	Library file for interfacing with the IR Sensor over SMBus
 *	@author	Collin Heist
 **/

// File Inclusion
#include <plib.h>
#include "chipKIT_Pro_MX7.h"
#include "SMBus_IR.h"

/**	
 *	@brief	Initialize the hardware necessary for the IR Sensor (I2C1).
 *	@return	None.
 **/
void initialize_ir_sensor(void) {
	OpenI2C1(I2C_EN, I2C_CLOCK_VAL);	// I2C_EN or I2C_SM_EN
	IdleI2C1();
}

/**	
 *	@brief	Read the temperature of the IR Sensor.
 *	@return	(Float) Temperature listed in T_OBJ_ADDR of IR sensor, after conversion to Celsius.
 **/
float read_ir_temp(void) {
	int i2c_data[3] = {0};						// Empty array that the I2C data will be read into
	
	// Start an I2C transaction
	StartI2C1();
	IdleI2C1();
	
	/** 
	 *	Start a read by WRITING and selecting the temperature address, and then 
	 *	RESTARTING and sending a read bit. What follows will be the temp + pec.
	 **/
	wait_for_ack(SLAVE_ADDR << 1 | WRITE);
	wait_for_ack(T_OBJ_ADDR);
	RestartI2C1();								// Send a ReSTART
	IdleI2C1();
	wait_for_ack(SLAVE_ADDR << 1 | READ);
	
	int length = 3;								// We'll be reading three I2C bytes
	int index = 0;
	while (length--) {
		i2c_data[index++] = MasterReadI2C1();	// Read the incoming byte
		AckI2C1();								// ACK the received byte
		IdleI2C1();
	}
	StopI2C1();									// Terminate the read with a STOP
	IdleI2C1();
	
	/**
	 *	Combine the just-read data in the correct order ([LSB, MSB, PEC]).
	 *	Check if the most significant byte is high, indicating an error
	 **/
	unsigned int raw_temp = i2c_data[0] + (i2c_data[1] << 8);
	if (raw_temp & READ_ERROR_FLAG)				// The error flag is high, return accordingly
		return ERROR_TEMP;
	
	/// Return the temperature in degC
	return (CELCIUS_TO_FARENHEIT(KELVIN_TO_CELSIUS(((float)raw_temp) * IR_SENSOR_RES)));
}

/**	
 *	@brief	Write to I2C1, resending the data until an ACK is received 
 *	@param	data_bye	The I2C data byte being sent to I2C1.
 *	@return	None.
 **/
static void wait_for_ack(unsigned int data_byte) {
	/// Resend the data byte until an acknowledge is received
	int tries = ATTEMPT_COUNT;
	while (tries--) {
		MasterWriteI2C1(data_byte);
		IdleI2C1();
		
		// ACKSTAT is 0 when the slave acknowledges 
		if (!I2C1STATbits.ACKSTAT)
			break;
	}
}