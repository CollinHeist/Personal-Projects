`timescale 1ns / 1ps

module fsm(
	input logic clock, reset, load, x_equal_y, x_greater_y,
	output logic update_x, data_is_x, update_y, data_is_y, done
);
	
// State machine enumeration
typedef enum logic [2:0] {idle_state, load_x_state, load_y_state, wait_state, done_state} statetype;
statetype state;	// Current state of the machine

always_ff @(posedge clock) begin
	if (reset) begin // Move to the idle state if RESET is asserted
		state <= idle_state;
		end
	else begin
		case (state)
			idle_state:		state <= (load ? load_x_state : idle_state);
			load_x_state:	state <= load_y_state;
			load_y_state:	state <= wait_state;
			wait_state:		state <= (x_equal_y ? done_state : wait_state);
			done_state:		state <= (load ? load_x_state : done_state);
		endcase
	end
end

always_comb begin
	update_x = 0; data_is_x = 0; update_y = 0; data_is_y = 0; done = 0;
	if (~reset) begin	// When reset is asserted, all outputs will be 0 by default
		case (state)
			load_x_state: begin
				update_x = 1;
				data_is_x = 1;
				end
			load_y_state: begin
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