`timescale 1ns / 1ps

// This module begins stimulating the gcd_core module when compute
// is asserted, and sends the value of data_x and data_y to the
// module. Then, gcd_ready and the proper gcd_result are asserted.
module gcd_calculator(
	input logic clock,
	input logic reset,
	input logic compute,
	input logic [7:0] data_x,
	input logic [7:0] data_y,
	output logic gcd_ready,
	output logic [7:0] gcd_result
);

// Internal Signals
logic load, reset_fsm, done;
logic [7:0] data;

// Instantiate the GCD Core Module
gcd_core gcd_core_instance(
	.clock(clock),
	.reset(reset_fsm),
	.load(load),
	.data(data),
	.gcd_result(gcd_result),
	.done(done)
);

// Finite State Machine Implementation
typedef enum logic [3:0] {reset_state, send_load, send_x, send_y, wait_state} statetype;
statetype state;

always_ff @(posedge clock) begin
	if (reset) begin
		state <= reset_state;
		end
	else begin
		case (state)
			reset_state:	state <= (compute ? send_load : reset_state);
			send_load:		state <= send_x;
			send_x:			state <= send_y;
			send_y:			state <= wait_state;
			wait_state:		state <= (done ? reset_state : wait_state);
		endcase
		end
end

// Finite State Machine Output Implementation
always_comb begin : fsm_output_comb
	load = 0; data = 0; gcd_ready = 0; reset_fsm = 0;
	if (~reset) begin : not_reset
		case (state)
			reset_state:	reset_fsm = compute;
			send_load:		load = 1;
			send_x:			data = data_x;
			send_y:			data = data_y;
			wait_state:		gcd_ready = done;
		endcase
		end : not_reset
end : fsm_output_comb

endmodule : gcd_calculator