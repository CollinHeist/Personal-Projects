/** 
 *	@file	CANFunctions.c
 *	@brief	CAN program file. Implements CAN1 and CAN2 according to project requirements.
 *	@author	Collin Heist
 *	@notes	For data-sizes, see: http://dubworks.blogspot.com/2013/08/pic32-variable-type-defs.html
 **/

// File Inclusion
#include <plib.h>
#include "GenericTypeDefs.h"
#include "chipKIT_Pro_MX7.h"
#include "CANFunctions.h"

// Global Variables
static volatile BOOL CAN1_received_flag = FALSE;	// Flag of if CAN1 received a message
static volatile BOOL CAN2_received_flag = FALSE;	// Flag of if CAN2 received a message
BYTE CAN1MessageFifoArea[CAN1_MSG_MEMORY];
BYTE CAN2MessageFifoArea[CAN2_MSG_MEMORY];

/**	
 *	@brief	Initialize the CAN1 module. Channel 0 is the TX buffer, Channel 1 is the 
 *			RX buffer. Channel 1 is configured for a filter for the CAN2 RTR.
 *	@param	None.
 *	@return	None.
 **/
void initialize_CAN1(void) {
	CAN_BIT_CONFIG canBitConfig;
	
	PORTSetPinsDigitalIn(IOPORT_F, BIT_12);	 // Set CAN1 Rx to input
	PORTSetPinsDigitalOut(IOPORT_F, BIT_13);	// Set CAN1 Tx  to output
	ODCFSET = BIT_13;// Make output pin open drain */
		
	// Step 1: Switch the CAN module ON and switch it to Configuration mode.
	CANEnableModule(CAN1, TRUE);
	CANSetOperatingMode(CAN1, CAN_CONFIGURATION);// Set CAN mode of operation
	while(CANGetOperatingMode(CAN1) != CAN_CONFIGURATION);// Wait for operation to finish
	
	/* Step 2: Configure the Clock. The CAN_BIT_CONFIG data structure is used 
	 * for this purpose. The propagation segment, phase segment 1 and phase
	 * segment 2 are configured to have 3TQ. */
	canBitConfig.phaseSeg2Tq			= CAN_BIT_3TQ;
	canBitConfig.phaseSeg1Tq			= CAN_BIT_3TQ;
	canBitConfig.propagationSegTq	   = CAN_BIT_3TQ;
	canBitConfig.phaseSeg2TimeSelect	= TRUE;
	canBitConfig.sample3Time			= TRUE;
	canBitConfig.syncJumpWidth		  = CAN_BIT_2TQ;
	CANSetSpeed(CAN1,&canBitConfig, SYSTEM_FREQ, CAN_BUS_SPEED);
	
	/* Step 3: Assign the buffer area to the CAN module. */
	CANAssignMemoryBuffer(CAN1, CAN1MessageFifoArea, CAN1_MSG_MEMORY);

	/* Step 4: Configure channel 0 for TX and size of 8 message buffers with RTR 
	 * disabled and low medium priority. Configure channel 1 for RX and size
	 * of 8 message buffers and receive the full message. There can be from 1 to
	 * 32 FIFO buffers each with up to 32 message buffers that are 16 bytes. Each
	 * FIFO, if it is a receive buffer, has an ID filter that specifies which
	 * message to accept. */
	CANConfigureChannelForTx(CAN1, CAN_CHANNEL0, CAN1_FIFO_BUFFERS, CAN_TX_RTR_DISABLED, CAN_LOW_MEDIUM_PRIORITY);
	CANConfigureChannelForRx(CAN1, CAN_CHANNEL1, CAN1_FIFO_BUFFERS, CAN_RX_FULL_RECEIVE);
	
	/* Step 5: Configure filters and mask. Configure filter 0 to accept SID
	 * messages with SID LED1_INDICATION_MSG. Configure Filter Mask is set to
	 * compare all the ID bits and to filter by the ID type specified in the filter
	 * configuration. Messages accepted by Filter 0 should be stored in Channel 1.
	 */
	CANConfigureFilter(CAN1, CAN_FILTER0, CAN2_RTR_MESSAGE_ID, CAN_SID);
	CANConfigureFilterMask(CAN1, CAN_FILTER_MASK0, SID_FILTER_MASK, CAN_SID, CAN_FILTER_MASK_IDE_TYPE);
	CANLinkFilterToChannel(CAN1, CAN_FILTER0, CAN_FILTER_MASK0, CAN_CHANNEL1);
	CANEnableFilter(CAN1, CAN_FILTER0, TRUE);
	
	/* Step 6: Enable interrupt and events. Enable the receive channel not empty
	 * event (channel event) and the receive channel event (module event).
	 * The interrupt peripheral library is used to enable the CAN interrupt to
	 * the CPU. */

	/* CAN Enable Channel Event parameter description:
	 * This routine enables or disables channel level events. Any enabled channel
	 * event will cause a CAN module event. An event can be active regardless of
	 * it being enabled or disabled. Enabling a TX type of event for a RX channel
	 * will have no effect.
	 * 
	 * Parameter 1:	 CAN Module:  CAN1 or CAN2
	 * Parameter 2:	 CAN FIFO Channel Number: CAN_CHANNEL0 to CAN_CHANNEL31
	 * Parameter 3:	 CAN Channel event type - any combination:   	
	 *					  CAN_RX_CHANNEL_NOT_EMPTY
	 *					  CAN_RX_CHANNEL_HALF_FULL
	 *					  CAN_RX_CHANNEL_FULL
	 *					  CAN_RX_CHANNEL_OVERFLOW
	 *					  CAN_RX_CHANNEL_ANY_EVENT
	 *					  CAN_TX_CHANNEL_EMPTY
	 *					  CAN_TX_CHANNEL_HALF_EMPTY
	 *					  CAN_TX_CHANNEL_NOT_FULL
	 *					  CAN_TX_CHANNEL_ANY_EVENT
	 *  Parameter 4:	Event enable - TRUE or FALSE */
	CANEnableChannelEvent(CAN1, CAN_CHANNEL1, CAN_TX_CHANNEL_ANY_EVENT | CAN_RX_CHANNEL_NOT_EMPTY, TRUE);

	/* CAN Enable Module Event parameter description:
	 * This routine enables or disables module level events. Any enabled module
	 * event will cause the CAN module to generate a CPU interrupt. An event can
	 * be active regardless of it being enabled or disabled.
	 *
	 * Parameter 1:	 CAN Module:  CAN1 or CAN2
	 * Parameter 2:	 CAN Event flags - any combination:
	 *					  CAN_TX_EVENT
	 *					  CAN_RX_EVENT
	 *					  CAN_TIMESTAMP_TIMER_OVERFLOW_EVENT
	 *					  CAN_OPERATION_MODE_CHANGE_EVENT
	 *					  CAN_RX_OVERFLOW_EVENT
	 *					  CAN_SYSTEM_ERROR_EVENT
	 *					  CAN_BUS_ERROR_EVENT
	 *					  CAN_BUS_ACTIVITY_WAKEUP_EVENT
	 *					  CAN_INVALID_RX_MESSAGE_EVENT
	 * Parameter 3:	 Enable CAN events: TRUE or FALSE */
	CANEnableModuleEvent(CAN1, CAN_TX_EVENT | CAN_RX_EVENT, TRUE);

	/* These functions are from interrupt peripheral library. */
	INTSetVectorPriority(INT_CAN_1_VECTOR, INT_PRIORITY_LEVEL_4);
	INTSetVectorSubPriority(INT_CAN_1_VECTOR, INT_SUB_PRIORITY_LEVEL_0);
	INTEnable(INT_CAN1, INT_ENABLED);
	
	/* Step 7: Switch the CAN mode to normal mode. */
	CANSetOperatingMode(CAN1, CAN_NORMAL_OPERATION);
	while(CANGetOperatingMode(CAN1) != CAN_NORMAL_OPERATION);
}

/**	
 *	@brief	Initialize the CAN2 module. Channel 0 is the TX buffer, Channel 1 is the 
 *			RX buffer. Channel 0 is configured for a filter for the CAN2 RTR. Channel 1
 *			is configured for a filter for the CAN1 PWM ID.
 *	@param	None.
 *	@return	None.
 **/
void initialize_CAN2(void) {
	CAN_BIT_CONFIG canBitConfig;

	PORTSetPinsDigitalIn(IOPORT_C, BIT_3);	// Set CAN2 Rx
	PORTSetPinsDigitalOut(IOPORT_C, BIT_2);	// Set CAN2 Tx
	ODCCSET = BIT_2;						// Set CAN Tx IO pin for open drain

	/* Step 1: Switch the CAN module ON and switch it to Configuration
	 * mode. Wait till the switch is complete */
	CANEnableModule(CAN2,TRUE);
	CANSetOperatingMode(CAN2, CAN_CONFIGURATION);
	while (CANGetOperatingMode(CAN2) != CAN_CONFIGURATION);

	/* Step 2: Configure the Clock. The CAN_BIT_CONFIG data structure is used
	 * for this purpose. The propagation,  phase segment 1 and phase segment 2
	 * are configured to have 3TQ. */
	canBitConfig.phaseSeg2Tq = CAN_BIT_3TQ;
	canBitConfig.phaseSeg1Tq = CAN_BIT_3TQ;
	canBitConfig.propagationSegTq = CAN_BIT_3TQ;
	canBitConfig.phaseSeg2TimeSelect = TRUE;
	canBitConfig.sample3Time = TRUE;
	canBitConfig.syncJumpWidth = CAN_BIT_2TQ;
	CANSetSpeed(CAN2, &canBitConfig, GetSystemClock(), CAN_BUS_SPEED);

	// Step 3: Assign the buffer area to the CAN module.
	CANAssignMemoryBuffer(CAN2, CAN2MessageFifoArea, CAN2_MSG_MEMORY);

	/* Step 4: Configure channel 0 for TX, RX and size of 8 message buffers with RTR
	 * enable and low medium priority. */
	CANConfigureChannelForTx(CAN2, CAN_CHANNEL0, CAN2_FIFO_BUFFERS, CAN_TX_RTR_ENABLED, CAN_LOW_MEDIUM_PRIORITY);
	CANConfigureChannelForRx(CAN2, CAN_CHANNEL1, CAN2_FIFO_BUFFERS, CAN_RX_FULL_RECEIVE);

	/* Step 5: Configure filters and mask. */
	// Set up filter for the TX channel that responds to RTR messages
	CANConfigureFilter(CAN2, CAN_FILTER0, CAN2_RTR_MESSAGE_ID, CAN_SID);
	CANConfigureFilterMask(CAN2, CAN_FILTER_MASK0, SID_FILTER_MASK, CAN_SID, CAN_FILTER_MASK_IDE_TYPE);
	CANLinkFilterToChannel(CAN2, CAN_FILTER0, CAN_FILTER_MASK0, CAN_CHANNEL0);
	CANEnableFilter(CAN2, CAN_FILTER0, TRUE);

	// Set up filter for the RX channel that only accepts CAN1_PWM_MESSAGE_ID messages
	CANConfigureFilter(CAN2, CAN_FILTER1, CAN1_PWM_MESSAGE_ID , CAN_SID);
	CANConfigureFilterMask(CAN2, CAN_FILTER_MASK0, SID_FILTER_MASK, CAN_SID, CAN_FILTER_MASK_IDE_TYPE);
	CANLinkFilterToChannel(CAN2, CAN_FILTER1, CAN_FILTER_MASK0, CAN_CHANNEL1);
	CANEnableFilter(CAN2, CAN_FILTER1, TRUE);

	/* Step 6: Enable interrupt and events.  */
	CANEnableChannelEvent(CAN2, CAN_CHANNEL1, CAN_RX_CHANNEL_NOT_EMPTY, TRUE);
	CANEnableModuleEvent(CAN2, CAN_RX_EVENT, TRUE);
	/* These functions are from interrupt peripheral library. */
	INTSetVectorPriority(INT_CAN_2_VECTOR, INT_PRIORITY_LEVEL_4);
	INTSetVectorSubPriority(INT_CAN_2_VECTOR, INT_SUB_PRIORITY_LEVEL_0);
	INTEnable(INT_CAN2, INT_ENABLED);

	/* Step 7: Switch the CAN mode to normal mode. */
	CANSetOperatingMode(CAN2, CAN_NORMAL_OPERATION);
	while (CANGetOperatingMode(CAN2) != CAN_NORMAL_OPERATION);
}

/**	
 *	@brief		Processes the receive channel for CAN1. This channel receives the RTR messages
 *				from CAN2.
 *	@param[out]	temperature: Floating point temperature as parsed from the RTR message from CAN2.
 *	@param[out]	motor_speed: Floating point motor speed as parsed from the RTR message from CAN2.
 *	@param[out]	pwm_setting: Floatign point pwm setting as parsed from the RTR message from CAN2.
 *	@return		unsigned integer that is either CAN_NO_MESSAGE_RECEIVED or CAN_MESSGE_RECEIVED
 *				and indicates whether or not CAN1's RX channel had values in it.
 **/
unsigned int CAN1_process_RX(float* temperature, float* motor_speed, float* pwm_setting) {
	CANRxMessageBuffer* message;	// Pointer to the message read from the RX Channel
	CANRxMessageBuffer* next;	   // Pointer to the next message from the RX Channel
	short temperature_scaled10 = 0;	// 10x scaled value of the read temperature
	short motor_speed_scaled10 = 0;	// 10x scaled value of the read motor speed
	short motor_speed_100th	= 0;	// 1/100th place of the motor speed
	short pwm_setting_scaled10 = 0;	// 10x scaled value of the read pwm setting

	// There was no message received on CAN1 - exit
	if (CAN1_received_flag == FALSE)
		return CAN_NO_MESSAGE_RECEIVED;

	// There was a message received - reset the flag and parse the message
	CAN1_received_flag = FALSE;	// Reset the flag
	message = (CANRxMessageBuffer*) CANGetRxMessage(CAN1, CAN_CHANNEL1);

	// Parse the message byte-by-byte into each variable
	// The data is sent as the value (times 10) to represent the decimal
	temperature_scaled10 = message -> data[0] + (message -> data[1] << 8);
	motor_speed_scaled10 = message -> data[2] + (message -> data[3] << 8);
	motor_speed_100th = message -> data[4] + (message -> data[5] << 8);
	pwm_setting_scaled10 = message -> data[6] + (message -> data[7] << 8);

	// Scale the readings down (their 10x value is sent to preserve 1 decimal place)
	// The motor speed has the 100th place sent specifically, so that needs to be added in
	*temperature = (float) temperature_scaled10 / 10.0;	
	*motor_speed = ((float) motor_speed_scaled10) / 10.0 + ((float) motor_speed_100th) / 100.0;
	*pwm_setting = (float) pwm_setting_scaled10 / 10.0;

	// Let the CAN module know message processing is done - enable the event
	CANUpdateChannel(CAN1, CAN_CHANNEL1);
	CANEnableChannelEvent(CAN1, CAN_CHANNEL1, CAN_RX_CHANNEL_NOT_EMPTY, TRUE);

	return CAN_MESSAGE_RECEIVED;
}

/**	
 *	@brief		Process the receive channel for CAN2. This channel gets data messages from CAN1
 *				that correspond to the desired PWM setting.
 *	@param[out]	desired_out_setting: The requested PWM setting as sent by CAN1 to CAN2.
 *	@return		unsigned integer that is either CAN_NO_MESSAGE_RECEIVED or CAN_MESSGE_RECEIVED
 *				and indicates whether or not CAN2's RX channel had values in it.
 **/
unsigned int CAN2_process_RX(float* desired_pwm_setting) {
	CANRxMessageBuffer* message;	// Pointer to the message read from the RX Channel
	short pwm_setting_scaled10 = 0;	// 10x scaled value of the read pwm setting

	// There was no message received on CAN1 - exit
	if (CAN2_received_flag == FALSE)
		return CAN_NO_MESSAGE_RECEIVED;

	// There was a message received - reset the flag and parse the message
	CAN2_received_flag = FALSE;	// Reset the flag
	message = (CANRxMessageBuffer*) CANGetRxMessage(CAN2, CAN_CHANNEL1);

	// Parse the message
	pwm_setting_scaled10 = message -> data[0];			// Read BYTE0 of the data (two bytes)
	pwm_setting_scaled10 += (message -> data[1]) << 8;	// Read BYTE1 of the data

	// Scale the reading down (its 10x value is sent to preserve 1 decimal place)
	*desired_pwm_setting = ((float) pwm_setting_scaled10) / 10.0;

	// Let the CAN module know message processing is done - enable the event
	CANUpdateChannel(CAN2, CAN_CHANNEL1);
	CANEnableChannelEvent(CAN2, CAN_CHANNEL1, CAN_RX_CHANNEL_NOT_EMPTY, TRUE);

	return CAN_MESSAGE_RECEIVED;
}

/**	
 *	@brief		Send the passed desired PWM setting over the TX channel of CAN1.
 *	@param[in]	desired_out_setting: The desired PWM setting to send to CAN2.
 *	@return		None.
 **/
void CAN1_send_TX(float desired_pwm_setting) {
	CANTxMessageBuffer* message;

	// Get a pointer to the next buffer in the channel - make sure it's not NUL
	message = CANGetTxMessageBuffer(CAN1, CAN_CHANNEL0);
	if (message != NULL) {
		// The message buffer exists, create the message
		// Clear the message buffer
		message -> messageWord[0] = 0;
		message -> messageWord[1] = 0;
		message -> messageWord[2] = 0;
		message -> messageWord[3] = 0;

		// Create the message itself
		message -> msgSID.SID = (WORD) (CAN1_PWM_MESSAGE_ID & SID_BIT_MASK);
		message -> msgEID.IDE = 0;	// Standard ID 
		message -> msgEID.RTR = 0;	// Not an RTR 
		message -> msgEID.DLC = 2;	// Sending 2 bytes (one WORD)
		message -> data[0] = (short) (desired_pwm_setting * 10) & BYTE_0_MASK;
		message -> data[1] = ((short) (desired_pwm_setting * 10) & BYTE_1_MASK) >> 8;

		// Tell CAN module we're done with message processing
		CANUpdateChannel(CAN1, CAN_CHANNEL0);

		// Flush the TX Channel - send any pending messages
		CANFlushTxChannel(CAN1, CAN_CHANNEL0);
	}
}

/**	
 *	@brief	Function to send an RTR request from CAN1 to CAN2.
 *	@param	None.
 *	@return	None.
 **/
void CAN1_send_RTR(void) {
	CANTxMessageBuffer* message;

	// Get a pointer to the next buffer in the channel - make sure it's not NULL
	message = CANGetTxMessageBuffer(CAN1, CAN_CHANNEL0);
	if (message != NULL) {
		// Form a standard ID RTR CAN message
		// Clear the message buffer
		message -> messageWord[0] = 0;
		message -> messageWord[1] = 0;
		message -> messageWord[2] = 0;
		message -> messageWord[3] = 0;

		// Create the RTR Message
		message -> msgSID.SID = (WORD) (CAN2_RTR_MESSAGE_ID & SID_BIT_MASK);	// We are requesting the CAN2 ID
		message -> msgEID.IDE = 0;	// Standard ID
		message -> msgEID.RTR = 1;	// This is an RTR
		message -> msgEID.DLC = 0;	// No data is sent with an RTR

		// Tell CAN module we're done with the message processing
		CANUpdateChannel(CAN1, CAN_CHANNEL0);

		// Flush the TX Channel - send any pending messages
		CANFlushTxChannel(CAN1, CAN_CHANNEL0);
	}
}

/**	
 *	@brief		Refill the RTR buffer for CAN2 with the passed temperature, motor speed, and current PWM setting.
 *	@param[in]	temperature: The current temperature as read by the IR sensor.
 *	@param[in]	motor_speed: The current motor speed, as read by the input capture event.
 *	@param[in]	pwm_setting: The current PWM setting for the motor - determined by the low / high set points.
 *	@return		None.
 **/
void CAN2_refill_RTR_buffer(float temperature, float motor_speed, float pwm_setting) {
	CANTxMessageBuffer* message;

	// The CAN_TX_CHANNEL_EMPTY flag is set when any FIFO has a message that's not sent
	// If that flag is NOT set, no RTR has been responded to yet
	if ((CANGetChannelEvent(CAN2, CAN_CHANNEL0) & CAN_TX_CHANNEL_EMPTY) == 0)
		return;

	// An RTR was responded to, emptying the FIFO
	// Get the pointer to the next buffer in the channel
	message = CANGetTxMessageBuffer(CAN2, CAN_CHANNEL0);

	// Form the CAN message
	// Clear the message buffer, to start
	message -> messageWord[0] = 0;
	message -> messageWord[1] = 0;
	message -> messageWord[2] = 0;
	message -> messageWord[3] = 0;

	// Generate the message itself
	message -> msgSID.SID = (WORD) (CAN2_RTR_MESSAGE_ID & SID_BIT_MASK);
	message -> msgEID.IDE = 0;	// Not an extended ID message
	message -> msgEID.DLC = 8;	// We're sending 8 bytes of data (two BYTES or one WORD per variable)
	message -> msgEID.RTR = 0;	// This is NOT an RTR request even though it is an RTR response
	message -> data[0] = (short)(temperature * 10) & BYTE_0_MASK;	
	message -> data[1] = ((short)(temperature * 10) & BYTE_1_MASK) >> 8;
	message -> data[2] = (short)(motor_speed * 10) & BYTE_0_MASK;
	message -> data[3] = ((short)(motor_speed * 10) & BYTE_1_MASK) >> 8;
	message -> data[4] = (short) (motor_speed * 100 - ((short) (motor_speed * 10)) * 10) & BYTE_0_MASK;
	message -> data[5] = ((short) (motor_speed * 100 - ((short) (motor_speed * 10)) * 10) & BYTE_1_MASK) >> 8;
	message -> data[6] = (short) (pwm_setting * 10) & BYTE_0_MASK;
	message -> data[7] = ((short) (pwm_setting * 10) & BYTE_1_MASK) >> 8;

	// Let the CAN Module know the message processing is done, and it's ready to be processed
	CANUpdateChannel(CAN2, CAN_CHANNEL0);
}

/**	
 *	@brief	ISR for all CAN1 events. Triggered only by the RX channel not being empty.
 *			This indicates that the RTR from CAN2 has been received. The corresponding global
 *			flag is set, and the message can be parsed by CAN1_process_RX().
 *	@param	None.
 *	@return	None.
 **/
void __ISR(_CAN_1_VECTOR, IPL4) isr_CAN1_handler(void) {
	// Check if the source of the interrupt is  RX_EVENT.
	if ((CANGetModuleEvent(CAN1) & CAN_RX_EVENT) != 0) {
		/* Within this, you can check which channel caused the event by using the 
		 * CANGetModuleEvent() function which returns a code representing the highest
		 * priority pending event. */
		if (CANGetPendingEventCode(CAN1) == CAN_CHANNEL1_EVENT) {
			/* This means that channel 1 caused the event. The CAN_RX_CHANNEL_NOT_EMPTY
			 * event is persistent. You could either read the channel in the ISR
			 * to clear the event condition or as done here, disable the event source,
			 * and set an application flag to indicate that a message  has been received.
			 * The event can be enabled by the application when it has processed one
			 * message. */
			CANEnableChannelEvent(CAN1, CAN_CHANNEL1, CAN_RX_CHANNEL_NOT_EMPTY, FALSE);
			CAN1_received_flag = TRUE;	// Set the CAN1 Message received flag
		}
	}

	INTClearFlag(INT_CAN1);
}

/**	
 *	@brief	ISR for all CAN2 events. Triggered only by the RX channel not being empty.
 *			This indicates that the desired PWM from CAN1 has been received. The
 *			corresponding global flag is set, and the message can be parsed by CAN2_process_RX().
 *	@param	None.
 *	@return	None.
 **/
void __ISR(_CAN_2_VECTOR, ipl4) isr_CAN2_handler(void) {
	// Check if the source of the interrupt is RX_EVENT.
	if ((CANGetModuleEvent(CAN2) & CAN_RX_EVENT) != 0) {
		/* Within this, you can check which event caused the interrupt by using the 
		 * CANGetPendingEventCode() function to get a code representing the highest
		 * priority active event.*/
		if (CANGetPendingEventCode(CAN2) == CAN_CHANNEL1_EVENT) {
			/* This means that channel 1 caused the event. The CAN_RX_CHANNEL_NOT_EMPTY
			 * event is persistent. You could either read the channel in the ISR
			 * to clear the event condition or as done here, disable the event source,
			 * and set  an application flag to indicate that a message has been received.
			 * The event can be enabled by the application when it has processed one
			 * message. */
			CANEnableChannelEvent(CAN2, CAN_CHANNEL1, CAN_RX_CHANNEL_NOT_EMPTY, FALSE);
			CAN2_received_flag = TRUE;	// Set the CAN2 message received flag
		}
	}
	
	INTClearFlag(INT_CAN2);
}