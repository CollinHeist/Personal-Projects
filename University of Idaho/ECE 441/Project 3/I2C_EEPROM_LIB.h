#ifndef __I2C_EEPROM_LIB_H__
	#define __I2C_EEPROM_LIB_H__

	#define FSCK					400000
	#define BRG_VAL					((FPB / 2 / FSCK) - 2)
	#define PAGE_LEN				64

	#define WRITE					0
	#define READ					1

	#define CURR_MEM_ADDR			-1
	#define NO_ERR					0
	#define ERR_ZERO_LENGTH			1
	#define ERR_INVALID_MEM_ADDR	2
	#define ERR_INVALID_READ		3

	#define EEPROM_MAX_MEM_ADDR		0x7FFF

	#define FALSE					0
	#define TRUE					1
#endif

// Function Prototypes
void init_eeprom();
int is_multiple(int value, int multiple);
int read_eeprom(int slave_addr, int mem_addr, char* i2c_data, int length);
int write_eeprom(int slave_addr, int mem_addr, char* i2c_data, int length);
void poll_eeprom(int slave_addr);
int send_control_byte(int slave_addr, int mem_addr, int r_w);