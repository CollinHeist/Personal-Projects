`timescale 1ns / 1ps

module codon_reader(clock, reset, codon_index, done_reader, codon1, codon2, codon3, codon4, codon5, end_of_codon)
	input logic clock, reset, codon_index;
	output logic done_reader;
	output logic [3:0] codon1, codon2, codon3, codon4, codon5;
	output logic [4:0] end_of_codon;

// Instantiate the codon memory unit
logic enable, write_enable, is_F;
logic [3:0] memory_in, memory_out;
logic [4:0] address					// 32 addressable locations
assign enable = 1;					// Always reading
assign write_enable = 0;			// Never writing
assign memory_in = 0;				// Never writing
assign is_F = (memory_out == 4'hF);	// Flag for if an 0xF has been detected


// Codon Register - End-of-codon detection - Codon Sub Addressing
logic [3:0] codons[4:0][5:0];	// 4-bit wide units, [codon_num][codon_sub_addr]
assign codon1 = codons[0][codon_index]
assign codon2 = codons[1][codon_index]
assign codon3 = codons[2][codon_index]
assign codon4 = codons[3][codon_index]
assign codon5 = codons[4][codon_index]
assign end_of_codon[0] = (codons[0][codon_index + 1] == 4'hF)	// Check if next codon value is 0xF
assign end_of_codon[1] = (codons[1][codon_index + 1] == 4'hF)
assign end_of_codon[2] = (codons[2][codon_index + 1] == 4'hF)
assign end_of_codon[3] = (codons[3][codon_index + 1] == 4'hF)
assign end_of_codon[4] = (codons[4][codon_index + 1] == 4'hF)

logic [3:0] codon_sub_addr;	// Which 4-bit nibble is being loaded
logic load_codon;			// Whether or not to load the codon register

// FSM States
typedef enum logic [1:0] {reset_state, read_codon, check_next, codons_done} statetype;
statetype state;

// FSM Advancement
always_ff @(posedge clock) begin : fsm_advancement
	if (reset) begin
		state <= reset_state;	// Go to reset state
		address <= 0;			// Reset address
		codon_sub_addr <= 0;	// Reset nibble number
	else begin
		case (state)
			reset_state: begin
				state <= read_codon;
				address <= address + 1;
				end
			read_codon: begin
				address <= address + 1;
				unique case (is_F)
					1'b0: begin state <= check_next; codon_num <= codon_num + 1; codon_sub_addr <= 0;	end
					1'b1: begin state <= read_codon; codon_sub_addr <= codon_sub_addr + 1;				end 
				endcase
				end
			check_next:
				unique case (is_F)
					1'b0: begin state <= read_codon; address <= address + 1; codon_sub_addr <= codon_sub_addr + 1;	end
					1'b1: begin state <= codons_done;																end
				endcase
			codons_done:
				state <= codons_done;
		endcase
		end
end : fsm_advancement

// FSM Outputs
always_comb begin : fsm_outputs
	load_codon = 0; done_reader = 0;
	if (~reset) begin
		case (state)
			reset_state:	load_codon = 1;
			read_codon:		load_codon = ~is_F;
			check_next:		load_codon = 1;
			codons_done:	done_reader = 1;
			endcase
		end
end : fsm_outputs

// Codon Loading
always_ff @(posedge clock) begin : codon_loader
	if (reset)
		codons <= '{default:1};	// Codons should default to 0xF
	else
		if (load_codon)
			codons[codon_num][codon_sub_addr] = memory_out;
end : codon_loader

endmodule : codon_reader