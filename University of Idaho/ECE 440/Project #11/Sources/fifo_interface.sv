`timescale 1ns / 1ps
module fifo_interface(clock, reset, master_valid, slave_ready, fifo_data, x_factorial);
    input logic clock, reset, master_valid;
    input logic [31:0] fifo_data;
    output logic slave_ready;
    output logic [31:0] x_factorial;
    
// Instantiate the Factorial Unit
logic start, done;
logic [31:0] x_f, x_factorial_regs;
factorial factorial(
    .clock(clock),
    .reset(reset),
    .start(start),
    .x(fifo_data),
    .x_factorial(x_f),
    .done(done)
);
assign x_factorial = x_factorial_regs;

typedef enum logic {reset_state, start_state} statetype;
statetype state;

always_ff @(posedge clock) begin : fsm_advancement
    if (~reset) begin
        state <= reset_state;
        x_factorial_regs <= 0;
        end
    else begin
        case (state)
            reset_state: begin
                state <= master_valid ? start_state : reset_state;
                slave_ready <= master_valid;
                x_factorial_regs <= master_valid ? 0 : x_factorial_regs;
                end
            start_state: begin
                state <= done ? reset_state : start_state;
                x_factorial_regs <= done ? x_f : x_factorial_regs;
                slave_ready <= 0;
                end 
        endcase
        end
end : fsm_advancement

assign start = (state == reset_state & master_valid);

endmodule : fifo_interface