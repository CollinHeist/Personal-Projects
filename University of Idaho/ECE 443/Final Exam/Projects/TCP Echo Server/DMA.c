/** 
 *	@file 	DMA.c
 *	@brief 	Direct memory access file. Configures the DMA to transfer data between two locations
 *			on triggers of the ADC interrupt flag. Utilizes DMA channel 0.
 *	@author	Collin Heist
 **/

// File Inclusion
#include <plib.h>
#include "DMA.h"

// https://people.ece.cornell.edu/land/courses/ece4760/PIC32/pic32_DMA.pdf
unsigned int initialize_DMA(void* source_addr, void* dest_addr, unsigned int source_size_bytes, unsigned int dest_size_bytes, unsigned int cell_size) {
	DmaChnDisable(0); // Turn off DMA-CH0
	DmaChnOpen(DMA_CHANNEL0, DMA_CHN_PRI0, DMA_OPEN_AUTO); // _, _, DMA_OPEN_DEFAULT or DMA_OPEN_AUTO
	// channel - start virtual address - dest virtual address - source size - dest size - cell size
	DmaChnSetTxfer(DMA_CHANNEL0, (void*) source_addr, (void*) dest_addr, source_size_bytes, dest_size_bytes, cell_size);
	
	// Trigger DMA on ADC conversion termination which is in turn triggered by T3 interrupting
	DmaChnSetEventControl(DMA_CHANNEL0, DMA_EV_START_IRQ(_ADC_IRQ));
	
	// Re-enable the DMA
	DmaChnEnable(0);
	
	return NO_ERROR;
}