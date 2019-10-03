#ifndef __SMBUS_IR_H__
	#define __SMBUS_IR_H__

	/// I2C Configuration Settings
	#define FSCK					40000
	#define I2C_CLOCK_VAL			((FPB / 2 / FSCK) - 2)
	#define ATTEMPT_COUNT			10

	/// Settings for interfacing with the IR Sensor
	#define SLAVE_ADDR				0x005A					/// Default slave address of the IR Sensor
	#define	T_OBJ_ADDR				0x0007					/// Address in RAM of the sensor's read temperature
	#define READ_ERROR_FLAG			0x8000					/// This bit corresponds to the IR sensor's error flag
	#define ERROR_TEMP				(-1000.0)
	#define IR_SENSOR_RES			0.02					/// Each bit corresponds to 0.02 degC
	#define KELVIN_TO_CELSIUS(C)	((float) C - 273.15)

	/// I2C bit levels - write is LOW, read is HIGH
	#define WRITE					0
	#define READ					1	

	/// Function Prototypes
	void initialize_ir_sensor(void);
	float read_ir_temp(void);
	static void wait_for_ack(unsigned int data_byte);
#endif