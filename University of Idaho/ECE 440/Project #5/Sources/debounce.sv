`timescale 1ns / 1ps

module debounce(
	input logic clock,
	input logic reset_button,
	input logic load_button,
	output logic reset_debounce, load_debounce
);

logic [1:9] lfsr = 0;
logic [9:0] load_sreg = 0;
logic [1:0] rst_sreg = 0; // 2FF synchronizer

assign reset_debounce = rst_sreg[0];

// lfsr and reset sync
always_ff@(posedge clock) begin
	// 2FF reset sync
	rst_sreg <= {reset_button, rst_sreg[1]};
	
	// LFSR and load debounce
	if (reset_debounce) begin
		lfsr <= 0;
		load_sreg <= 0;
		load_debounce <= 0;
		end
	else begin
		lfsr <= {(lfsr[5] ~^ lfsr[9]), lfsr[1:8]};
		if (lfsr == 0) begin
			load_sreg <= {load_button, load_sreg[9:1]};
			load_debounce <= (load_sreg[8:0] == 9'b100000000);
			end
		else
			load_debounce <= 0;			   
		end
end
endmodule