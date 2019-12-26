/** 
 *	@file 	ADC.c
 *	@brief 	ADC source file. Allows configuring AN2 to to begin conversions on
 *			triggers of T3 at variable frequencies.
 *	@author	Collin Heist
 **/

// File inclusion
#include <plib.h>
#include "chipKIT_PRO_MX7.h"
#include "ADC.h"

// Global Variables
static unsigned int adc_samples_taken; // Private count of how many ADC samples have been taken

struct prescale_struct {
    float value;
    long int mask;
};

static struct prescale_struct prescales[] = {
    {1.0, T3_PS_1_1},
    {2.0, T3_PS_1_2},
    {4.0, T3_PS_1_4},
    {8.0, T3_PS_1_8},
    {16.0, T3_PS_1_16},
    {32.0, T3_PS_1_32},
    {64.0, T3_PS_1_64},
    {256.0, T3_PS_1_256},
    {TIMER3_PS_ERROR, (long int) TIMER3_PS_ERROR} // Error value to signify the end of the options
};

/**	
 *	@brief		Initialize the ADC unit. Calls the T3 initialization function. Utilizes AN2.
 *	@param[in]	timer3_frequency: Floating point value that represents the desired frequency to T3.
 *	@return		unsigned int that is either ERROR or NO_ERROR if the initialization failed.
 **/
unsigned int initialize_ADC(float timer3_frequency) {
    // Attempt to initialize T3 - if an error occurs, exit
    if (initialize_timer3(timer3_frequency) == ERROR)
        return ERROR;
    
    CloseADC10();   // The ADC must be off before it can be configured
    
    SetChanADC10(ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN2);
    OpenADC10(ADC_MODULE_OFF | ADC_FORMAT_INTG16 | ADC_CLK_TMR | ADC_AUTO_SAMPLING_ON, // Either ADC_CLK_TMR or ADC_CLK_AUTO
        ADC_VREF_AVDD_AVSS | ADC_OFFSET_CAL_DISABLE | ADC_SCAN_OFF | ADC_SAMPLES_PER_INT_1 | ADC_ALT_BUF_OFF | ADC_ALT_INPUT_OFF,
        ADC_CONV_CLK_PB | ADC_SAMPLE_TIME_15,
        ENABLE_AN2_ANA,
        SKIP_SCAN_ALL
    );
    EnableADC10();
    
    // Wait for the first conversion to complete
    while (!mAD1GetIntFlag()) {}
    
    // Return successfully
    return NO_ERROR;
}

/**	
 *	@brief		Initialize Timer 3 to the desired variable frequency.
 *	@param[in]	timer3_frequency: Floating point value that represents the desired frequency to T3.
 *	@return		unsigned int that is either ERROR or NO_ERROR if the initialization failed.
 **/
static unsigned int initialize_timer3(float timer3_frequency) {
    unsigned int index = 0;
    
    // Return if an invalid frequency was entered
    if (timer3_frequency <= 0 || timer3_frequency > (float) TIMER3_BASE_FREQ)
        return ERROR;
    
    while (prescales[index].value != TIMER3_PS_ERROR) {
        float current_PR3_val = (float) TIMER3_BASE_FREQ / (float) prescales[index].value / timer3_frequency;
        if (current_PR3_val < (float) TIMER3_MAX_PR_VAL) {
            // This current prescale value works - configure the timer
            OpenTimer3(T3_ON | T3_SOURCE_INT | prescales[index].mask, (unsigned long int) current_PR3_val);
            mT3SetIntPriority(1);
            mT3SetIntSubPriority(0);
            mT3IntEnable(1);
            return NO_ERROR;
        }
        else {
            index++;       // Move to the next possible prescale iteration
        }
    }
    // This frequency cannot be achieved at any given frequency (must be realllly low)
    return ERROR; 
}

/**	
 *	@brief		Re-initialize Timer 3 to the desired variable frequency.
 *	@param[in]	timer3_frequency: Floating point value that represents the desired frequency to T3.
 *	@return		unsigned int that is either ERROR or NO_ERROR if the initialization failed.
 **/
unsigned int reconfigure_timer3(float timer3_frequency) {
	CloseTimer3();								// Close T3 for reconfiguration
	DisableIntT3();								// Disable interrupt for T3
	return initialize_timer3(timer3_frequency);	// Reconfigure 
}

/**	
 *	@brief	Timer 3 ISR. Increments the global adc_samples_taken value.
 *	@param	None.
 *	@return	None.
 **/
void __ISR(_TIMER_3_VECTOR, IPL1) isr_timer3() {
    adc_samples_taken++;        // Increment ADC counter
    mT3ClearIntFlag();
}

/**	
 *	@brief	Function to read from the active ADC channel.
 *	@param	None.
 *	@return	unsigned int that represents the ADC result on Channel 2.
 **/
unsigned int read_ADC(void) {
    // Read the result of Channel 2 conversion and return it
    return ReadADC10(0);
}

/**	
 *	@brief		Function to retrieve the current count of samples taken by the ADC.
 *	@param[in]	reset: Unsigned int that is either DO_RESET_COUNT or DONT_RESET_COUNT if the value should go to 0.
 *	@return		unsigned int that represents the most recent count.
 **/
unsigned int get_sample_count(unsigned int reset) {
    unsigned int temp_sample_count = adc_samples_taken;
    
    if (reset == DO_RESET_COUNT)    
        adc_samples_taken = 0;  // If the count should be reset - set to 0
        
    return temp_sample_count;
}