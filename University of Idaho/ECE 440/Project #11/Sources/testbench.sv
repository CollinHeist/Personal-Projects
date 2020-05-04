`timescale 1ns / 1ps

module final_tb();

parameter CLOCK_PERIOD = 100;
parameter HOLD_TIME = CLOCK_PERIOD * 0.3;
parameter MAX_SIMULATION_TIME = 200 * CLOCK_PERIOD;

logic clock, reset;
logic [31:0] x_factorial;
bd_wrapper dut(.*);

initial #MAX_SIMULATION_TIME $finish;
initial begin clock <= 0; forever #(CLOCK_PERIOD / 2) clock = ~clock; end

initial begin : simulation
    reset = 0; #CLOCK_PERIOD; @(posedge clock); #HOLD_TIME;
    
    reset = 1; repeat(2) #CLOCK_PERIOD;
    
    $monitor(x_factorial);
end : simulation
endmodule : final_tb