/** 
 *	@file	CAN-C.h
 *	@brief	CAN header file. Defines the bus speed, channel size, and ID masks
 *	@author	Collin Heist
 **/

#ifndef __CAN_FUNCTIONS_H__
	#define __CAN_FUNCTIONS_H__

	#define CAN_BUS_SPEED				250000

	/* This is the CAN1 FIFO message area.	 * Note the size of CAN1 message area.
	 * It is 2 (Channels)*8 (Messages Buffers) 16 (bytes/per message buffer) bytes. */
	#define CAN1_CHANNELS				2
	#define CAN1_FIFO_BUFFERS			8
	#define CAN1_MSG_BUFF_SIZE			16
	#define CAN1_MSG_MEMORY  			CAN1_CHANNELS*CAN1_FIFO_BUFFERS*CAN1_MSG_BUFF_SIZE

	/* This is the CAN2 FIFO message area. Note: the size of CAN2 message area.
	 * It is 2 (Channel) * 8 (Messages Buffers * 16 (bytes/per message buffer) bytes. */
	#define CAN2_CHANNELS				2
	#define CAN2_FIFO_BUFFERS			8
	#define CAN2_MSG_BUFF_SIZE			16
	#define CAN2_MSG_MEMORY  			CAN2_CHANNELS*CAN2_FIFO_BUFFERS*CAN2_MSG_BUFF_SIZE

	// Byte bit masks
	#define BYTE_0_MASK					0x00000000FF
	#define BYTE_1_MASK					0x000000FF00
	#define BYTE_2_MASK					0x0000FF0000
	#define BYTE_3_MASK					0x00FF000000

	// CAN ID macros
	#define SID_BIT_MASK				0x07FF		// Bit masking for generating SID
	#define EID_BIT_MASK				0x03FFFF	// Bit masking for generating EID

	#define SID_FILTER_MASK				0x07FF		// 11 bit mask - all bits must match
	#define EID_FILTER_MASK				0x01FFFFFFF	// 29 bit mask - all bits must match

	#define CAN1_PWM_MESSAGE_ID			0x0204		// Message ID that corresponds to a PWM setting message
	#define CAN2_RTR_MESSAGE_ID			0x0201		// Message ID that corresponds to a RTR message

	#define CAN_NO_MESSAGE_RECEIVED		0			// Signifies when no message was received
	#define CAN_MESSAGE_RECEIVED		1			// Signifies when a message was received

	// Function Prototypes
	void initialize_CAN1(void);
	void initialize_CAN2(void);
	unsigned int CAN1_process_RX(float* temperature, float* motor_speed, float* pwm_setting);
	unsigned int CAN2_process_RX(float* desired_pwm_setting);
	void CAN1_send_TX(float desired_pwm_setting);
	void CAN1_send_RTR(void);
	void CAN2_refill_RTR_buffer(float temperature, float motor_speed, float pwm_setting);
#endif