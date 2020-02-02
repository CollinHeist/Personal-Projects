`timescale 1ns / 1ps
module dp(
    input logic clock,
    input logic update_x,
    input logic data_is_x,
    input logic update_y,
    input logic data_is_y,
    input logic [7:0] data,
    output logic x_equal_y,
    output logic x_greater_y,
    output logic [7:0] gcd_result);
    
// Internal Signals
logic [7:0] x_min_y, y_min_x;   // Result of x-y, and y-x
logic [7:0] x, y;               // Storage containers for x, y
    
// Generate output comparison signals
assign x_equal_y = (x == y);
assign x_greater_y = (x > y);

// Compute internal subtraction results
assign x_min_y = (x - y);
assign y_min_x = (y - x);

// Update values of x and y
always_ff @(posedge clock)
begin
if (update_x)
    x <= (data_is_x ? data : x_min_y);
    
if (update_y)
    y <= (data_is_y ? data : y_min_x);
end

// Assert temporary output as (x)
assign gcd_result = x;

endmodule