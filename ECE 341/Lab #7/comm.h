#ifndef __MX7COMM_H__
	#define __MX7COMM_H__

	#define _UART1
#endif

#ifndef __COMM_H__
	#define __COMM_M__

	#define BACKSPACE		0x08
	#define NO_PARITY		0
	#define ODD_PARITY		1
	#define EVEN_PARITY		2
#endif

// Function Prototypes
void initialize_uart1(unsigned int baud, int parity);
void _mon_putc(char c);
int putcU1(int c);
int getcU1(char* ch);
int putsU1(const char* s);
int getstrU1(char* s, unsigned int len);