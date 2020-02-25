`timescale 1ns / 1ps

module testbench();

// Global Parameters
parameter CLK_PRD = 100;
parameter HOLD_TIME = (CLK_PRD * 0.3);
parameter MAX_SIM_TIME = (200 * CLK_PRD);

// Internal logic signals
logic clock, reset, finished;

// Instantiate the GCD core as a UUT
memory_reader dut(.*);

// Prevent simulating longer than MAX_SIM_TIME
initial #(MAX_SIM_TIME) $finish;

// Generate Clock Signal
initial begin
	clock <= 0;
	forever #(CLK_PRD / 2) clock = ~clock;
end

// Main Simulation
initial begin
	reset = 1; #50;	// Global reset
	
	@(posedge clock); #HOLD_TIME;  // Align with clock

	reset = 0; #CLK_PRD;

	// Stimulate the dut
	forever begin
		@(posedge clock);
		if (finished)
			$finish
	end

	$finish;
end

endmodule