----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:16:56 05/04/2018 
-- Design Name: 
-- Module Name:    mem4k - Behavioral 
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
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem4k is
    Port ( clk : in STD_LOGIC;
			  read_signal : in  STD_LOGIC;
           write_signal : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0);
			  nrst : in STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (11 downto 0));
end mem4k;

architecture Behavioral of mem4k is

subtype word is std_logic_vector(15 downto 0);
type memory is array (0 to 2**12) of word;
signal main_mem: memory;
--signal output: word;

begin

	process(clk,addr,nrst)
	variable physical_addr: natural range 0 to 2**12;
	begin	
		physical_addr := to_integer(UNSIGNED(addr));

		if(clk'event and clk='1')then
			if(nrst='0')then
			   for i in 0 to 2**12 loop
					if(i=1)then
						main_mem(physical_addr) <= "0000000000000001";
					elsif(i=2)then
						main_mem(physical_addr) <= "0000000000000010";
					else 
					main_mem(physical_addr) <= "0000000000000000";
					end if;
				end loop;
			elsif(write_signal='1')then
				main_mem(physical_addr)<= data_in;
			end if;
		end if;
		if(clk'event and clk='0')then
			if(read_signal='1')then
			data_out <= main_mem(physical_addr);
			end if;
		end if;
	end process;
end Behavioral;

