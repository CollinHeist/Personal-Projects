`timescale 1ns / 1ps

module gcd_core(
    input logic clock,
    input logic reset,
    input logic load,
    input logic [7:0] data,
    output logic [7:0] gcd_result,
    output logic done);
    
    logic update_x, data_is_x, update_y, data_is_y, x_equal_y, x_greater_y;
    
    dp datapath(.*);
    fsm fsm(.*);
endmodule
