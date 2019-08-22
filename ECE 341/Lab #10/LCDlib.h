#ifndef __LCDLIB_H__
	#define __LCDLIB_H__

	// Used by the software delay
	#define COUNTS_PER_MS   	8890

	// Macros for LCD line positioning
	#define FIRST_LINE_START	0x0000
	#define FIRST_LINE_END		0x000F
	#define SECOND_LINE_START	0x0040
	#define SECOND_LINE_END		0x004F

	// Values of RS pin to access each register
	#define LCD_RS_CMD		0
	#define LCD_RS_DATA		1
#endif

// Function Prototypes
void init_LCD();
void put_string_LCD(char *char_string);
void put_char_LCD(char c);
void _write_LCD(int reg, char c);
void set_cursor_LCD(unsigned int address);
void reset_clear_LCD();
unsigned int read_LCD(int address);
void sw_delay_ms(unsigned int mS);