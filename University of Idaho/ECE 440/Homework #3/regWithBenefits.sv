`timescale 1ns / 1ps

module regWithBenefits
	#(parameter W = 8)
	(input logic [W-1:0] d,
	 input logic rstN, ck, clr, ld, shl, shIn,
	 output logic [W-1:0] q);

logic [W-1:0] register = 0;

always_ff @(posedge ck or negedge rstN) begin
	if (~rstN or clr) begin
		register <= 0;
		q <= 0;
		end
	else if (ld)
		register <= d;
	else if (shl)
		register <= {register[W-2:0], shIn};
end

endmodule