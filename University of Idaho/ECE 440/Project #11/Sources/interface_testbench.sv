`timescale 1ns / 1ps

module fifo_interface_tb();

parameter CLOCK_PERIOD = 100;
parameter HOLD_TIME = CLOCK_PERIOD * 0.3;
parameter MAX_SIMULATION_TIME = 100 * CLOCK_PERIOD;

logic clock, reset, master_valid, slave_ready;
logic [31:0] fifo_data, x_factorial;
fifo_interface dut(.*);

initial #MAX_SIMULATION_TIME $finish;
initial begin clock <= 0; forever #(CLOCK_PERIOD / 2) clock = ~clock; end

initial begin : simulation
    reset = 0; master_valid = 0; fifo_data = 0; #CLOCK_PERIOD;
    @(posedge clock); #HOLD_TIME;
    
    reset = 1; repeat(2) #CLOCK_PERIOD;
    
    $monitor(x_factorial);
    master_valid = 1; fifo_data = 4; #CLOCK_PERIOD; while (x_factorial == 0) begin master_valid = 0; #CLOCK_PERIOD; end
    master_valid = 1; fifo_data = 6; #CLOCK_PERIOD; while (x_factorial == 0) begin master_valid = 0; #CLOCK_PERIOD; end
    master_valid = 1; fifo_data = 8; #CLOCK_PERIOD; while (x_factorial == 0) begin master_valid = 0; #CLOCK_PERIOD; end
    master_valid = 1; fifo_data = 10; #CLOCK_PERIOD; while (x_factorial == 0) begin master_valid = 0; #CLOCK_PERIOD; end
    master_valid = 1; fifo_data = 12; #CLOCK_PERIOD; while (x_factorial == 0) begin master_valid = 0; #CLOCK_PERIOD; end
    $finish;
end : simulation
endmodule : fifo_interface_tb