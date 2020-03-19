`timescale 1ns / 1ps

module display_wrapper(clock, reset, switches, leds)
	input logic clock, reset;
	input logic [2:0] switches;
	output logic [3:0] leds;

// Instantiate the Codon Reader
logic codon_index, done_reader;
logic [3:0] codon1, codon2, codon3, codon4, codon5;
logic [4:0] end_of_codon;
codon_reader codon_reader_instance(.*);

// Instantiate the Codon Counter
logic [2:0] count_index,
logic [3:0] codon_count;
logic done_counter;
codon_counter codon_counter_instance(.*);
assign count_index = switches;

always_comb begin : led_assignment
	leds = 4'b0000;
	if (done_counter) begin
		leds[0] = (switches == 4'b0000) || codon_count[0];
		leds[3:1] = codon_count[3:1]
		end
end : led_assignment

endmodule : display_wrapper