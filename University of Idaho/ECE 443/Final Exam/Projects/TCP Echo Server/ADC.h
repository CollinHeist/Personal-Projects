/** 
 *	@file 	ADC.h
 *	@brief 	ADC header file. Defines useful macros.
 *	@author	Collin Heist
 **/
#ifndef __ADC_H__
    #define __ADC_H__

    // Macros for error-detection
    #define ERROR               (1)
    #define NO_ERROR            (0)

    // Macros for the get_sample_count function
    #define DO_RESET_COUNT      (1)
    #define DONT_RESET_COUNT    (0)

	// Timer 3 macros
    #define TIMER3_BASE_FREQ    (GetPeripheralClock())   // Base (undivided) frequency of T3
    #define TIMER3_MAX_PR_VAL   (1 << 16)                // The maximum value of T3 is 2^16
    #define TIMER3_PS_ERROR     (-1.0)    

    // Function Prototypes
    unsigned int initialize_ADC(float timer3_frequency);
    static unsigned int initialize_timer3(float timer3_frequency);
    unsigned int reconfigure_timer3(float timer3_frequency);
    unsigned int read_ADC(void);
    unsigned int get_sample_count(unsigned int reset);
#endif