library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity alu is
    Port (rega     : in  std_logic_vector(3 downto 0);
          regb     : in  std_logic_vector(3 downto 0);
          controls : in  std_logic_vector(3 downto 0);
          alu_out  : out std_logic_vector(3 downto 0);
          ccr_out  : out std_logic_vector(3 downto 0));
end alu;

architecture Behavioral of alu is
signal signedAdd : std_logic_vector(3 downto 0);
signal carryVal  : std_logic_vector(4 downto 0);
begin
	case controls is
		when "0000" =>
			alu_out <= rega + regb;

			ccr_out(3) <= '0'; -- Non-negative, addition
			ccr_out(2) <= (not rega) and (not regb); -- Only true if all zeroes
						--'0' when rega = "0000" and regb = "0000" else '1';

			signedAdd  <= signed(rega) + signed(regb);
			ccr_out(1) <= signedAdd(3); -- Overflow of two signed values

			ccr_out(0) <= '1' when to_integer(unsigned(rega)) + to_integer(unsigned(regb)) > 15 else '0';
			carryVal   <= rega + regb;
			ccr_out(0) <= carryVal(4);
		when "0001" =>
			alu_out <= rega - regb;

			ccr_out(3) <= '0' when rega >= regb else '1';
			ccr_out(2) <= '1' when rega = regb else '0';
			ccr_out(1) <= '1' when to_integer(signed(rega)) - to_integer(signed(regb)) < 0 else '0';
			ccr_out(0) <= (regb(0) and not rega(0)) or (regb(1) and not rega(1)) or (regb(2) and not rega(2)) or (regb(3) and not rega(3));
		when "0010" =>
			alu_out    <= rega and regb;

			ccr_out(3) <= '0';
			ccr_out(2) <= (not rega) and (not regb);
			ccr_out(1) <= '0';
			ccr_out(0) <= '0';
		when "0011" =>
			alu_out    <= rega or regb;

			ccr_out(3) <= '0';
			ccr_out(2) <= (not rega) and (not regb);
			ccr_out(1) <= '0';
			ccr_out(0) <= '0';
		when "0100" =>
			alu_out    <= not(rega);

			ccr_out(3) <= not rega(3);
			ccr_out(2) <= '1' when rega = "1111" else '0';
			ccr_out(1) <= '0';
			ccr_out(0) <= '0';
		when "0101" =>
			alu_out    <= rega;

			ccr_out(3) <= '0';
			ccr_out(2) <= not rega(3)
			ccr_out(1) <= '0';
			ccr_out(0) <= '0';
	end case;
end Behavioral;

