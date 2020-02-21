`timescale 1ns / 1ps

// This module implements reading from a block memory pairs of x and y values.
// After each reading of x and y, the GCD is computed using the gcd_calculator
// module, and then sent out over SPI, using the spi module. This is repeated 
// until a zero is read in the memory block.
module memory_reader(
	input logic clock,
	input logic reset
);

// Internal signals
logic enable, latest_is_zero, load_x, load_y, compute, gcd_ready, memory_out, memory_in, write_enable;
logic [7:0] data_x, data_y, gcd, gcd_result;
logic [4:0] address;

// Instantiate the block memory unit
blk_mem_ben_0 block_memory(
	.clka(clock),
	.ena(enable),
	.wea(write_enable),
	.addra(address),
	.dina(memory_in),
	.douta(memory_out)
);

// Instantiate the GCD Calculating unit
gcd_calculator gcd_calculator_instance(.*);

// Internal Wiring
assign memory_in = 0;	// No need to overwrite data
assign latest_is_zero = (memory_out == 0);
assign write_enable = 0;

// Finite State Machine Implementation
typedef enum logic [3:0] {reset_state, read_x, read_y, await_gcd, send_gcd} statetype;
statetype state;

always_ff @(posedge clock) begin
	if (reset) begin
		state <= reset_state;
		address <= 0;
		data_x <= 0;
		data_y <= 0;
		msb <= 0;
		end
	else begin
		case (state)
			reset_state: begin
				state <= read_x;
				address <= address + 1;	// Non-blocking update of address counter
				end
			read_x: begin
				if (~latest_is_zero) begin
					state <= read_y;
					address <= address + 1;
					end
				else	// If the latest value was a zero, return to the reset state
					state <= reset_state;
				end
			read_y: state <= await_gcd;
			await_gcd: state <= (gcd_ready ? send_gcd : await_gcd);
			send_gcd: begin
				if (~latest_is_zero) begin
					state <= read_x;
					end
				end
		endcase
		end
end

// Finite State Machine Output Implementation
always_comb begin
	enable = 0; load_x = 0; load_y = 0; compute = 0;
	if (~reset) begin
		case (state)
			reset_state: begin
				enable = 1;
				end
			read_x: begin
				enable = 1;
				load_x = 1;
				end
			read_y: begin
				load_y = 1;
				end
			await_gcd: begin
				if (~gcd_ready) begin
					compute = 1;
					end
				else begin
					grab_gcd = 1;
					end
				end
		endcase
	end
end

// Syncronous loading of the gcd register
always_ff @(posedge clock) begin
	if (reset)
		gcd <= 0;
	else begin
		if (grab_gcd)
			gcd <= gcd_result;
		end
end

endmodule : memory_reader