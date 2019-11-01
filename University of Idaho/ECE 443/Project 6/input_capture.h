/** 
 *	@file 	input_capture.h
 *	@brief 	Input Capture header file. Defines the buffer length to use for calculating the average RPS.
 *	@author	Collin Heist
 **/

#ifndef __INPUT_CAPTURE_H__
    #define __INPUT_CAPTURE_H__

    // How long of a buffer to keep for the motor speed
	#define SPEED_BUFFER_LEN	16		

    // Function Prototypes
    void initialize_input_capture(void);
    float get_average_rps(void);
#endif