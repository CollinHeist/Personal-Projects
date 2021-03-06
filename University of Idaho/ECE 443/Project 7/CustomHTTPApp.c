#define __CUSTOMHTTPAPP_C

#include "TCPIPConfig.h"
#include <stdlib.h>
#include <string.h>

#if defined(STACK_USE_HTTP2_SERVER)

#include "TCPIP Stack/TCPIP.h"

extern HTTP_CONN curHTTP;
extern HTTP_STUB httpStubs[MAX_HTTP_CONNECTIONS];
extern BYTE curHTTPID;

// Vending Machine Application Global Variables
#include "VendingMachine.h"
// #include "MainDemo.h"
extern VEND_ITEM Products[MAX_PRODUCTS];	// All Products in the machine
extern BYTE machineDesc[33];				// Machine description string

#ifndef SaveAppConfig
	#if defined(EEPROM_CS_TRIS) || defined(SPIFLASH_CS_TRIS)
		void SaveAppConfig(const APP_CONFIG *AppConfig);
	#else
		#define SaveAppConfig(a)
	#endif
#endif

/*****************************************************************************
Function: BYTE HTTPNeedsAuth(BYTE* cFile)

Internal: See documentation in the TCP/IP Stack API or HTTP2.h for details.
  ***************************************************************************/
#if defined(HTTP_USE_AUTHENTICATION)
	BYTE HTTPNeedsAuth(BYTE* cFile) {
	// No authentication is defined yet.
		return 0x80;
	}
#endif

/*****************************************************************************
Function:   BYTE HTTPCheckAuth(BYTE* cUser, BYTE* cPass)
	
Internal:   See documentation in the TCP/IP Stack API or HTTP2.h for details.
  ***************************************************************************/
#if defined(HTTP_USE_AUTHENTICATION)
	BYTE HTTPCheckAuth(BYTE* cUser, BYTE* cPass) {
	// No authentication is defined yet.
		
		return 0x80;
	}
#endif

/*********************************************************************
 * Function:		HTTP_IO_RESULT HTTPExecuteGet(void)
 * PreCondition:	curHTTP is loaded
 * Input:		   None
 * Output:		  HTTP_IO_DONE on success
 *				  HTTP_IO_WAITING if waiting for asynchronous process
 * Side Effects:	None
 * Overview:		This function is called if data was read from the
 *				  HTTP request from either the GET arguments, or
 *				  any cookies sent.  curHTTP.data contains
 *				  sequential pairs of strings representing the
 *				  data received.  Any required authentication has
 *				  already been validated.
 * Note:			Custom implementation for WebVend Application
 ********************************************************************/
HTTP_IO_RESULT HTTPExecuteGet(void) {
	BYTE *ptr, name[20], args[20];

	// Load the file name
	MPFSGetFilename(curHTTP.file, name, 20);
	// Mage sure it is the lights.htm page
	if(strcmppgm2ram((char *) name, ( char*) "lights.htm") == 0) {
		// Find the new light state value
		ptr = HTTPGetROMArg(curHTTP.data, (BYTE *) "lights");
		strcpy((char *) args,(char *) ptr);
		if (ptr) 	// Make sure pointer is not NULL
		{
			if(strcmppgm2ram((char*) ptr, (char*) "on") == 0)
				VendSetLights(TRUE);
			else
				VendSetLights(FALSE);
		}
        ptr = HTTPGetROMArg(curHTTP.data, (BYTE*)"credits");
        strcpy((char*) args, (char*)ptr);
        if (ptr) {
            unsigned int temp_credits = *ptr++ - '0';
            while (*ptr >= '0' && *ptr <= '9')
                temp_credits = (temp_credits * 10) + (*ptr++ - '0');
            vend_set_credits(temp_credits);
        }
	}

	return HTTP_IO_DONE;
}
#if defined(HTTP_USE_POST)

/*********************************************************************
 * Function:		HTTP_IO_RESULT HTTPExecutePost(void)
 * PreCondition:	curHTTP is loaded
 * Input:		   None
 * Output:		  HTTP_IO_DONE on success
 *				  HTTP_IO_NEED_DATA if more data is requested
 *				  HTTP_IO_WAITING if waiting for asynchronous process
 * Side Effects:	None
 * Overview:		This function is called if the request method was
 *				  POST.  It is called after HTTPExecuteGet and
 *				  after any required authentication has been validated.
 * Note:			Custom implementation for WebVend Application
 ********************************************************************/
HTTP_IO_RESULT HTTPExecutePost(void) {
	BYTE name[20], item, *ptr;
	WORD len;
	
	// Load the file name
	// Make sure BYTE filename[] above is large enough for your longest name
	MPFSGetFilename(curHTTP.file, name, 20);
	
	// Make sure it's the products.htm page
	if(strcmppgm2ram((char*)name, (ROM char*)"products.htm") != 0)
		return HTTP_IO_DONE;
		
	// Loop while data remains
	while (curHTTP.byteCount) {
		// Check for a complete variable
		len = TCPFind(sktHTTP, '&', 0, FALSE);
		if (len == 0xffff) { // Check if this is the last one
			if (TCPIsGetReady(sktHTTP) == curHTTP.byteCount)
				len = curHTTP.byteCount - 1;
			else // Wait for more data
				return HTTP_IO_NEED_DATA;
		}
// Make sure we don't overflow
		if (len > HTTP_MAX_DATA_LEN - 2) {
			curHTTP.byteCount -= TCPGetArray(sktHTTP, NULL, len+1);
			continue;
		}

// Read the next variable and parse
		len = TCPGetArray(sktHTTP, curHTTP.data, len+1);
		curHTTP.data[len] = '\0';
		HTTPURLDecode(curHTTP.data);
		curHTTP.byteCount -= len;
		
// Figure out which variable it is
		if (memcmppgm2ram(curHTTP.data, (void*)"name", 4) == 0) {
			// A name was found
			item = curHTTP.data[5] - '0';
			if (item > MAX_PRODUCTS)
				continue;
			memcpy((void*)Products[item].name, (void*)&curHTTP.data[8], 10);
		}
		else if (memcmppgm2ram(curHTTP.data, (void*)"price", 5) == 0) {
			// A price was found
			item = curHTTP.data[6] - '0';
			if(item > MAX_PRODUCTS)
				continue;
			ptr = curHTTP.data + 9;

			// Skip the $ if entered
			if(*ptr == '$')
				ptr++;

			// Read the dollars value
			Products[item].price = (*ptr++ - '0') * 4;
			
			// Read in the cents value
			if(strcmppgm2ram((char*)ptr, (ROM char*)".87") > 0)
				Products[item].price += 4;
			else if(strcmppgm2ram((char*)ptr, (ROM char*)".62") > 0)
				Products[item].price += 3;
				else if(strcmppgm2ram((char*)ptr, (ROM char*)".37") > 0)
					Products[item].price += 2;
					else if(strcmppgm2ram((char*)ptr, (ROM char*)".12") > 0)
						Products[item].price += 1;
			
			// Make sure price isn't over the max
			if(Products[item].price > 20)
				Products[item].price = 20;
		}
		else if (memcmppgm2ram(curHTTP.data, (void*) "stock", 5) == 0) {
			// A Stock entry was found
			item = curHTTP.data[6] - '0';	// Grab the product number
			if (item > MAX_PRODUCTS)
				continue;

			ptr = curHTTP.data + 9;	// Skip of the "stock[x]=" part of the message

			// Get the parsed stock
			unsigned int temp_stock = *ptr++ - '0';
			while (*ptr >= '0' && *ptr <= '9')
				temp_stock = (temp_stock * 10) + (*ptr++ - '0');
			
			Products[item].stock = temp_stock;	// Assign the stock part of this product
		}
	}

	// Update the LCD and AppConfig
	WriteLCDMenu();
	SaveAppConfig(&AppConfig);

	return HTTP_IO_DONE;
}

#endif //(use_post)

/*********************************************************************
 * Function:		void HTTPPrint_varname(TCP_SOCKET sktHTTP, 
 *
 * PreCondition:	None
 * Input:		   sktHTTP: the TCP socket to which to write
 *				  callbackPos: 0 initially
 *				  return value of last call for subsequent callbacks
 *				  data: this connection's data buffer
 * Output:		  0 if output is complete
 *				  application-defined otherwise
 * Side Effects:	None
 * Overview:		Outputs a variable to the HTTP client.
 * Note:			Return zero to indicate that this callback function 
 *				  has finished writing data to the TCP socket.  A
 *				  non-zero return value indicates that more data
 *				  remains to be written, and this callback should
 *				  be called again when more space is available in
 *				  the TCP TX FIFO.  This non-zero return value will
 *				  be the value of the parameter callbackPos for the
 *				  next call.
 ********************************************************************/

void HTTPPrint_version(void) {
	TCPPutROMString(sktHTTP,(ROM void*)TCPIP_STACK_VERSION);
	return;
}
/********************************************************************/
void HTTPPrint_builddate(void) {
	TCPPutROMString(sktHTTP,(ROM void*)__DATE__" "__TIME__);
	return;
}

/********************************************************************/
void HTTPPrint_machineDesc(void) {
	if (strlen((char*)machineDesc) > TCPIsPutReady(sktHTTP))
	{
// Insufficient space
		curHTTP.callbackPos = 0x01;
	return;
	}
	TCPPutString(sktHTTP, machineDesc);
	curHTTP.callbackPos = 0x00;
}

/********************************************************************/
void HTTPPrint_hostname(void) {
	TCPPutString(sktHTTP, AppConfig.NetBIOSName);
	return;
}

/********************************************************************/
void HTTPPrint_name(WORD item) {
	TCPPutString(sktHTTP, Products[item].name);
}

/********************************************************************/
void HTTPPrint_stock(WORD item)
{
	BYTE digits[4];

	sprintf((char *) digits,"%d",Products[item].stock);
//uintoa(Products[item].stock, digits);
	TCPPutString(sktHTTP, digits);
}

/********************************************************************/
void HTTPPrint_status(WORD item) {
	if (Products[item].stock < 10)
		TCPPutString(sktHTTP, (BYTE *) "low");
	else
		TCPPutString(sktHTTP, (BYTE *) "ok");
}

void HTTPPrint_lights_chk(WORD on) {
	if (LED1_IO == on)
		TCPPutROMString(sktHTTP, (ROM BYTE*)"checked");
}

void HTTPPrint_price(WORD item) {
	TCPPut(sktHTTP, '$');
	TCPPut(sktHTTP, (Products[item].price >> 2) + '0');
	switch(Products[item].price & 0x03) {
		case 0:
			TCPPutROMString(sktHTTP, (ROM BYTE*)".00");
			break;
		case 1:
			TCPPutROMString(sktHTTP, (ROM BYTE*)".25");
			break;
		case 2:
			TCPPutROMString(sktHTTP, (ROM BYTE*)".50");
			break;
		case 3:
			TCPPutROMString(sktHTTP, (ROM BYTE*)".75");
			break;
	}
}

void HTTPPrint_credits(void) {
    char credits[5] = {'\0'};
    sprintf(credits, "%d", vend_get_credits());   
    TCPPutROMString(sktHTTP, (ROM BYTE*)credits);
}

#endif