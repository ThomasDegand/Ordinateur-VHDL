library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity driver_clavier is port(
	clk : in std_logic;
	input : in std_logic_vector(3 downto 0);
	output : out std_logic_vector(3 downto 0);
	keys : out std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000");
end entity;

architecture one of driver_clavier is
	signal i : integer := 0;
begin
	process(clk)
	begin
		keys(i+0) <= input(0);
		keys(i+16) <= input(1);
		keys(i+32) <= input(2);
		keys(i+48) <= input(3);
		output <= conv_std_logic_vector(i, 4);
		if i < 15 then
			i <= i + 1;
		else
			i <= 0;
		end if;
	end process;
end architecture;
