/** 
 *	@file 	LCDlib.c
 *	@brief 	LCD library source file. Gives convenient functions for reading / writing to the LCD over PMP.
 *	@author	Collin Heist
 **/

// Necessary Includes
#include <plib.h>
#include "LCDlib.h"

/**	
 *	@brief	Initialize the LCD module and PMP peripheral.
 *	@param	None.
 *	@return	None.
 **/
void initialize_LCD(void) {
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
	PMPMasterWrite(0x000C);		// Write 0x0F | On, cursor on, blinking
								// Changed to 0x000C | On, cursor off and not blinking
	sw_delay_ms(50);			// Delay >37 ms
	PMPMasterWrite(0x0001);		// Write 0x01 | Clear display
	sw_delay_ms(5);				// Delay >1.52 ms
}

/**	
 *	@brief		Function to write a provded string to the LCD.
 *	@param[in]	char_string: Character string that will be written to the LCD (must be null-terminated).
 *	@return		None.
 **/
void put_string_LCD(char *char_string) {
	while (*char_string) {	// While not at \0 character
		put_char_LCD(*char_string);
		char_string++;		// Move pointer to next character
	}
}

/**	
 *	@brief		Function to place a single character on the LCD. Outlines behavior for
 				'special' characters (like \n, and \r).
 *	@param[in]	c: Character to be written to the LCD.
 *	@return		None.
 **/
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
			if (curr_addr == FIRST_LINE_END)
				next_addr = SECOND_LINE_START;
			else if (curr_addr == SECOND_LINE_END)
				next_addr = FIRST_LINE_START;
			else
				next_addr = curr_addr + 1;
			break;
	}
	set_cursor_LCD(next_addr);	// Move cursor
}

/**	
 *	@brief		Function to write a given byte (char) to the selected register of the LCD.
 *	@param[in]	reg: What register to select with the PMP peripheral.
 *	@param[in]	c: What byte (character) to write to the LCD.
 *	@return		None.
 *	@notes		The existing software delays are (for some reason) necessary.
 **/
static void _write_LCD(int reg, char c) {
	while (read_LCD(LCD_RS_CMD) & 0x0080);
	PMPSetAddress(reg);
	sw_delay_us(25);
	PMPMasterWrite(c);
	sw_delay_us(50);
}

/**	
 *	@brief		Function to move the cursor on the LCD.
 *	@param[in]	address: What address (location) to move the cursor to on the LCD.
 *	@return		None.
 **/
void set_cursor_LCD(unsigned int address) {
	_write_LCD(LCD_RS_CMD, (address & 0x007F) | 0x0080);
}

/**	
 *	@brief	Clear the LCD and reset the cursor to the start of line 1.
 *	@param	None.
 *	@return	None.
 **/
void reset_clear_LCD(void) {
	PMPMasterWrite(0x0001);	// Clear display
	sw_delay_ms(2);			// Datasheet says this takes ~1.53ms
}

/**	
 *	@brief		Read the value on the LCD at the specified address.
 *	@param[in]	What address to read from the LCD at.
 *	@return		unsigned int that represents the result of the PMP read.
 **/
unsigned int read_LCD(int address) {
	PMPSetAddress(address);
	mPMPMasterReadByte();

	return mPMPMasterReadByte();
}

// Software delay for the appropriate number of milliseconds
/**	
 *	@brief		Implements a software delay with resolution in milliseconds.
 *	@param[in]	ms: How many milliseconds to wait
 *	@return		None.
 *	@notes		This function uses the value of COUNTS_PER_MS as defined in the header file to implement the delay.
 **/
static void sw_delay_ms(unsigned int ms) {
	int i;
	while (ms--) {
		for (i = 0; i < COUNTS_PER_MS; i++);
	}
}

// Software delay for the appropriate number of microseconds
/**	
 *	@brief		Implements a software delay with resolution in microseconds.
 *	@param[in]	us: How many microseconds to wait
 *	@return		None.
 **/
static void sw_delay_us(unsigned int us) {
	int i;
	while (us--) {
		for (i = 0; i < (int) (COUNTS_PER_MS / 1000); i++);
	}
}