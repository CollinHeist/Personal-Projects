`timescale 1ns / 1ps

module spi
	#(parameter clock_scale = 4, counter_bits = 3)
	(clock, start, reset, data, last_message, slave_select, spi_clock, mosi, done);

	input logic clock, start, reset, last_message;
	input logic [7:0] data;
	output logic slave_select, spi_clock, mosi, done;
	
// Internal Signals needed for the clock scaling (slowing)
// Clock should be on only when sending bits, if slave select is low, and in the last half of the count
logic [counter_bits-1:0] counter;
assign spi_clock = ~((counter > clock_scale / 2) | slave_select) & (state == send_bit);

// SPI Addressing
logic [3:0] address;
logic end_of_message;
assign end_of_message = (address == 0);

// Whether the clock-slowing is done or not
logic end_of_count;
assign end_of_count = (counter == (clock_scale - 1));

// FSM States
typedef enum logic [1:0] {reset_state, lower_ss, send_bit, wait_state} statetype;
statetype state;

// FSM Advancement
always_ff @(posedge clock) begin : fsm
	if (reset) begin
		state <= reset_state;
		counter <= 0;
		address <= 7;
		end
	else begin
		case (state) 
			reset_state:
				state <= (start ? lower_ss : reset_state);
			lower_ss:
				unique case (end_of_count)
					1'b0: begin state <= lower_ss; counter <= counter + 1; end
					1'b1: begin state <= send_bit; counter <= 0;		   end
				endcase
			send_bit:
				unique casez ({end_of_count, end_of_message})
					2'b0?: begin state <= send_bit; counter <= counter + 1;				  end
					2'b10: begin state <= send_bit; counter <= 0; address <= address - 1; end
					2'b11: begin state <= wait_state; counter <= 0;						  end
				endcase
			wait_state:
				unique casez ({end_of_count, last_message, start})
					3'b0??: begin state <= wait_state; counter <= counter + 1;		end
					3'b100: begin state <= wait_state;								end
					3'b101: begin state <= lower_ss; counter <= 0; address <= 7;	end
					3'b11?: begin state <= reset_state; counter <= 0; address <= 7; end
				endcase
		endcase
		end
end : fsm

// FSM Outputs
always_comb begin : fsm_outputs
	slave_select = 1; mosi = 0; done = 0;
	if (~reset) begin
		case (state)
			reset_state:
				slave_select = (start ? 0 : 1);
			lower_ss: begin
				slave_select = 0;
				if (end_of_count)
					mosi = data[address];
				end
			send_bit: begin
				mosi = data[address];
				slave_select = 0;
				end
			wait_state: 
				unique casez ({end_of_count, last_message, start})
					3'b0??: begin slave_select = 0;				end
					3'b100: begin slave_select = 0;	done = 1;	end
					3'b101: begin slave_select = 0;				end
					3'b11?: begin slave_select = 1; done = 1;	end
				endcase
		endcase
		end
end : fsm_outputs

endmodule : spi