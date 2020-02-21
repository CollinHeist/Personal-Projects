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
	
	// Global Reset
	#100;
	
	@(posedge clock); #HOLD_TIME;  // Align with clock

	repeat(2) #CLK_PRD;
	buttons[0] = 1;	#CLK_PRD; buttons[0] = 0;

	// Stimulate the dut
	// Load X
	switches = 4'b1110; buttons = 2'b10; #CLK_PRD;	// X-MSB
	switches = 4'b1010; buttons = 2'b10; #CLK_PRD;	// X-LSB
	// Load Y
	switches = 4'b1001; buttons = 2'b10; #CLK_PRD;	// Y-MSB
	switches = 4'b1100; buttons = 2'b10; #CLK_PRD;	// Y-LSB
	switches = 4'b0000; buttons = 2'b00; #CLK_PRD;
	
	forever begin
		@(posedge clock);
		if (leds) begin
			$display("Done asserted, LEDS=%b\nLooking at result.", leds);
			switches = 4'b0010;	#CLK_PRD;	// Look at LSB of GCD result
			$display("Looking at LSB of result, LEDS=%b", leds);
			switches = 4'b0011; #CLK_PRD;	// Look at MSB of GCD Result
			$display("Looking at MSB of result, LEDS=%b", leds);
			$finish;
		end
	end

	$finish;
end

endmodule