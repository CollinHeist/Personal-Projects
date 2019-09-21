/* These header files are part of the compiler distribution. */
#include <p32xxxx.h>
#include <sys/asm.h>

/* ISR_Support.h is part of the FreeRTOS distribution.  It contains the 
implementation of the portSAVE_CONTEXT and portRESTORE_CONTEXT macros. */
#include "ISR_Support.h"

	.set	nomips16
 	.set 	noreorder
 	
	/* The C portion of the handler is implemented in an external C file. 
	The .extern directive makes the function visible from within this
	assembly file. */
 	.extern isr_changeNoticeHandler
	
	/* Required by the save and restore macros. */
	.extern xISRStackTop
	
	/* Make the assembler portion of the handler visible outside of this file.
	Making the wrapper visible from C files means the C compiler key word
	extensions can be used to populate the interrupt vector table.  See main.c
	for an example. */
 	.global	isr_changeNoticeWrapper

	.set		noreorder
	.set 		noat
	.ent		isr_changeNoticeWrapper

/* Start of the handler implementation. */
isr_changeNoticeWrapper:

	/* Save the context of the currently executing task.  portSAVE_CONTEXT()
	must be called before anything else is done. */
	portSAVE_CONTEXT
	
	/* Call the C portion of the interrupt handler.  A NOP is always required
	after a jal instruction. */
	jal isr_changeNoticeHandler
	nop
	
	/* Restore the context of the next task to execute - which might be a 
	different task to that which was executing before this interrupt occurred
	(that would be the case if the interrupt handler caused a task to leave the 
	Blocked state, and the unblocked task had a priority that was equal to or
	above the priority of the originally executing task). 

	portRESTORE_CONTEXT must be called at the very end and handles returning
	from the interrupt. */
	portRESTORE_CONTEXT

	.end		isr_changeNoticeWrapper