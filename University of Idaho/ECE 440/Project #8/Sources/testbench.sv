`timescale 1ns / 1ps

module testbench();

// Global Parameters
parameter CLK_PRD = 100;
parameter HOLD_TIME = (CLK_PRD * 0.3);
parameter MAX_SIM_TIME = (500 * CLK_PRD);

// Instantiate the GCD core as a DUT
logic clock, reset;
logic [2:0] switches;
logic [3:0] leds;
hardware_wrapper dut(
	.clock(clock),
	.reset(reset),
	.switches(switches),
	.leds(leds)
);

// Prevent simulating longer than MAX_SIM_TIME
initial #(MAX_SIM_TIME) $finish;

// Generate Clock Signal
initial begin
	clock <= 0;
	forever #(CLK_PRD / 2) clock = ~clock;
end 

// Main Simulation
initial begin
	reset = 1; switches = 0;

	// Global Reset
	#100; reset = 0;
	
	@(posedge clock); #HOLD_TIME;  // Align with clock

	forever begin
		@(posedge clock);
		if (leds) begin
			switches = 4'b0001; #CLK_PRD;	// Codon 1
			switches = 4'b0010; #CLK_PRD;	// Codon 2
			switches = 4'b0011; #CLK_PRD;	// Codon 3
			switches = 4'b0100; #CLK_PRD;	// Codon 4
			switches = 4'b0101; #CLK_PRD;	// Codon 5
			switches = 4'b0000; #CLK_PRD;
			$finish;
			end
	end
end

endmodule