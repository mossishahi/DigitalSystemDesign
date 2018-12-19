----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:08:05 05/04/2018 
-- Design Name: 
-- Module Name:    top_module - Behavioral 
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

entity top_module is
    Port ( clock : in  STD_LOGIC;
		   main_instruction : in  STD_LOGIC_VECTOR (15 downto 0);
           final_output : out  STD_LOGIC_VECTOR (15 downto 0));
end top_module;

architecture structural of top_module is

component alu16b
	generic(n : integer :=16);
    Port ( dr_input : in  STD_LOGIC_VECTOR (n-1 downto 0);
           func : in  STD_LOGIC_VECTOR(2 downto 0);
           ac_input : in  STD_LOGIC_VECTOR (n-1 downto 0);
           z : out  STD_LOGIC_VECTOR (n-1 downto 0);
           carry : out  STD_LOGIC);
end component;
			  
component reg16b 
	 generic(n : integer :=16);
    Port ( d : in  STD_LOGIC_VECTOR (n-1 downto 0);
		   inc :in STD_LOGIC;
           register_ld : in  STD_LOGIC;
           nrst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component mem4k 
    Port ( clk : in STD_LOGIC;
		read_signal : in  STD_LOGIC;
           write_signal : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0);
		   nrst : in STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (11 downto 0));
end component;

component controller_unit
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
           regs_nrst : out  STD_LOGIC_VECTOR (7 downto 0));
end component;


signal data_bus :std_logic_vector(15 downto 0);

signal addr_bus :std_logic_vector(11 downto 0);
signal mem_addr:std_logic_vector(11 downto 0);

signal AR_out:std_logic_vector(11 downto 0);
signal PC_out:std_logic_vector(11 downto 0);
signal OUTR_out :std_logic_vector(15 downto 0);
signal TR_out :std_logic_vector(15 downto 0);
signal IR_out :std_logic_vector(15 downto 0);
signal INPR_out :std_logic_vector(15 downto 0);
signal AC_out :std_logic_vector(15 downto 0);
signal DR_out :std_logic_vector(15 downto 0);
signal mem_out :std_logic_vector(15 downto 0);



signal ac_alu:std_logic_vector(15 downto 0);
signal dr_alu:std_logic_vector(15 downto 0);
signal alu_out:std_logic_vector(15 downto 0);
signal regs_ld:std_logic_vector(7 downto 0);
signal cpu_ready :std_logic ;
Signal bus_select :std_logic_vector(3 downto 0);
signal alu_function :std_logic_vector(2 downto 0);
signal alu_read:std_logic;
signal alu_write:std_logic;
signal mem_read:std_logic;
signal mem_write:std_logic;
signal pc_increment:std_logic;
signal registers_nrst:std_logic_vector(7 downto 0);
signal registers_load:std_logic_vector(7 downto 0);
signal e_carry:std_logic;

signal instruction_temp : STD_LOGIC_VECTOR (15 downto 0) ; --:= "0000000000000000";
signal mem_nrst:STD_LOGIC;


begin
	mem_nrst <= main_instruction(15);
	AR_out <= mem_addr;
	
	PC: reg16b generic map (n => 12) Port Map (d => PC_out, inc => pc_increment, register_ld => registers_load(0), nrst => registers_nrst(0), clk => clock, z => PC_out);
	AR: reg16b generic map (n => 12) Port Map (d => AR_out, inc => '0', register_ld => registers_load(1), nrst => registers_nrst(1), clk => clock, z => AR_out);	
	OUTR: reg16b generic map (n => 16) Port Map (d => data_bus, inc => '0', register_ld => registers_load(2), nrst => registers_nrst(2), clk => clock, z => OUTR_out);
	TR: reg16b generic map (n => 16) Port Map (d => data_bus, inc => '0', register_ld => registers_load(3), nrst => registers_nrst(3), clk => clock, z => TR_out);
	IR: reg16b generic map (n => 16) Port Map (d => data_bus, inc => '0', register_ld => registers_load(4), nrst => registers_nrst(4), clk => clock, z => IR_out);
	INPR: reg16b generic map (n => 16) Port Map (d => data_bus, inc => '0', register_ld => registers_load(5), nrst => registers_nrst(5), clk => clock, z => INPR_out);
	AC: reg16b generic map (n => 16) Port Map (d => alu_out, inc => '0', register_ld => registers_load(6), nrst => registers_nrst(6), clk => clock, z => AC_out);
	DR: reg16b generic map (n => 16) Port Map (d => data_bus, inc => '0', register_ld => registers_load(7), nrst => registers_nrst(7), clk => clock, z => DR_out);
	
	controller: controller_unit port map (instruction => instruction_temp,clk => clock, ready => cpu_ready,
											bus_sel => bus_select, alu_func => alu_function, alu_r => alu_read,
											alu_w => alu_write, mem_r => mem_read, mem_w => mem_write,
											pc_inc => pc_increment, regs_ld => registers_load, regs_nrst => registers_nrst);
														
	
	memory: mem4k port map (clk => clock, read_signal => mem_read, write_signal => mem_write, data_in => data_bus, data_out => mem_out ,nrst => mem_nrst, addr => mem_addr);
	alu: alu16b generic map (n=> 16) port map (dr_input => DR_out, func => alu_function,  ac_input => AC_out, z => alu_out, carry => e_carry);
	
	process(clock)
	begin
	if(clock'event and clock='1')then
		if(cpu_ready='1')then
			instruction_temp <= main_instruction;
		end if;
	end if;
	end process;
	
	process(clock,bus_select)
	begin
	
	if(bus_select="0010")then
		data_bus <= OUTR_out;
	elsif(bus_select="0110")then
		data_bus <= TR_out;
	elsif(bus_select="0100")then
		data_bus <= IR_out;
	elsif(bus_select="0101")then
		data_bus <= INPR_out;
	elsif(bus_select="0110")then
		data_bus <= AC_out;
	elsif(bus_select="0111")then
		data_bus <= DR_out;
	elsif(bus_select="1000")then
		data_bus <= mem_out;
	end if;
	end process;

	process(clock)
	begin
	if(bus_select="0000")then
		addr_bus <= PC_out;
	elsif(bus_select="0001")then
		addr_bus <= AR_out;
	end if;
		end process;

end structural;

