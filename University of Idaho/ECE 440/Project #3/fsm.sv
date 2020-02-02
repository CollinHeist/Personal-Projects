`timescale 1ns / 1ps

module fsm(
	input logic clock,
	input logic reset,
	input logic load,
	input logic x_equal_y,
	input logic x_greater_y,
	output logic update_x,
	output logic data_is_x,
	output logic update_y,
	output logic data_is_y,
	output logic done
);
	
// State machine enumeration
typedef enum logic [1:0] {idle_state, load_state, wait_state, done_state} statetype;
statetype state;	// Current state of the machine

always_ff @(posedge clock) begin
if (reset)  // Move to the idle state if RESET is asserted
	begin
	state <= idle_state;
	update_x = 0;
	data_is_x = 0;
	update_y = 0;
	data_is_y = 0;
	done = 0;
	end
else begin
	case (state)
		idle_state: state <= (load ? load_state : idle_state);
		load_state: state <= wait_state;
		wait_state:	state <= (x_equal_y ? done_state : wait_state);
		done_state: state <= (load ? load_state : done_state);
	endcase
end

always_comb begin
	update_x = 0; data_is_x = 0; update_y = 0; data_is_y = 0; done = 0;
	if (~reset) begin	// When reset is asserted, all outputs will be 0 by default
		case (state)
			idle_state: begin
				update_x = load;
				data_is_x = load;
				end
			load_state: begin
				update_y = 1;
				data_is_y = 1;
				end
			wait_state: begin
				if (x_equal_y)
					done = 1;
				else if (x_greater_y)
					update_x = 1;
				else if (~x_greater_y)
					update_y = 1;
				end
			done_state: begin
				if (~load)
					done = 1;
				else
					update_x = 1;
					data_is_x = 1;
				end
		endcase
	end
end
	
endmodule
