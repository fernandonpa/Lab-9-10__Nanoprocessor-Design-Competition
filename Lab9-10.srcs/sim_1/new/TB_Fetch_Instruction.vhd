----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 04:09:41 PM
-- Design Name: 
-- Module Name: TB_Fetch_Instruction - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Fetch_Instruction is
-- Port ( );
end TB_Fetch_Instruction;

architecture Behavioral of TB_Fetch_Instruction is

  -- Declaration of the Fetch_Instruction component
  component Fetch_Instruction
    Port ( clk : in STD_LOGIC;                      -- Clock input
           instruction : in STD_LOGIC_VECTOR (11 downto 0);  -- Input instruction
           operation : out STD_LOGIC_VECTOR (1 downto 0);     -- Output operation
           reg_A : out STD_LOGIC_VECTOR (2 downto 0);         -- Output reg_A
           reg_B : out STD_LOGIC_VECTOR (2 downto 0);         -- Output reg_B
           imm_val : out STD_LOGIC_VECTOR (3 downto 0));     -- Output immediate value
  end component;

  -- Signals declaration
  signal clk:std_logic:='0'; 
  signal instruction:std_logic_vector(11 downto 0);
  signal operation:std_logic_vector(1 downto 0);
  signal reg_A,reg_B:std_logic_vector(2 downto 0);
  signal imm_val:std_logic_vector(3 downto 0);

begin

  -- Instantiate the Fetch_Instruction component
  UUT: Fetch_Instruction
    port map(
      clk => clk,
      instruction => instruction,
      operation => operation,
      reg_A => reg_A,
      reg_B => reg_B,
      imm_val => imm_val
    );

  -- Clock generation process
  process
  begin
    wait for 15ns;
    clk <= not clk;
  end process;

  -- Stimulus process to apply instructions sequentially
  process
  begin
    instruction <= "100000000010"; -- MOVI R0,2
    wait for 60ns;
    
    instruction <= "100010000111"; -- MOVI R1,7
    wait for 60ns;
    
    instruction <= "000010000000"; -- ADD R1,R0
    wait for 60ns;
    
    instruction <= "111110000001"; -- JZR R7,1
    wait;  -- Wait indefinitely
  end process;

end Behavioral;