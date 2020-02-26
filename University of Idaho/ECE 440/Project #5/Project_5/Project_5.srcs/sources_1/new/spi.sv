`timescale 1ns / 1ps

module spi
	#(parameter clock_scale = 4, counter_bits = 3)
	(clock, start, reset, data, slave_select, spi_clock, mosi, done);

	input logic clock, start, reset;
	input logic [7:0] data;
	output logic slave_select, spi_clock, mosi, done;
	
// Internal Signals needed for the clock scaling (slowing)
logic [counter_bits-1:0] counter;

logic [3:0] address;
logic end_of_message;
assign end_of_message = (address == 0);

// FSM States
typedef enum logic [1:0] {reset_state, lower_ss, send_bit} statetype
statetype state;

// FSM Advancement
always_ff @(posedge clock) begin : fsm
	if (reset) begin
		state <= reset_state;
		counter <= 0;
		address <= 0;
		end
	else begin
		case (state) 
			reset_state:	state <= lower_ss;
			lower_ss: begin
				if (counter == (clock_scale - 1)) begin
					state <= send_bit;
					counter <= counter + 1;
					end
				else begin
					state <= lower_ss;
					counter <= 0;
					end
				end
			send_bit: begin
				if (counter != (clock_scale - 1)) begin
					state <= send_bit;
					counter <= counter + 1;
					end
				else if (end_of_message)
					state <= reset_state;
					counter <= 0;
					end
				else begin
					state <= send_bit;
					counter <= 0;
					address <= address - 1;
					end
				end
		endcase
		end
end : fsm

// FSM Outputs
always_comb begin : fsm_outputs
	slave_select = 1; mosi = 0; done = 0;
	if (~reset) begin
		case (state)
			reset_state: slave_select = (start ? 0 : 1);
			lower_ss: begin
				slave_select = 0;
				if (counter == (clock_scale - 1))
					mosi = data[address];
				end
			send_bit: begin
				if (counter != (clock_scale - 1) | (counter == (clock_scale - 1) & ~end_of_message)) begin
					slave_select = 0;
					mosi = data[address];
					end
				else begin
					slave_select = 1;
					done = 1;
					end
				end
		endcase
		end
end : fsm_outputs

endmodule : spi