`timescale 1ns / 1ps

module regWithBenefits
	#(parameter W = 8)
	(input logic [W-1:0] d,
	 input logic rstN, ck, clr, ld, shl, shIn,
	 output logic [W-1:0] q);

always_ff @(posedge ck or negedge rstN) begin
	if (~rstN | clr) begin
		q <= 0;
		end
	else if (ld)
		q <= d;
	else if (shl)
		q <= {register[W-2:0], shIn};
end

endmodule