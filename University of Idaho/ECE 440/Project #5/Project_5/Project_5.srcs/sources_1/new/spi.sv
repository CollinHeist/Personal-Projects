`timescale 1ns / 1ps

module spi
	#(parameter clock_scale = 4)
	(input logic clock, start,
	input logic [7:0] data,
	output logic slave_select, spi_clock, mosi, miso
);




endmodule : spi
