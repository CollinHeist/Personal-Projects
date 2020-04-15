`timescale 1ns / 1ps

module factorial_testbench();

// Global Parameters
parameter CLOCK_PERIOD = 100;
parameter HOLD_TIME = CLOCK_PERIOD * 0.3;
parameter MAX_SIMULATION_TIME = 200 * CLOCK_PERIOD;

// Internal logic signals
logic clock, reset, start_async, done;
logic [31:0] x, x_factorial;

// Instantiate the DUT
factorial dut(.*);

// Generate the clock and max-simulation timeout
initial #(MAX_SIMULATION_TIME) $finish;
initial begin clock <= 0; forever #(CLOCK_PERIOD / 2) clock = ~clock; end

initial begin : simulation
    reset = 1; start_async = 0; x = 2; #CLOCK_PERIOD;
    @(posedge clock); #HOLD_TIME;
    
    reset = 0; repeat(2) #CLOCK_PERIOD;
    
    start_async = 1; x = 4; #CLOCK_PERIOD; start_async = 0;
    //repeat(3) #CLOCK_PERIOD;
    while (~done) #CLOCK_PERIOD;
    $display(start_async, x, x_factorial);
    
    start_async = 1; x = 9; #CLOCK_PERIOD; start_async = 0;
    //repeat(3) #CLOCK_PERIOD;
    while (~done) #CLOCK_PERIOD;
    $display(start_async, x, x_factorial);
    
    start_async = 1; x = 12; #CLOCK_PERIOD; start_async = 0;
    //repeat(3) #CLOCK_PERIOD;
    while (~done) #CLOCK_PERIOD;
    $display(start_async, x, x_factorial);
       
    repeat(3) #CLOCK_PERIOD; $finish;
end : simulation

endmodule
