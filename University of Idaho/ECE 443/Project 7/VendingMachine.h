#ifndef __VENDINGMACHINE_H
	#define __VENDINGMACHINE_H

	#include "TCPIP Stack/TCPIP.h"

	// Application Specific Global Variables
	#define MAX_PRODUCTS		7u

	typedef struct {
		BYTE name[11];
		BYTE stock;
		BYTE price;
	//  BYTE refill;
	} VEND_ITEM;

	void VendSetLights(BOOL setOn);

	#define BAUD_RATE       (19200)		// bps

	extern APP_CONFIG AppConfig;
	#define SaveAppConfig(a)

	void WriteLCDMenu(void);		// Referred to in CustomHTTPApp.c

// Define a header structure for validating the AppConfig data structure in EEPROM/Flash
	typedef struct {
		unsigned short wConfigurationLength;	// Number of bytes saved in EEPROM/Flash (sizeof(APP_CONFIG))
		unsigned short wOriginalChecksum;		// Checksum of the original AppConfig defaults as loaded from ROM (to detect when to wipe the EEPROM/Flash record of AppConfig due to a stack change, such as when switching from Ethernet to Wi-Fi)
		unsigned short wCurrentChecksum;		// Checksum of the current EEPROM/Flash data.  This protects against using corrupt values if power failure occurs while writing them and helps detect coding errors in which some other task writes to the EEPROM in the AppConfig area.
	} NVM_VALIDATION_STRUCT;


	// An actual function defined in VendMaching.c for displaying the current IP 
	// address on the UART and/or LCD.
	void DisplayIPValue(IP_ADDR IPVal);
    
    // Set the current credit value
    void vend_set_credits(unsigned int credit_value);
    unsigned int vend_get_credits(void);
#endif
