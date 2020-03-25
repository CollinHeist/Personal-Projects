`timescale 1ns / 1ps

module codon_counter(clock, reset, done_reader, count_index, codon1, codon2, codon3, codon4, codon5, end_of_codon, done_counter, codon_index, codon_count);
	input logic clock, reset, done_reader;
	input logic [2:0] count_index;								// Which codon count to output [1->5]
	input logic [3:0] codon1, codon2, codon3, codon4, codon5;	// Current nibble of codon 1 to 5
	input logic [4:0] end_of_codon;								// Encoding of which codon we're on the last nibble of
	output logic done_counter;									// Whether the counter module is done
	output logic [2:0] codon_index;								// Which nibble to address of all the codons
	output logic [3:0] codon_count;								// Count of the current codon selected by count_index

// Instantiate the genome memory unit
logic enable, write_enable, is_F;
logic [3:0] memory_in, memory_out;
logic [7:0] address;
assign enable = 1;					// Always reading
assign write_enable = 0;			// Never writing
assign memory_in = 0;				// Never writing
assign is_F = (memory_out == 4'hF);	// Flag for if an 0xF has been detected
gene_memory gene_memory_instance (
  .clka(clock),			// input wire clka
  .ena(enable),			// input wire ena
  .wea(write_enable),	// input wire [0 : 0] wea
  .addra(address),		// input wire [7 : 0] addra
  .dina(memory_in),		// input wire [3 : 0] dina
  .douta(memory_out)	// output wire [3 : 0] douta
);

// All Codon counts register and output assignment
logic [4:0][3:0] counts;					// Access with counts[codon_number]
assign codon_count = counts[count_index];	// Assign the output count

// Codon Match-detection
logic [4:0] previous_matches, current_matches, detected_codons;
logic ending_match, concurrent_matches, matches_any;
always_comb begin : codon_match_detection
	current_matches[0] = ((memory_out == codon1) && (codon1 != 4'hF));	// Whether each codon matches the current output
	current_matches[1] = ((memory_out == codon2) && (codon2 != 4'hF));
	current_matches[2] = ((memory_out == codon3) && (codon3 != 4'hF));
	current_matches[3] = ((memory_out == codon4) && (codon4 != 4'hF));
	current_matches[4] = ((memory_out == codon5) && (codon5 != 4'hF));

	ending_match = | (current_matches & end_of_codon);				// T/F if a match occurred on the last of a codon
	concurrent_matches = | (current_matches & previous_matches);	// T/F if two same-place sequential matches occurred
	matches_any = | current_matches;								// T/F if any matches occurred

	detected_codons = (current_matches & previous_matches & end_of_codon);	// 5-Bit field that denotes a completed codon detection
end : codon_match_detection

// FSM States
typedef enum logic [2:0] {reset_state, wait_state, read_DNA, one_F, done_state} statetype;
statetype state;
logic await_new_read;

// FSM Advancement
always_ff @(posedge clock) begin : fsm_advancement
	if (reset) begin
		state <= reset_state;			// Go to reset state
		address <= 0;					// Reset memory address
		counts <= 0;					// Reset array of all codon counts
		previous_matches <= 5'b11111;	// Previous matches are default one so immediate end-matches are okay
		codon_index <= 3'b000;
		await_new_read <= 0;
		end
	else begin
		case (state) 
			reset_state:
				state <= wait_state;
			wait_state:
				unique casez({is_F, done_reader})
					2'b?0: begin state <= wait_state;						end
					2'b11: begin state <= one_F; address <= address + 1;	end
					2'b01: begin state <= read_DNA;							end
				endcase
			read_DNA: begin
				await_new_read <= ~await_new_read;
				if (~await_new_read) begin
					address <= address + 1;
					unique casez({is_F, matches_any, concurrent_matches, ending_match, detected_codons})
						9'b1????????: begin state <= one_F; address <= address + 1; codon_index <= 3'b000; previous_matches <= 5'b11111;										end // 0xF output from memory
						9'b00???????: begin state <= read_DNA; address <= (codon_index == 3'b000 ? address + 1 : address); codon_index <= 3'b000; previous_matches <= 5'b11111;	end	// No matches whatsoever
						9'b010??????: begin state <= read_DNA; codon_index <= 3'b000; previous_matches <= 5'b11111;																end	// Was a match, but not concurrently
						9'b0110?????: begin state <= read_DNA; address <= address + 1; codon_index <= codon_index + 1; previous_matches <= current_matches;						end	// Concurrent match, but not an end-of-codon one
						9'b01111????: begin state <= read_DNA; address <= address + 1; codon_index <= 3'b000; previous_matches <= 5'b11111; counts[4] <= counts[4] + 1;			end // End-of-codon match on codon5
						9'b011101???: begin state <= read_DNA; address <= address + 1; codon_index <= 3'b000; previous_matches <= 5'b11111; counts[3] <= counts[3] + 1;			end // End-of-codon match on codon4
						9'b0111001??: begin state <= read_DNA; address <= address + 1; codon_index <= 3'b000; previous_matches <= 5'b11111; counts[2] <= counts[2] + 1;			end // End-of-codon match on codon3
						9'b01110001?: begin state <= read_DNA; address <= address + 1; codon_index <= 3'b000; previous_matches <= 5'b11111; counts[1] <= counts[1] + 1;			end // End-of-codon match on codon2
						9'b011100001: begin state <= read_DNA; address <= address + 1; codon_index <= 3'b000; previous_matches <= 5'b11111; counts[0] <= counts[0] + 1;			end // End-of-codon match on codon1
					endcase
					end
				end
			one_F: begin
				await_new_read <= 0;
				unique casez({is_F, await_new_read})
					2'b?1: state <= one_F;
					2'b00: state <= read_DNA;
					2'b10: state <= done_state;
				endcase
				end
			done_state:
				state <= done_state;
		endcase
		end
end : fsm_advancement

// FSM Outputs
assign done_counter = (state == done_state);

endmodule : codon_counter