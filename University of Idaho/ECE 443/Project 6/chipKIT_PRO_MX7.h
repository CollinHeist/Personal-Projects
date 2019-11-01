#ifndef __chipKIT_PRO_MX7_H__
	#define __chipKIT_PRO_MX7_H__

	#define BTN1		BIT_6		// Port G
	#define BTN2		BIT_7
	#define BTN3		BIT_0		// Port A

	#define LED1		BIT_12		// Port G
	#define LED2		BIT_13
	#define LED3		BIT_14
	#define LED4		BIT_15
	#define BRD_LEDS	(LED1 | LED2 | LED3 | LED4)

	#define LED1_IO(a)	LATG.LATG12 = a
	#define LED2_IO(a)	LATG.LATG13 = a
	#define LED3_IO(a)	LATG.LATG14 = a
	#define LED4_IO(a)	LATG.LATG15 = a

	#define LEDA_IO(a)	LATB.LATB2 = a
	#define LEDB_IO(a)	LATB.LATB3 = a
	#define LEDC_IO(a)	LATB.LATB4 = a
	#define LEDD_IO(a)	LATB.LATB6 = a
	#define LEDE_IO(a)	LATB.LATB7 = a
	#define LEDF_IO(a)	LATB.LATB8 = a
	#define LEDG_IO(a)	LATB.LATB9 = a
	#define LEDH_IO(a)	LATB.LATB10 = a

	/* The following definitions are for IO assigned for the PmodSTEP stepper
	 * motor driver board that is commonly used for instrumentation and output
	 * indication */

	#define LEDA		BIT_2		//  Port B
	#define LEDB		BIT_3
	#define LEDC		BIT_4
	#define LEDD		BIT_6
	#define LEDE		BIT_7
	#define LEDF		BIT_8
	#define LEDG		BIT_9
	#define LEDH		BIT_10
	#define SM1			LEDE
	#define SM2			LEDF
	#define SM3			LEDG
	#define SM4			LEDH

	#define SM_LEDS		(LEDA | LEDB | LEDC | LEDD | LEDE | LEDF | LEDG | LEDH)
	#define SM_COILS	( LEDE | LEDF | LEDG | LEDH)

	// Clock Definitions
	#define XTAL					(8000000ul) // 8 MHz Xtal on chipKIT PRO MX7
	#define GetSystemClock()		(80000000ul)
	#define GetCoreClock()			(GetSystemClock()/2)
	#define GetPeripheralClock()	(GetSystemClock()/8)
	#define SYSTEM_FREQ				GetSystemClock()

	#define FPB						GetPeripheralClock()

	#define CORE_MS_TICK_RATE		GetCoreClock()/1000

	// Function Prototypes
	void chipKIT_PRO_MX7_Setup(void);
#endif

