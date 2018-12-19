----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:45:36 05/05/2018 
-- Design Name: 
-- Module Name:    test - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test is
	 generic(n : integer :=16);
    Port ( d : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  inc :in STD_LOGIC;
           ld_ : in  STD_LOGIC;
           nrst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (n-1 downto 0));
end test;

architecture Behavioral of test is
begin
process(nrst,clk,inc)
begin
	if nrst='0' then
		z <= (others => '0');
	elsif (inc='1')then
	   z<= d+'1';
	elsif (clk'event and clk='1') then
		if(ld_='1') then
			z <= d;
		end if;
	end if;
end process;

end Behavioral;

