`timescale 1ns / 1ps

module testbench();

// Global Parameters
parameter CLK_PRD = 100;
parameter HOLD_TIME = (CLK_PRD * 0.3);
parameter MAX_SIM_TIME = (16 * 5 * CLK_PRD);

// Internal logic signals
logic clock, reset;
logic [1:0] data;

// Instantiate the GCD core as a UUT
weird_circuit dut(.*);

// Prevent simulating longer than MAX_SIM_TIME
initial #(MAX_SIM_TIME) $finish;

// Generate Clock Signal
initial begin
	clock <= 0;
	forever #(CLK_PRD / 2) clock = ~clock;
end 

// Main Simulation
initial begin
	reset = 1;

	// Global Reset
	#100; reset = 0;
	
	@(posedge clock); #HOLD_TIME;  // Align with clock

	forever begin
		@(posedge clock);
		$display("%b", data);
	end
end

endmodule