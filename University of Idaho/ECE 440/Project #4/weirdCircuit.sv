`timescale 1ns / 1ps

module weird_circuit(
	input logic clock,
	input logic reset,
	output logic [1:0] data
);

// Internal Signals
logic memory_out, data_in, write_enable;
logic [3:0] counter;
logic [1:0] isolated_reg;

// Implement subtractor, and write-enable 
assign data_in = (data - 2'b01);
assign write_enable = (counter[3] & counter[0]);

// Instantiate Memory Unit
memory memory_inst(
	.clock(clock),
	.address(counter[2:1]),
	.data_in(data_in),
	.write_enable(write_enable),
	.memory_out(memory_out)
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