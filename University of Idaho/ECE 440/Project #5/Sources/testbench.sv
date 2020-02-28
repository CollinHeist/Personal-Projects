`timescale 1ns / 1ps

module testbench();

// Global Parameters
parameter CLK_PRD = 100;
parameter HOLD_TIME = (CLK_PRD * 0.3);
parameter MAX_SIM_TIME = (200000 * CLK_PRD);

// Instantiate the GCD core as a UUT
logic clock, reset, finished, mosi, slave_select, spi_clock;
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
		// Results should be: 9, 18, 3
		if (finished) $finish;
	end

	$finish;
end

endmodule : testbench