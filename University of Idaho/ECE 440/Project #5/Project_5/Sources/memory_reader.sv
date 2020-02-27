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
logic start, done;
logic [7:0] data;
spi #(626, 10) spi_instance(.*);	// 626x slower, requires 10-bits to count 

// Internal signals
logic latest_is_zero, load_x, load_y;
assign latest_is_zero = (memory_out == 0);

// Button Release Controls
logic start;
always_ff @(negedge reset)	// When the button is released, set the start flag
	start <= 1;

// FSM States
typedef enum logic [3:0] {reset_state, read_x, read_y, await_gcd, send_gcd} statetype;
statetype state;
 
// FSM Advancement Implementation
always_ff @(posedge clock) begin : fsm_advancement
	if (reset) begin
		state <= reset_state;
		address <= 0;
		start <= 0;
		end
	else begin
		case (state)
			reset_state: begin
				state <= (start ? read_x : reset_state);	// Advanced states on button releases
				address <= (start ? address + 1 : address);
				end
			read_x: begin
				if (latest_is_zero) begin
					state <= reset_state;
					address <= 0;
					end
				else begin
					state <= read_y;
					address <= address + 1;
					end
				end
			read_y:		state <= await_gcd;
			await_gcd:	state <= (gcd_ready ? send_gcd : await_gcd);
			send_gcd: begin
				if (~done)
					state <= send_gcd;
				else if (latest_is_zero) begin
					state <= reset_state;
				else begin
					state <= read_x;
					address <= address + 1;
					end
				end
		endcase
		end
end : fsm_advancement

// FSM Outputs
always_comb begin : fsm_outputs
	enable = 0; load_x = 0; load_y = 0; compute = 0; start = 0; finished = 0; data = 0;
	if (~reset) begin
		case (state)
			reset_state: enable = (start ? 1 : 0);
			read_x: begin
				if (latest_is_zero)
					finished = 1;
				else begin
					enable = 1;
					load_x = 1;
					end
				end
			read_y:
				load_y = 1;
			await_gcd: begin
				if (~gcd_ready)
					compute = 1;
				else begin
					start = 1;
					data = gcd_result;
					end
				end
			send_gcd: begin
				if (~done)
					data = gcd_result;
				else if (~latest_is_zero)
					enable = 1;
				else
					finished = 1;
				end
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