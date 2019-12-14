/** 
 *	@file 	main.h
 *	@brief 	Main header file. Provides useful macros and function prototypes.
 *	@author	Collin Heist
 **/

#ifndef __MAIN_H__
	#define __MAIN_H__

	// TCP Stack macros
	#define tcpechoSHUTDOWN_DELAY		(pdMS_TO_TICKS(5000))
	#define sourceAddress				{129, 101, 222, 23}
	#define listeningPort				(10000)

	#define ERROR						(1)
	#define NO_ERROR					(0)

	// Macros for Quantizing the ADC results
	#define QUANTIZATION_BITS			(3) 							// How many bits to quantize the ADC measurementto
	#define QUANTIZED_MAX_VAL			((1 << QUANTIZATION_BITS) - 1)	// Maximum value after quantization
	#define MAX_VAL						(1024)							// Maximum possible value
	#define QUANTIZE(N)					(((float) N / (float) MAX_VAL) * (float) QUANTIZED_MAX_VAL)	// Function to quantize a given value
	#define INT_TO_ASCII(I)				(I + '0')						// Convert a given integer (0-9) to '0'-'9'

	#define ADC_SAMPLE_COUNT			(64)							// How many samples to store at one time
	#define ADC_SAMPLE_COUNT_BYTES		(ADC_SAMPLE_COUNT * sizeof(unsigned int))	// How many bytes the sample space takes
	#define DMA_SOURCE_SIZE_BYTES		(4)								// How many bytes the source of the ADC buffer is
	#define DMA_DEST_SIZE_BYTES			(sizeof(unsigned int))			// How many bytes one 'entry' of the DMA destination buffer is (the ADC array)

	// Function Prototypes
	static unsigned int initialize_system(void);
	static unsigned int create_tasks(void);
	static void task_quantize_ADC_buffer(void* task_params);
	static void task_log_ADC(void* task_params);
	static void vCreateTCPServerSocket(void *pvParameters);
	static void prvServerConnectionInstance(void *pvParameters);
#endif