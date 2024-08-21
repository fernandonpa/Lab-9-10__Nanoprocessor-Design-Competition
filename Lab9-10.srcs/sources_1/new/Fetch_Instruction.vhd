----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 03:55:21 PM
-- Design Name: 
-- Module Name: Fetch_Instruction - Behavioral
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

-- Entity declaration for Fetch_Instruction
entity Fetch_Instruction is
    Port ( clk : in STD_LOGIC;                    -- Clock input
           instruction : in STD_LOGIC_VECTOR (11 downto 0);  -- Input instruction
           operation : out STD_LOGIC_VECTOR (1 downto 0);     -- Output operation
           reg_A : out STD_LOGIC_VECTOR (2 downto 0);         -- Output reg_A
           reg_B : out STD_LOGIC_VECTOR (2 downto 0);         -- Output reg_B
           imm_val : out STD_LOGIC_VECTOR (3 downto 0));     -- Output immediate value
end Fetch_Instruction;

-- Architecture for Fetch_Instruction
architecture Behavioral of Fetch_Instruction is

begin
    -- Process to decode instruction on falling edge of clock
    process (clk)
    begin
        if (falling_edge (clk)) then            -- Check for falling edge of clock
            operation <= instruction (11 downto 10);   -- Extract operation from instruction
            reg_A <= instruction (9 downto 7);         -- Extract reg_A from instruction
            reg_B <= instruction (6 downto 4);         -- Extract reg_B from instruction
            imm_val <= instruction (3 downto 0);       -- Extract immediate value from instruction
        end if;  
    end process; 

end Behavioral;