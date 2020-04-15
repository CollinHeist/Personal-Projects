`timescale 1ns / 1ps

module factorial(clock, reset, start_async, x, x_factorial, done);
    input logic clock, reset, start_async;
    input logic [31:0] x;
    output logic [31:0] x_factorial;
    output logic done;
    
// Pulse-Syncronize the start signal
logic start;
logic [2:0] start_sync_FFs;
always_ff @(posedge clock) begin : start_sync
    if (reset)
        start_sync_FFs <= 0;
    else
        start_sync_FFs <= {start_sync_FFs[1:0], start_async};
end : start_sync
assign start = start_sync_FFs[2] ^ start_sync_FFs[1];
    
// Internal signals
logic done_computing, is_valid_x, do_sub_addition;
logic [31:0] x_in, temp_x_factorial, n, j;
assign is_valid_x = (x > 1);
assign do_sub_addition = (j > 1);
assign done_computing = (n == 1);

// FSM Implementation
typedef enum logic {reset_state, compute} statetype;
statetype state;

always_ff @(posedge clock) begin : fsm_advancement
    if (reset) begin
        state <= reset_state;
        x_factorial <= 0;
        temp_x_factorial <= 0;
        n <= 0;
        j <= 0;
        end
    else begin
        x_in <= start ? x : x_in;
        case (state) 
            reset_state: begin
                state <= (start & is_valid_x) ? compute : reset_state;
                x_factorial <= start ? (is_valid_x ? x : 1) : 0;
                n <= (start & is_valid_x) ? x : 0;
                end
            compute: begin
                state <= done_computing ? reset_state : compute;
                if (~done_computing & do_sub_addition) begin // Do inner loop
                    j <= j - 1;
                    x_factorial <= x_factorial + temp_x_factorial;
                    end
                else if (~done_computing) begin // Do outer loop
                    n <= n - 1;
                    temp_x_factorial <= x_factorial;
                    j <= n - 1;
                    end
                end
        endcase
        end
end : fsm_advancement

// FSM Output
assign done = (state == compute & done_computing & ~reset) | (state == reset_state & start & ~reset & ~is_valid_x);

endmodule : factorial