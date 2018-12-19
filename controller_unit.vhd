----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:00:37 05/04/2018 
-- Design Name: 
-- Module Name:    controller_unit - Behavioral 
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
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller_unit is
    Port ( instruction : in  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;
           ready : out  STD_LOGIC;
           bus_sel : out  STD_LOGIC_VECTOR (3 downto 0); -- we need 4 bit because of existance of 8 Reg and MEMORY
           alu_func : out  STD_LOGIC_VECTOR (2 downto 0);
           alu_r : out  STD_LOGIC;
           alu_w : out  STD_LOGIC;
			  mem_r : out  STD_LOGIC;
           mem_w : out  STD_LOGIC;
			  pc_inc :out STD_LOGIC;
			  regs_ld : out  STD_LOGIC_VECTOR (7 downto 0);
			  memory_reset : out STD_LOGIC;
           regs_nrst : out  STD_LOGIC_VECTOR (7 downto 0));
end controller_unit;

architecture Behavioral of controller_unit is

signal opcode:std_logic_vector(2 downto 0);
signal addr:std_logic_vector(11 downto 0);

signal state_counter: std_logic_vector(2 downto 0);


begin



process (clk,instruction)
begin
		ready <= '1';
		opcode <= instruction(14 downto 12);
		addr <= instruction(11  downto 0);
		state_counter <= "000";
		ready <='0';
	case state_counter is
	when "000" =>  ---  AR <-- PC
			bus_sel <= "0000"; -- bus is connected to pc
			regs_ld <= "00000010"; -- AR load =1
			regs_nrst <= "11111111";
			alu_func<="000";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= state_counter + '1';
	when "001" => -- PC <-- PC + 1 ----------IR <-- M[AR] -----------
			pc_inc <='1'; --to increment PC
			bus_sel <= "1000"; -- bus is connected to Mem
			regs_ld <= "00010000"; -- IR load =1
			regs_nrst <= "11111111";
			alu_func<="000";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= state_counter + '1';
	when "010" => ---- AR <-- IR[11:0], OPCODE <-- IR[14:12]
			pc_inc <='0'; 
			bus_sel <= "0100"; -- bus is connected to IR
			regs_ld <= "00000000"; -- AR load =1
			regs_nrst <= "11111111";
			alu_func<="000";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			opcode <= instruction(14 downto 12); -- SET OPCODE
			addr <= instruction(11  downto 0);
			state_counter <= state_counter + '1';
			
	when "011" => -- execution cycle 1
		if(instruction(15)='0') then
		if(opcode="000") then --ADD : DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "1000"; -- bus is connected to Mem
			regs_ld <= "10000000"; -- DR load =1
			regs_nrst <= "11111111";
			alu_func<="000";
			alu_r<='0';
			alu_w<='0';
			mem_r<='1';
			mem_w<='0';
			state_counter <= state_counter + '1';

		elsif(opcode="001") then --LDA : DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "1000"; -- bus is connected to Mem
			regs_ld <= "10000000"; -- DR load =1
			regs_nrst <= "11111111";
			alu_func<="001";
			alu_r<='0';
			alu_w<='0';
			mem_r<='1';
			mem_w<='0';
			state_counter <= state_counter + '1';

		elsif(opcode="010") then --AND :DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "1000"; -- bus is connected to Mem
			regs_ld <= "10000000"; -- DR load =1
			regs_nrst <= "11111111";
			alu_func<="010";
			alu_r<='0';
			alu_w<='0';
			mem_r<='1';
			mem_w<='0';
			state_counter <= state_counter + '1';

		elsif(opcode="011") then --OR :DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "0100"; -- bus is connected to IR
			regs_ld <= "00000000"; -- AR load =1
			regs_nrst <= "11111111";
			alu_func<="011";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
			ready <='1';
		elsif(opcode="010") then --XOR :DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "0100"; -- bus is connected to IR
			regs_ld <= "00000000"; -- AR load =1
			regs_nrst <= "11111111";
			alu_func<="000";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
		elsif(opcode="101") then --NOT : AC ic automatically connected to ALU - only determine its function
			pc_inc <='0'; 
			bus_sel <= "0100"; -- bus is connected to IR
			regs_ld <= "01000000"; -- AC load =1
			regs_nrst <= "11111111";
			alu_func<="101";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
		elsif(opcode="110") then --SHR : AC ic automatically connected to ALU - only determine its function
			pc_inc <='0'; 
			bus_sel <= "0000"; 
			regs_ld <= "01000000"; -- AC load =1
			regs_nrst <= "11111111";
			alu_func<="110";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
		elsif(opcode="111") then --SHL : AC ic automatically connected to ALU - only determine its function
		   pc_inc <='0'; 
			bus_sel <= "0000"; 
			regs_ld <= "01000000"; -- AC load =1
			regs_nrst <= "11111111";
			alu_func<="111";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
		end if;

		elsif(instruction(15)='1') then
		
			if(opcode="000") then --LDA : DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "1000"; -- bus is connected to Mem
			regs_ld <= "10000000"; -- DR load =1
			regs_nrst <= "11111111";
			alu_func<="000";
			alu_r<='0';
			alu_w<='0';
			mem_r<='1';
			mem_w<='0';
			state_counter <= state_counter + '1';

		elsif(opcode="001") then --STA : M[AR] <-- AC
			pc_inc <='0'; 
			bus_sel <= "0101"; -- bus is connected to AC
			regs_ld <= "10000000"; -- DR load =1
			regs_nrst <= "11111111";
			alu_func<="010";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='1';
			state_counter <= state_counter + '1';

		elsif(opcode="010") then --BUN :PC <-- AR 
			pc_inc <='0'; 
			bus_sel <= "0000"; -- bus is connected to AR
			regs_ld <= "00000010"; -- PC load =1
			regs_nrst <= "11111111";
			alu_func<="011";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
			ready <='1';
		elsif(opcode="011") then -- BSA : M[AR] <-- PC
			pc_inc <='0'; 
			bus_sel <= "0001"; -- bus is connected to PC
			regs_ld <= "00000000"; -- AR load =1
			regs_nrst <= "11111111";
			alu_func<="000";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
		elsif(opcode="101") then --SZA 
			pc_inc <='1'; 
			bus_sel <= "0100"; 
			regs_ld <= "01000000"; 
			regs_nrst <= "11111111";
			alu_func<="101";
			alu_r<='0';
			alu_w<='0';
			mem_r<='1';
			mem_w<='0';
			state_counter <= "000";
		elsif(opcode="110") then --SZE 
			pc_inc <='1'; 
			bus_sel <= "0000"; 
			regs_ld <= "01000000"; -- AC load =1
			regs_nrst <= "11111111";
			alu_func<="110";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
		end if;
		end if ;
		
	when "100" => -- execution cycle 2
	if(instruction(15)='0') then
		if(opcode="000") then --ADD : DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "1000"; -- bus is connected to Mem
			regs_ld <= "01000000"; -- AC load =1
			regs_nrst <= "11111111";
			alu_func<="000";
			alu_r<='0';
			alu_w<='0';
			mem_r<='1';
			mem_w<='0';
			state_counter <= "000";

		elsif(opcode="001") then --LDA : DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "0000"; -- bus is connected to Mem
			regs_ld <= "01000000"; -- AC load =1
			regs_nrst <= "11111111";
			alu_func<="001";
			alu_r<='0';
			alu_w<='0';
			mem_r<='1';
			mem_w<='0';
			state_counter <= "000";
			
		elsif(opcode="010") then --AND :DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "1000"; -- bus is connected to Mem
			regs_ld <= "01000000"; -- AC load =1
			regs_nrst <= "11111111";
			alu_func<="010";
			alu_r<='0';
			alu_w<='0';
			mem_r<='1';
			mem_w<='0';
			state_counter <= "000";
			
		elsif(opcode="011") then --OR :DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "0100"; -- bus is connected to IR
			regs_ld <= "01000000"; -- AC load =1
			regs_nrst <= "11111111";
			alu_func<="011";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
			
		elsif(opcode="010") then --XOR :DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "0100"; -- bus is connected to IR
			regs_ld <= "01000000"; -- AC load =1
			regs_nrst <= "11111111";
			alu_func<="010";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
		end if;

		elsif(instruction(15)='1') then
			if(opcode="000") then --LDA : DR <-- M[AR]
			pc_inc <='0'; 
			bus_sel <= "1000"; -- bus is connected to Mem
			regs_ld <= "10000000"; -- DR load =1
			regs_nrst <= "11111111";
			alu_func<="000";
			alu_r<='0';
			alu_w<='0';
			mem_r<='1';
			mem_w<='0';
			state_counter <= state_counter + '1';

		elsif(opcode="001") then --STA : M[AR] <-- AC
			pc_inc <='0'; 
			bus_sel <= "0101"; -- bus is connected to AC
			regs_ld <= "10000000"; -- DR load =1
			regs_nrst <= "11111111";
			alu_func<="010";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='1';
			state_counter <= state_counter + '1';

		elsif(opcode="010") then --BUN :PC <-- AR 
			pc_inc <='0'; 
			bus_sel <= "0000"; -- bus is connected to AR
			regs_ld <= "00000010"; -- PC load =1
			regs_nrst <= "11111111";
			alu_func<="011";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
			ready <='1';
		elsif(opcode="011") then -- BSA : M[AR] <-- PC
			pc_inc <='0'; 
			bus_sel <= "0001"; -- bus is connected to AR
			regs_ld <= "00000010"; -- PC load =1
			regs_nrst <= "11111111";
			alu_func<="000";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
			state_counter <= "000";
		end if;
		
		end if;
		when others => 
			bus_sel <= "0000"; -- bus is connected to pc
			regs_ld <= "00000010"; -- AR load =1
			regs_nrst <= "11111111";
			alu_func<="000";
			alu_r<='0';
			alu_w<='0';
			mem_r<='0';
			mem_w<='0';
	end case;
	end if;
end process;


end Behavioral;

