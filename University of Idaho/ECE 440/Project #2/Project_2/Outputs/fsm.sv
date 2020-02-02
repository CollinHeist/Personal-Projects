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
	output logic done);
	
// State machine enumeration
typedef enum logic [2:0] {idle_state, load_x_state, load_y_state, wait_state, update_x_state, update_y_state, done_state} statetype;
statetype state;	// Current state of the machine

always_ff @(posedge clock)
begin
if (reset)  // Move to the idle state if RESET is asserted
	begin
	state <= idle_state;
	update_x = 0;
	data_is_x = 0;
	update_y = 0;
	data_is_y = 0;
	done = 0;
	end
else
	case (state)
		idle_state:
			begin
			if (load)
				begin
				state <= load_x_state;
				update_x = 1;
				data_is_x = 1;
				update_y = 0;
				data_is_y = 0;
				done = 0;
				end
			else
				begin
				state <= idle_state;
				update_x = 0;
				data_is_x = 0;
				update_y = 0;
				data_is_y = 0;
				done = 0;
				end
			end
		load_x_state:
			begin
			state <= load_y_state;
			update_x = 0;
			data_is_x = 0;
			update_y = 1;
			data_is_y = 1;
			done = 0;
			end
		load_y_state:
			begin
			state <= wait_state;
			update_x = 0;
			data_is_x = 0;
			update_y = 0;
			data_is_y = 0;
			done = 0;
			end
		wait_state:
			begin
			if (~x_equal_y && x_greater_y) // Replacing x state
				begin
				state <= update_x_state;
				update_x = 1;
				data_is_x = 0;
				update_y = 0;
				data_is_y = 0;
				done = 0;
				end
			 else if (~x_equal_y && ~x_greater_y)
				begin
				state <= update_y_state;
				update_x = 0;
				data_is_x = 0;
				update_y = 1;
				data_is_y = 0;
				done = 0;
				end
			else
				begin
				state <= done_state;
				update_x = 0;
				data_is_x = 0;
				update_y = 0;
				data_is_y = 0;
				done = 1;
				end
			end
		update_x_state, update_y_state:
			begin
			state <= wait_state;
			update_x = 0;
			data_is_x = 0;
			update_y = 0;
			data_is_y = 0;
			done = 0;
			end
		done_state:
			begin
			if (~load)
				begin
				state <= done_state;
				update_x = 0;
				data_is_x = 0;
				update_y = 0;
				data_is_y = 0;
				done = 1;
				end
			else
				begin
				state <= load_x_state;
				update_x = 1;
				data_is_x = 1;
				update_y = 0;
				data_is_y = 0;
				done = 0;
				end
			end
	endcase
end
	
endmodule
