----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:32:00 05/04/2018 
-- Design Name: 
-- Module Name:    alu16b - Behavioral 
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

entity alu16b is
	 generic(n : integer :=16);
    Port ( dr_input : in  STD_LOGIC_VECTOR (n-1 downto 0);
           func : in  STD_LOGIC_VECTOR (2 downto 0);
           ac_input : in  STD_LOGIC_VECTOR (n-1 downto 0);
           z : out  STD_LOGIC_VECTOR (n-1 downto 0);
           carry : out  STD_LOGIC);
end alu16b;

architecture structural of alu16b is

SIGNAL add : STD_Logic_vector (n downto 0);
SIGNAL sub : STD_Logic_vector (n downto 0);
SIGNAL temp_z : STD_Logic_vector (n-1 downto 0);

begin

	add <= ("0" & dr_input)+ ac_input;
	sub <= ("0" & dr_input)- ac_input;
	
	temp_z<= add(n-1 downto 0) when func="000" else
			 dr_input when func="001" else
			 dr_input AND ac_input when func="010" else
			 dr_input OR ac_input when func="011" else 
		 	 dr_input XOR ac_input when func="100" else 
		 	 NOT ac_input when func="101" else 
		 	 '0' & ac_input(n-1 downto 1) when func="110" else 
		 	 ac_input(n-2 downto 0) & '0' when func="111";	
			 
	z <= temp_z;

	carry <=add(n) when func="000" else
			 '0' when func="001" else
			 '0' when func="010" else
			 '0' when func="011" else 
		 	 '0' when func="100" else 
		 	 '0' when func="101" else 
		 	 '0' when func="110" else 
		 	 '0' when func="111";

end structural;

