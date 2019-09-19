#include <plib.h>

#include "LCDlib.h"

// Hardware Initialization of the LCD
void initialize_LCD() {
	int CONTROL   = PMP_ON | PMP_READ_WRITE_EN |
					PMP_READ_POL_HI | PMP_WRITE_POL_HI;
	int MODE	  = PMP_DATA_BUS_8 | PMP_MODE_MASTER1 |
					PMP_WAIT_BEG_1 | PMP_WAIT_MID_2 | PMP_WAIT_END_1;
	int PORT	  = PMP_PEN_0;
	int INTERRUPT = PMP_INT_OFF;
	mPMPOpen(CONTROL, MODE, PORT, INTERRUPT);
	
	// Configuring the LCD itself
	sw_delay_ms(30);			// Delay >20 ms
	PMPSetAddress(LCD_RS_CMD);	// Set RS=0
	PMPMasterWrite(0x0038);		// Write 0x38 | 8-bit data, 2-lines, 5x8 font
	sw_delay_ms(50);			// Delay >37 ms
	PMPMasterWrite(0x000F);		// Write 0x0F | On, cursor on, blinking
	sw_delay_ms(50);			// Delay >37 ms
	PMPMasterWrite(0x0001);		// Write 0x01 | Clear display
	sw_delay_ms(5);				// Delay >1.52 ms
}

// Put the provided string onto the LCD
void put_string_LCD(char *char_string) {
	while (*char_string) {	// While not at \0 character
		put_char_LCD(*char_string);
		char_string++;		// Move pointer to next character
	}
}

// Put a single character to the LCD
void put_char_LCD(char c) {	
	unsigned int curr_addr = read_LCD(LCD_RS_CMD) & 0x007F;	// Ignore busy flag
	unsigned int next_addr;
	switch (c) {
		case '\r':	// Reset to beginning of current line
			next_addr = (curr_addr >= SECOND_LINE_START) ? SECOND_LINE_START : FIRST_LINE_START;
			break;
		case '\n':	// Move to beginning of next line
			next_addr = (curr_addr >= SECOND_LINE_START) ? FIRST_LINE_START : SECOND_LINE_START;
			break;
		default:
			_write_LCD(LCD_RS_DATA, c);	// Write character to data field of LCD
			if (curr_addr == FIRST_LINE_END) {
				next_addr = SECOND_LINE_START;
			}
			else if (curr_addr == SECOND_LINE_END) {
				next_addr = FIRST_LINE_START;
			}
			else {
				next_addr = curr_addr + 1;
			}
			break;
	}
	set_cursor_LCD(next_addr);	// Move cursor
}

// Write the passed character to the LCD, not called externally
void _write_LCD(int reg, char c) {
	while (read_LCD(LCD_RS_CMD) & 0x0080);
	PMPSetAddress(reg);
	sw_delay_ms(5);
	PMPMasterWrite(c);
	sw_delay_ms(5);
}

// Move the LCD cursor to the provided address
void set_cursor_LCD(unsigned int address) {
	_write_LCD(LCD_RS_CMD, (address & 0x007F) | 0x0080);
}

// Move the LCD cursor back to the start, clear display
void reset_clear_LCD() {
	PMPMasterWrite(0x0001);	// Clear display
	sw_delay_ms(50);
}

// Read value at a specific address
// Returns an unsigned int since it's only being used to read address counter
unsigned int read_LCD(int address) {
	PMPSetAddress(address);
	mPMPMasterReadByte();

	return mPMPMasterReadByte();
}

// Software delay for the appropriate number of milliseconds
void sw_delay_ms(unsigned int mS) {
	int i;
	while (mS--) {
		for (i = 0; i < COUNTS_PER_MS; i++);
	}
}