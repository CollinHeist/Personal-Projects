/** 
 *	@file 	main.c
 *	@brief 	Main program file, implements utilizing the DMA to transfer values from the
 *			ADC to the globally defined variable. This is quantized and then sent
 *			(as a string) over TCP.
 *	@author	Collin Heist
 **/

// File Inclusion
#include <plib.h>
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "main.h"
#include "DMA.h"
#include "ADC.h"
#include "chipKIT_Pro_MX7.h"
#include "FreeRTOS.h"
#include "FreeRTOS_IP_Private.h"

// TCP Stack global variables
/* The MAC address array is not declared const as the MAC address will
normally be read from an EEPROM and not hard coded (in real deployed
applications). In this case the MAC Address is hard coded to the value we
have for the Cerebot board we're using. */
static uint8_t ucMACAddress[6] = {0x00, 0x04, 0xA3, 0x17, 0xCB, 0xF8};

/* Set this value to be the IP address you want to use (you are recommended 
 * to use the value given with your Cerebot station but the value doesn't seem
 * to be strictly limited to that).*/
static const uint8_t ucIPAddress[4] = sourceAddress;

/* You shouldn't need to worry about these values as we're using DHCP. */
static const uint8_t ucNetMask[4] = {255, 255, 252, 0};
static const uint8_t ucGatewayAddress[4] = {129, 101, 220, 1};
/* The following is the address of an OpenDNS server. */
static const uint8_t ucDNSServerAddress[4] = {0, 0, 0, 0};

// Normal Global Variables
Socket_t xConnectedSocket; // Global socket used for communication
unsigned int ADC_results[ADC_SAMPLE_COUNT];
unsigned char quantized_ADC_results[ADC_SAMPLE_COUNT + 3]; // Room for "\n\r\0"

/* ------------------------------ Main Program ------------------------------ */

/**	
 *	@brief	Main function. Calls the setup functions and initializes the quantized results string.
 *	@param	None.
 *	@return	int (0) if any initialization failed.
 **/
int main(void) {
	unsigned int error_flag = NO_ERROR;
	// Initialize the 'hardware' and peripherals
	error_flag |= initialize_system();
	
	// Create the required tasks and IP stack
	error_flag |= create_tasks();
	
	// Initialize the Quantized results for better 'string' formatting - end in "\n\r\0"
	quantized_ADC_results[ADC_SAMPLE_COUNT + 3 - 1] = '\0';
	quantized_ADC_results[ADC_SAMPLE_COUNT + 3 - 2] = '\r';
	quantized_ADC_results[ADC_SAMPLE_COUNT + 3 - 3] = '\n';
	
	if (error_flag == ERROR)
		return 0; // An error occurred
	
	// Start the RTOS Scheduler
	vTaskStartScheduler();

	while (1) {}
	return 0;
}

/* ------------------------ Initialization Functions ------------------------ */
/**	
 *	@brief	Initialize the hardware resources required for this project.
 *	@param	None.
 *	@return	unsigned int that is the the error flag of all hardware initializations.
 **/
static unsigned int initialize_system(void) {
	unsigned int error_flag = NO_ERROR;
	// Initialize hardware
	chipKIT_PRO_MX7_Setup();
	
	// Setup board LED's
	PORTSetPinsDigitalOut(IOPORT_B, SM_LEDS);
	LATBCLR = SM_LEDS;
	
	// Enable chipKIT Pro MX7 and Cerebot 32MX7ck PHY - essential for using PHY chip
	TRISACLR = (unsigned int) BIT_6; // Make bit output
	LATASET = (unsigned int) BIT_6;	 // Set output high
	
	// Initialize the ADC and the associated Timer (3)
	error_flag |= initialize_ADC(1.0); // Initialize to 10Hz ADC operation
	
	// Initialize the DMA to constantly move data between the ADC buffer and my own array
	error_flag |= initialize_DMA((void*) &ADC1BUF0, (void*) ADC_results, DMA_SOURCE_SIZE_BYTES, ADC_SAMPLE_COUNT_BYTES, DMA_DEST_SIZE_BYTES);
	
	// Enable Multi-vector Interrupts
	INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);
	INTEnableInterrupts();
	portDISABLE_INTERRUPTS();
	
	return error_flag;
}

/**	
 *	@brief	Create all the FreeRTOS objects for this project.
 *	@param	None.
 *	@return	unsigned int that indicates whether or not the tasks were created successfully.
 **/
static unsigned int create_tasks(void) {
	BaseType_t task_success;
	/* Initialize the RTOS's TCP/IP stack. This initializes the MAC and kicks off
	 * the network management task "prvIPTask" which will be managing our network
	 * events */
	FreeRTOS_IPInit(ucIPAddress, ucNetMask, ucGatewayAddress, ucDNSServerAddress, ucMACAddress );
	
	// Create FreeRTOS Tasks
	task_success |= xTaskCreate(vCreateTCPServerSocket, "TCP1", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	task_success |= xTaskCreate(task_process_ADC_buffer, "Quantize Buffer", configMINIMAL_STACK_SIZE, NULL, 0, NULL);
	task_success |= xTaskCreate(task_log_ADC, "ADC Logger", configMINIMAL_STACK_SIZE, NULL, 2, NULL);
	
	if (task_success != pdPASS)
		return ERROR;
	
	return NO_ERROR;
}

/* --------------------------------- Tasks ---------------------------------- */

/**	
 *	@brief		FreeRTOS task that converts the ADC_results buffer to the converted
 *				quantized version.
 *	@param[in]	task_params: Void Pointer that contains the parameters for this task - not used.
 *	@return		None.
 **/
static void task_quantize_ADC_buffer(void* task_params) {
	unsigned int i = 0;
	for (;;) {
		// Quantize the buffer
		for (i = 0; i < ADC_SAMPLE_COUNT; i++)
			quantized_ADC_results[i] = (unsigned char) INT_TO_ASCII(QUANTIZE(ADC_results[i]));
		taskYIELD();
	}
}

/**	
 *	@brief		FreeRTOS task that sends the quantized ADC results over TCP. This is sent every 500 MS.
 *	@param[in]	task_params: Void Pointer that contains the parameters for this task - not used.
 *	@return		None.
 **/
static void task_log_ADC(void* task_params) {
	unsigned int packets_sent = 0;
	for (;;) {
		while (packets_sent < ADC_SAMPLE_COUNT + 3)
			packets_sent += (unsigned int) FreeRTOS_send(xConnectedSocket, &quantized_ADC_results[packets_sent], ADC_SAMPLE_COUNT - packets_sent + 3, 0);
		packets_sent = 0;	// Reset the packet count
		
		vTaskDelay(500);
	}

}

/* --------------------------- 'Helper' Functions --------------------------- */

/* 
 * DESCRIPTION:		Waits for an incoming request for a TCP socket connection 
 *					to be made. The function then, launches a new task for 
 *					managing the connection and deletes itself.
 * PARAMETER 1:		void pointer - data of unspecified data type sent from RTOS scheduler.
 * RETURN VALUE:	None (There is no returning from this function)
 * NOTES:			This function is a slightly altered form of the one used in the FreeRTOS
 * 					+ TCP tutorial on creating TCP sockets which can be found at the
 * 					following url: https://www.freertos.org/FreeRTOS-Plus/FreeRTOS_Plus_TCP/TCP_Networking_Tutorial_TCP_Client_and_Server.html   
 */
static void vCreateTCPServerSocket(void *pvParameters) {
	struct freertos_sockaddr xClient, xBindAddress;
	Socket_t xListeningSocket, xConnectedSocket;
	socklen_t xSize = sizeof(xClient);
	static const TickType_t xReceiveTimeOut = portMAX_DELAY;
	const BaseType_t xBacklog = 20;

	/* Attempt to open the socket. */
	xListeningSocket = FreeRTOS_socket( FREERTOS_AF_INET,
					FREERTOS_SOCK_STREAM,/* FREERTOS_SOCK_STREAM for TCP. */
					FREERTOS_IPPROTO_TCP );

	// Check the socket was created
	configASSERT( xListeningSocket != FREERTOS_INVALID_SOCKET );

	// Set a time out so accept() will just wait for a connection
	FreeRTOS_setsockopt(xListeningSocket, 0, FREERTOS_SO_RCVTIMEO, &xReceiveTimeOut, sizeof(xReceiveTimeOut));

	// Set the listening port
	xBindAddress.sin_port = (uint16_t) listeningPort;
	xBindAddress.sin_port = FreeRTOS_htons(xBindAddress.sin_port);

	// Bind the socket to the port that the client RTOS task will send to
	FreeRTOS_bind(xListeningSocket, &xBindAddress, sizeof(xBindAddress));

	/* Set the socket into a listening state so it can accept connections.
	The maximum number of simultaneous connections is limited to 20. */
	FreeRTOS_listen( xListeningSocket, xBacklog );

	for (;;) {
		/* Wait for incoming connections. */
		xConnectedSocket = FreeRTOS_accept( xListeningSocket, &xClient, &xSize );
		configASSERT( xConnectedSocket != FREERTOS_INVALID_SOCKET );

		/* Spawn a RTOS task to handle the connection. */
		xTaskCreate( prvServerConnectionInstance,
					 "EchoServer",
					 2048, /* I've increased the memory allocated to the task as I was encountering stack overflow issues */
					 ( void * ) xConnectedSocket,
					 tskIDLE_PRIORITY,
					 NULL );
		vTaskDelete( NULL );
	}
}


/* prvServerConnectionInstance Function Description *************************
 * SYNTAX:		  static void prvServerConnectionInstance( void *pvParameters );
 * KEYWORDS:		RTOS, Task
 * DESCRIPTION:	 Waits for incoming TCP packets from the given socket, stores
 *				  the input, and then echos it back.
 * PARAMETER 1:	 void pointer - data of unspecified data type sent from
 *				  RTOS scheduler
 * RETURN VALUE:	None (There is no returning from this function)
 * NOTES:		   This function came from a project on GitHub from user
 *				  rjvo called "storage" from the master branch. 
 *				  This project can be found at the following url:
 *				  https://github.com/rjvo/storage/blob/master/ROjal_MQTT_temp/FreeRTOS_example/FreeRTOS-Plus/Demo/FreeRTOS_Plus_TCP_and_FAT_Windows_Simulator/DemoTasks/SimpleTCPEchoServer.c 
 * END DESCRIPTION ************************************************************/
static void prvServerConnectionInstance( void *pvParameters ) {
	int32_t lBytes, lSent, lTotalSent;
	uint8_t cReceivedString[ ipconfigTCP_MSS ];
	static const TickType_t xReceiveTimeOut = pdMS_TO_TICKS( 5000 );
	static const TickType_t xSendTimeOut = pdMS_TO_TICKS( 5000 );
	TickType_t xTimeOnShutdown;

	xConnectedSocket = ( Socket_t ) pvParameters;
	FreeRTOS_setsockopt( xConnectedSocket, 0, FREERTOS_SO_RCVTIMEO, &xReceiveTimeOut, sizeof( xReceiveTimeOut ) );
	FreeRTOS_setsockopt( xConnectedSocket, 0, FREERTOS_SO_SNDTIMEO, &xSendTimeOut, sizeof( xReceiveTimeOut ) );

	for(;;) {
		/* Zero out the receive array so there is NULL at the end of the string
		 * when it is printed out. */
		memset(cReceivedString, 0x00, sizeof( cReceivedString));

		/* Receive data on the socket. */
		lBytes = FreeRTOS_recv( xConnectedSocket, cReceivedString, sizeof( cReceivedString ), 0 );

		/* If data was received, echo it back. */
		if (lBytes >= 0) {
			lSent = 0;
			lTotalSent = 0;
			
			while((lSent >= 0) && (lTotalSent < lBytes)) {
				lSent = FreeRTOS_send( xConnectedSocket, &cReceivedString[lTotalSent], lBytes - lTotalSent, 0 );
				lTotalSent += lSent;
			}

			if (lSent < 0) {
				// Socket closed?
				break;
			}
		}
		else {
			// Socket closed?
			break;
		}
	}
	
	// Initiate a shutdown in case it has not already been initiated.
	FreeRTOS_shutdown(xConnectedSocket, FREERTOS_SHUT_RDWR);

	/* Wait for the shutdown to take effect, indicated by FreeRTOS_recv()
	 * returning an error. */
	xTimeOnShutdown = xTaskGetTickCount();
	do {
		if(FreeRTOS_recv(xConnectedSocket, cReceivedString, ipconfigTCP_MSS, 0) < 0) {
			break;
		}
	} while((xTaskGetTickCount() - xTimeOnShutdown) < tcpechoSHUTDOWN_DELAY);

	// Finished with the socket and the task
	FreeRTOS_closesocket(xConnectedSocket);
	vTaskDelete(NULL);
}

/* ulApplicationGetNextSequenceNumber Function Description *********************
 * SYNTAX:		  uint32_t ulApplicationGetNextSequenceNumber
 *											  ( uint32_t ulSourceAddress,
 *												uint16_t usSourcePort,
 *												uint32_t ulDestinationAddress,
 *												uint16_t usDestinationPort );
 * DESCRIPTION:	 Callback that provides the inputs necessary to generate a 
 *				  randomized TCP Initial Sequence Number per RFC 6528.  THIS 
 *				  IS ONLY A DUMMY IMPLEMENTATION THAT RETURNS A PSEUDO RANDOM 
 *				  NUMBER SO IS NOT INTENDED FOR USE IN PRODUCTION SYSTEMS.
 * PARAMETER 1:	 uint32_t - IP source address
 * PARAMETER 2:	 uint32_t - IP source address port
 * PARAMETER 3:	 uint32_t - IP destination address
 * PARAMETER 4:	 uint32_t - IP destination address port
 * RETURN VALUE:	A randomized TCP Initial Sequence Number.
 * NOTES:		   This function came from a project on GitHub from user
 *				  jjr-simiatec called "FreeRTOS-TCP-for-PIC32" using commit
 *				  11bee9b5f2a5a21b6311feca873286e4c7be3534 from the master
 *				  branch. This project can be found at the following url:
 *				  https://github.com/jjr-simiatec/FreeRTOS-TCP-for-PIC32/commit/11bee9b5f2a5a21b6311feca873286e4c7be3534
END DESCRIPTION ************************************************************/
extern uint32_t ulApplicationGetNextSequenceNumber(uint32_t ulSourceAddress, uint16_t usSourcePort, uint32_t ulDestinationAddress, uint16_t usDestinationPort) {
	( void ) ulSourceAddress;
	( void ) usSourcePort;
	( void ) ulDestinationAddress;
	( void ) usDestinationPort;

	return uxRand();
}

/* uxRand Function Description *********************************************
 * SYNTAX:		  UBaseType_t uxRand( void );
 * DESCRIPTION:	 Function called by the IP stack to generate random numbers for
 *				  things such as a DHCP transaction number or initial sequence number.
 * RETURN VALUE:	A pseudo random number.
 * NOTES:		   This function came from a project on GitHub from user
 *				  jjr-simiatec called "FreeRTOS-TCP-for-PIC32" using commit
 *				  11bee9b5f2a5a21b6311feca873286e4c7be3534 from the master
 *				  branch. This project can be found at the following url:
 *				  https://github.com/jjr-simiatec/FreeRTOS-TCP-for-PIC32/commit/11bee9b5f2a5a21b6311feca873286e4c7be3534
END DESCRIPTION ************************************************************/
UBaseType_t uxRand(void) {
	static UBaseType_t ulNextRand;
	const uint32_t ulMultiplier = 0x015a4e35UL, ulIncrement = 1UL;

	// Utility function to generate a pseudo random number
	ulNextRand = (ulMultiplier * ulNextRand) + ulIncrement;
	return((int) (ulNextRand >> 16UL) & 0x7fffUL);
}

/* _general_exception_handler Function Description *****************************
 * SYNTAX:		  void _general_exception_handler( unsigned long ulCause,
 *											  unsigned long ulStatus );
 * KEYWORDS:		Exception, handler
 * DESCRIPTION:	 This overrides the definition provided by the kernel.
 *				  Other exceptions should be handled here. Set a breakpoint
 *				  on the "for( ;; )" to catch problems.
 * PARAMETER 1:	 unsigned long - Cause of exception code
 * PARAMETER 2:	 unsigned long - status of process
 * RETURN VALUE:	None
 * NOTES:		   Program will be vectored to here if the any CPU error is
 *				  generated. See FreeRTOS documentation for error codes.
END DESCRIPTION ***************************************************************/
void _general_exception_handler(unsigned long ulCause, unsigned long ulStatus) {
	for( ;; );
}

/* vApplicationStackOver Function Description **********************************
 * SYNTAX:		  void vApplicationStackOverflowHook( void );
 * KEYWORDS:		Stack, overflow
 * DESCRIPTION:	 Look at pxCurrentTCB to see which task overflowed
 *				  its stack.
 * PARAMETERS:	  None
 * RETURN VALUE:	None
 * NOTES:		   See FreeRTOS documentation
 * END DESCRIPTION ************************************************************/
void vApplicationStackOverflowHook(void) {
	for( ;; );
}