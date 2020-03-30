`timescale 1ns / 1ps

module hardware_wrapper(clock, reset, switches, leds);
	input logic clock, reset;
	input logic [2:0] switches;
	output logic [3:0] leds;

// Instantiate the Codon Reader
logic done_reader;
logic [2:0] codon_index;
logic [3:0] codon1, codon2, codon3, codon4, codon5;
logic [4:0] end_of_codon;
codon_reader codon_reader_instance(.*);

// Instantiate the Codon Counter
logic [2:0] count_index;
logic [3:0] codon_count;
logic done_counter;
codon_counter codon_counter_instance(.*);
always_comb begin : count_assignment
	count_index = 0;
	unique casez(switches)	// Messy, but it works
		3'b00?:		count_index = 0;
		3'b010:		count_index = 1;
		3'b011:		count_index = 2;
		3'b100:		count_index = 3;
		3'b101:		count_index = 4;
		default:	count_index = 0;
	endcase
end : count_assignment

always_comb begin : led_assignment
	leds = 4'b0000;
	if (done_counter) begin
		if (switches == 3'b000)
			leds = 4'b0001;
		else 
			leds = codon_count;
		end
end : led_assignment

endmodule : hardware_wrapper