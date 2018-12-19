-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
  COMPONENT top_module is 
  PORT( clock : in  STD_LOGIC;
		 main_instruction : in  STD_LOGIC_VECTOR (15 downto 0);
		 final_output : out  STD_LOGIC_VECTOR (15 downto 0));
  END COMPONENT;

  SIGNAL clk :  std_logic := '0';
  SIGNAL instruction :  std_logic_vector(15 downto 0):="0000000000000000";
  signal z :std_logic_vector(15 downto 0):="0000000000000000";
  
  constant CLK_PERIOD : time := 20 ns;

  BEGIN

  -- Component Instantiation
	 uut: top_module PORT MAP(
				clock => clk,
				main_instruction => instruction,
				final_output => z
	 );

   Clk_process :process
   begin
        clk <= '1';
        wait for CLK_PERIOD/2;  --for half of clock period clk stays at '0'.
        clk <= '0';
        wait for CLK_PERIOD/2;  --for next half of clock period clk stays at '1'.
   end process;
	
   instruction_proc :process
   begin
        instruction <= "0000000000000000";
        wait for 4*CLK_PERIOD;  
        instruction <= "1001000000000000";
        wait for 4*CLK_PERIOD;  
        instruction <= "1000000000000001";
        wait for 4*CLK_PERIOD;  
        instruction <= "1110000000000000";
        wait for 4*CLK_PERIOD;  
        instruction <= "1010000000000010";	
	end process;
  END;
