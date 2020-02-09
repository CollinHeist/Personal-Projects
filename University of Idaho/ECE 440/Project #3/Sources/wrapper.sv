`timescale 1ns / 1ps

module wrapper(
	input logic clock,
	input logic [1:0] buttons,
	input logic [3:0] switches,
	output logic [3:0] leds
);

// Internal signals
logic reset, load, done;
logic internal_load, reset_debounce, load_debounce;
logic [7:0] x, y, data, gcd_result;

// Synthesis ONLY
assign reset = reset_debounce;
assign internal_load = load_debounce;

// Simulation ONLY
//assign reset = buttons[0];
//assign internal_load = buttons[1];

// Instantiate our modules
debounce debounce_inst(
	.clock(clock),
	.reset_button(buttons[0]),
	.load_button(buttons[1]),
	.reset_debounce(reset_debounce),
	.load_debounce(load_debounce)
);

gcd_core gcd_core_inst(.*);

// Implementation for the Input Loading
typedef enum logic [2:0] {x_msb, x_lsb, y_msb, y_lsb, send_load, send_x, send_y} statetype;
statetype state;

always_ff @(posedge clock) begin
	if (reset) begin	// On debounced-resets go to x_msb state
		state <= x_msb;
		load = 0;
		end
	else if (internal_load)	begin	// When load is asserted, update x, y registers
		case (state)
			x_msb: begin
				state <= x_lsb;
				x <= {switches, 4'b0000};
				end
			x_lsb: begin
				state <= y_msb;
				x <= {x[7:4], switches};
				end
			y_msb: begin
				state <= y_lsb;
				y <= {switches, 4'b0000};
				end
			y_lsb: begin
				state <= send_load;
				y <= {y[7:4], switches};
				end
        endcase
        end
    // So long as reset isn't being asserted, advance FSM if beyond send_load state
	if (~reset) begin
	   case (state)
	       send_load: begin
	           state <= send_x;
               load <= 1;
               end
            send_x: begin
                state <= send_y;
                load <= 0;
                data <= x;
                end
            send_y: begin
                state <= x_msb;
                data <= y;
                end
       endcase
	end
end

// Implementation of the output logic
always_comb begin
	leds = 4'b0000;
	if (done) begin
		if (~switches[1])
			leds = 4'b0001;
		else
			if (~switches[0])
				leds = gcd_result[3:0];
			else
				leds = gcd_result[7:4];
	end
end

endmodule