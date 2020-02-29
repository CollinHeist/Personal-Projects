`timescale 1ns / 1ps

module hardware_wrapper(clock, reset_button, slave_select, spi_clock, mosi);
	input logic clock, reset_button;
	output logic slave_select, spi_clock, mosi;
	
// Intantiate the debounce module
logic reset_debounce;
debounce debounce_instance(.*);
	
// Instantiate the memory_reader module
logic reset, miso, finished;
assign reset = reset_debounce;
memory_reader memory_reader_instance(.*);

endmodule : hardware_wrapper