`timescale 1ns / 1ps

module spi
	#(parameter clock_scale = 4, counter_bits = 3)
	(input logic clock, start, miso, reset,
	input logic [7:0] data,
	output logic slave_select, spi_clock, mosi, done
);

// Internal Signals needed for the clock scaling (slowing)
logic [counter_bits-1:0] clock_counter;

// Clock-slowing Syncronous implementation
always_ff @(posedge clock) begin : clock_scale_sync
	if (reset) begin
		clock_counter <= 0;
		spi_clock <= 0;
		end
	else begin
		if (clock_counter == (clock_scale - 1)) begin
			spi_clock <= ~spi_clock;	// Toggle clock
			clock_counter <= 0;			// Reset counter
			end
		else
			clock_counter <= clock_counter + 1;
		end
end : clock_scale_sync

// Internal signals needed for SPI implementation
logic end_of_message;	// Signal used to determine if the whole byte has been sent
logic [2:0] address;	// Current address being sent

// Finite State Machine Implementation
typedef enum logic [1:0] {reset_state, start_transmission, send_bit, wait_for_acknowledge} statetype;
statetype state;

// Internal FSM Wiring
assign end_of_message = (address == 0);

// FSM State Transitions
always_ff @(posedge spi_clock) begin : spi_fsm
	if (reset) begin
		state <= reset_state;
		address <= 7;
		end
	else begin
		case (state)
			reset_state: begin
				state <= (start ? start_transmission : reset_state);
				address <= 7;
				end
			start_transmission:	begin
				state <= send_bit;
				address <= address - 1;
				end
			send_bit: begin
				state <= (end_of_message ? wait_for_acknowledge : send_bit);
				address <= address - 1;
				end
			wait_for_acknowledge:
				state <= (start ? wait_for_acknowledge : reset_state);
		endcase
		end
end : spi_fsm

// FSM Output Implementation
always_comb begin : fsm_output_comb
	slave_select = 1; mosi = 0; done = 0;
	if (~start) begin
		case (state)
			reset_state:
				slave_select = 0;
			start_transmission: begin
				slave_select = 0;
				mosi = data[address];
				end
			send_bit: begin
				slave_select = 0;
				if (~end_of_message)
					mosi = data[address];
				end
			wait_for_acknowledge: begin
				slave_select = 1;
				done = 1;
				end
		endcase
		end
end : fsm_output_comb

endmodule : spi
