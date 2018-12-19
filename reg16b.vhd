----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:31:29 05/04/2018 
-- Design Name: 
-- Module Name:    reg16b - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg16b is
	 generic(n : integer);
    Port ( d : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  inc :in STD_LOGIC;
           register_ld : in  STD_LOGIC;
           nrst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (n-1 downto 0));
end reg16b;

architecture Behavioral of reg16b is
begin
process(nrst,clk,inc)
begin
	if nrst='0' then
		z <= (others => '0');
	elsif (inc='1')then
	   z<= d+'1';
	elsif (clk'event and clk='1') then
		if(register_ld='1') then
			z <= d;
		end if;
	end if;
end process;

end Behavioral;

