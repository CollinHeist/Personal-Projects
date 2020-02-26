`timescale 1ns / 1ps

module debounce(clock, reset_button, reset_debounce);
	input logic clock, reset_button;
	output logic reset_debounce;

logic [1:0] reset_register = 0; // 2FF synchronizer

assign reset_debounce = rst_sreg[0];

// lfsr and reset sync
always_ff@(posedge clock) begin
	reset_register <= {reset_button, reset_register[1]};
end

endmodule : debounce