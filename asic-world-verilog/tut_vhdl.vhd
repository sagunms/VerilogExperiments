//VHDL AND and OR gates
library ieee;
use ieee.std_logic_1164.all;
entity gates is
	port( a,b: in std_logic;
		q,r: out std_logic);
end;

architecture implement of gates is
begin
	q <= a and b;
	r <= a or b;
end;

//D flipflop

library ieee;
use ieee.std_logic_1164.all;
entity d_flipflop is
	port( clk, d: in std_logic;
		q: out std_logic);
end;

architecture implement of d_flipflop is
begin
	process(clk)
		begin
			if clk'EVENT and clk='1'
			then
				q <=d;
			end if;
		end process;
end;
