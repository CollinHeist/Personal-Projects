`timescale 1ns / 1ps

module weird_circuit(
	input logic start,
	input logic[7:0] inputA,
	output logic done,
	output logic[7:0] maxValue,
	input logic reset,
	input logic clock
);

// Internal Signals
logic [7:0] current_max;	// Register to hold current maximum of previous inputs
logic assert_done;			// 'Flag' to mark when done needs to be asserted for 1-clock

// Combinational Assignments
assign new_is_max = inputA > current_max;	// Whether or not to update current_max
assign maxValue = current_max;				// Tie current_max register to output maxValue

always_ff @(posedge clock) begin
	if (reset) begin
		current_max <= 0;
		assert_done <= 0;
		done <= 0;
		end
	else begin
		if (new_is_max & start)		// Update current maximum
			current_max <= inputA;	

		if (start)					// An input's been given, assert done after start goes low
			assert_done <= 1;
		else begin
			done <= assert_done;	// If a maximum exists and start isn't asserted, assert done
			assert_done <= 0;		// Done will stay high for a clock - then go low until next start
			end
		end
end

endmodule