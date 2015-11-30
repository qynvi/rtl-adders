-- qynvi
-- 2/19/2011
-- RCAdder Testbench

library ieee;
use ieee.std_logic_1164.all;

entity testbench is
	generic (N: integer := 8);
end testbench;

architecture tb of testbench is
signal input1,input2,sum: std_logic_vector((N-1) downto 0);
signal c_in,c_out: std_logic := '0';

begin
	rcatb: entity work.rcadder port map (input1,input2,c_in,sum,c_out);

	tb: process

		begin

		input1 <= "01111000"; -- =120d
		wait;

		input2 <= "00000000"; -- =0d
		wait for 120 ns;
		input2 <= "00101000"; -- =40d
		wait for 140 ns;
		input2 <= "01011010";  -- =90d
		wait for 120 ns;
		input2 <= "01111000"; -- =120d
		wait for 120 ns;
		input2 <= "10010110"; -- =150d
		wait for 120 ns;
		input2 <= "10110100"; -- =180d
		wait for 120 ns;
		input2 <= "11010010"; -- =210d
		wait for 120 ns;

		c_in <= '0';
		wait for 200 ns;
		c_in <= '1';
		wait for 80 ns;
		c_in <= '0';
		wait;

		end process tb;

end;
