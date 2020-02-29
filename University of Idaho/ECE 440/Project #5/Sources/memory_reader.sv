`timescale 1ns / 1ps

module memory_reader(clock, reset, finished, mosi, slave_select, spi_clock);
	input logic clock, reset;
	output logic finished, mosi, slave_select, spi_clock;

// Instantiate the block memory unit
logic enable, write_enable;
logic [7:0] memory_in, memory_out;
logic [4:0] address;
assign memory_in = 0;		// No writing to the memory required
assign write_enable = 0;	// Never writing to block memory
blk_mem_gen_0 block_memory(
	.clka(clock),
	.ena(enable),
	.wea(write_enable),
	.addra(address),
	.dina(memory_in),
	.douta(memory_out)
);

// Instantiate the GCD Calculation unit
logic compute, gcd_ready;
logic [7:0] data_x, data_y, gcd_result;
gcd_calculator gcd_calculator_instance(.*);

// Instantiate the SPI Communications unit
logic start, done, last_message;
logic [7:0] data;
assign last_message = finished;
spi #(626, 10) spi_instance(.*);	// 626x slower, this requires 10-bits to count 

// Internal signals
logic latest_is_zero, load_x, load_y;
assign latest_is_zero = (memory_out == 0);

// FSM States
typedef enum logic [3:0] {reset_state, read_x, read_y, await_gcd, send_gcd} statetype;
statetype state;

// Button release-checking
logic button_prev;
always_ff @(posedge clock)
    button_prev <= reset;
 
// FSM Advancement Implementation
always_ff @(posedge clock) begin : fsm_advancement
	if (reset) begin
		state <= reset_state;
		address <= 0;
		end
	else begin
		case (state)
			reset_state: begin
				state <= ((button_prev & ~reset) ? read_x : reset_state);	// Advanced states on button releases
				address <= ((button_prev & ~reset) ? address + 1 : address);
				end
			read_x:
				unique case (latest_is_zero)
					1'b1: begin state <= reset_state; address <= 0;			end
					1'b0: begin state <= read_y; address <= address + 1;	end
				endcase
			read_y:		state <= await_gcd;
			await_gcd:	state <= (gcd_ready ? send_gcd : await_gcd);
			send_gcd: 
				unique casez ({done, latest_is_zero})
					2'b0?: begin state <= send_gcd;							end
					2'b10: begin state <= read_x; address <= address + 1;	end
					2'b11: begin state <= reset_state;						end
				endcase
		endcase
		end
end : fsm_advancement

// FSM Outputs
always_comb begin : fsm_outputs
	enable = 0; load_x = 0; load_y = 0; compute = 0; start = 0; finished = 0; data = 0;
	if (~reset) begin
		case (state)
			reset_state:
				enable = (button_prev ? 1 : 0);
			read_x: 
				unique case (latest_is_zero)
					1'b0: begin enable = 1; load_x = 1;	end
					1'b1: begin finished = 1;			end
				endcase
			read_y:
				load_y = 1;
			await_gcd:
				unique case (gcd_ready)
					1'b0: begin compute = 1;					end
					1'b1: begin start = 1; data = gcd_result;	end
				endcase
			send_gcd:
				unique casez ({done, latest_is_zero})
					2'b0?: data = gcd_result;
					2'b10: enable = 1; 
					2'b11: finished = 1;
				endcase
		endcase
	end
end : fsm_outputs

// Syncronous loading of the data_x, and data_y register
always_ff @(posedge clock) begin
	if (reset) begin
		data_x <= 0;
		data_y <= 0;
		end
	else begin
		if (load_x)		data_x <= memory_out;
		if (load_y)		data_y <= memory_out;
		end
end

endmodule : memory_reader