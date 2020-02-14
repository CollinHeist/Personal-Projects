`timescale 1ns / 1ps

module weird_circuit(
	input logic clock,
	input logic reset,
	output logic [1:0] data
);

// Internal Signals
logic write_enable;
logic [3:0] counter;
logic [1:0] memory_out, isolated_reg, data_in;

// Implement subtractor, and write-enable 
assign data_in = (isolated_reg - 2'b01);
assign write_enable = (counter[3] & counter[0]);
assign data = isolated_reg;

// Instantiate Memory Unit
dist_mem_gen_0 memory(
	.a({2'b00, counter[2:1]}),
	.d(data_in),
	.clk(clock),
	.we(write_enable),
	.spo(memory_out)
);

always_ff @(posedge clock) begin
	if (reset) begin
		counter <= 4'b0000;
		isolated_reg <= 2'b00;
		end
	else begin
		counter <= counter + 4'b0001;
		isolated_reg <= memory_out;
		end
end

endmodule