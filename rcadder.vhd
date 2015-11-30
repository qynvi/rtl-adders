-- qynvi
-- 2/19/2011
-- Generic Ripple Carry Adder RTL

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.rcadder.all;

entity rcadder is
	generic (N: integer := 8);
	port(
		input1: in std_logic_vector((N-1) downto 0);
		input2: in std_logic_vector((N-1) downto 0);
		c_in: in std_logic;
		sum: out std_logic_vector((N-1) downto 0);
		c_out: out std_logic);
end rcadder;

architecture rca of rcadder is
	signal temp1: std_logic_vector((N-2) downto 0);
	signal temp2: std_logic_vector((N-2) downto 0);

	begin
		-- first instantiation of sum and carry
		s0: fulladder port map (input1(0),input2(0),c_in,sum(0),temp1(0));
		c0: cc port map (temp1(0),temp2(0));

		sI: for i in 1 to (N-2) generate
				s: fulladder port map (input1(i),input2(i),temp2(i-1),sum(i),temp1(i));
				c: cc port map (temp1(i),temp2(i));
			end generate;

		-- final instantiation of sum and carry
		sF: fulladder port map (input1(N-1),input2(N-1),temp2(N-2),sum(N-1),c_out);

end rca;
