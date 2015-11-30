-- qynvi
-- 2/19/2011
-- Generic Signed Adder RTL

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder is
	port (a,b: in std_logic_vector(7 downto 0);
		  sum: out std_logic_vector(7 downto 0);
		  co: out std_logic);
end Adder;

architecture sAdder of Adder is
	signal a_sig,b_sig,sum_sig: signed(8 downto 0);
	signal carry_out: unsigned(0 downto 0);
	begin
		a_sig <= signed("0" & a);
		b_sig <= signed("0" & b);
		sum_sig <= a_sig + b_sig;
		sum <= std_logic_vector(sum_sig(7 downto 0));
		co <= std_logic(sum_sig(8));
end sAdder;
