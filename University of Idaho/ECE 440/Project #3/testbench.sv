`timescale 1ns / 1ps

module testbench();

// Global Parameters
parameter CLK_PRD = 100;
parameter HOLD_TIME = (CLK_PRD * 0.3);
parameter MAX_SIM_TIME = (100 * CLK_PRD);

// Internal logic signals
logic clock;
logic [1:0] buttons;
logic [3:0] switches, leds;

// Instantiate the GCD core as a UUT
wrapper dut(.*);

// Prevent simulating longer than MAX_SIM_TIME
initial #(MAX_SIM_TIME) $finish;

// Generate Clock Signal
initial begin
	clock <= 0;
	forever #(CLK_PRD / 2) clock = ~clock;
end 

// Main Simulation
initial begin
	buttons = 2'b00; switches = 4'b0000;
	data = 8'bx;
	
	// Global Reset
	#100;
	
	@(posedge clock);
	
	#HOLD_TIME;

	repeat(2) #CLK_PRD;
	buttons[0] = 1;	#CLK_PRD; buttons[0] = 0;

	// Stimulate the dut
	// Load X
	switches = 4'b0011; buttons = 2'b10; #CLK_PRD;
	switches = 4'b1111; buttons = 2'b10; #CLK_PRD;
	// Load Y
	switches = 4'b0000; buttons = 2'b10; #CLK_PRD;
	switches = 4'b1100; buttons = 2'b10; #CLK_PRD;

	forever begin
		@(posedge clock);
		if (leds) begin
			#CLK_PRD;
			$finish
		end
	end

	$finish;
end
endmodule
