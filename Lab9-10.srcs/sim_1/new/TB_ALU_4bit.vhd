----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 10:06:54 PM
-- Design Name: 
-- Module Name: TB_ALU_4bit - Behavioral
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

entity TB_ALU_4bit is
--  Port ( );
end TB_ALU_4bit;

architecture Behavioral of TB_ALU_4bit is
component ALU_4bit
    Port (
    a : in STD_LOGIC_VECTOR (3 downto 0);  -- Input operand A
    b : in STD_LOGIC_VECTOR (3 downto 0);  -- Input operand B
    sub_sel : in STD_LOGIC;                -- Subtraction selection signal
    result : out STD_LOGIC_VECTOR (3 downto 0);  -- Output result
    overflow : out STD_LOGIC;              -- Overflow flag
    zero : out STD_LOGIC;                  -- Zero flag
    negative : out STD_LOGIC               -- Negative flag
);
end component;

-- Declaration of signals for operand A, operand B, and result.
signal a,b,result: std_logic_vector (3 downto 0);
-- Declaration of signals for overflow, subtraction selection, zero, and negative flags.
signal overflow,sub_sel,zero,negative:std_logic;

begin
UUT: ALU_4bit
-- Instantiation of the ALU_4bit component.
    port map( 
            a=>a(3 downto 0), -- Input operand A
            b=>b(3 downto 0), -- Input operand B
            sub_sel=>sub_sel, -- Subtraction selection signal
            zero=>zero,      -- Zero flag
            result=>result(3 downto 0),  -- Output result
            overflow=>overflow,  -- Overflow flag
            negative=>negative   -- Negative flag
            ); 
process
-- Process for generating stimulus signals
     begin
        
        sub_sel <= '0';
        -- Initialize subtraction selection signal to perform addition operation.
        
        a <= "0110"; 
        b <= "1010";
        wait for 100ns;
        
        a <= "1001";
        b <= "1001";
        wait for 100ns;
        
        a <= "0011";
        b <= "0100";
        wait for 100ns;
        
        a <= "0101";
        b <= "1100";
        wait for 100ns;       
        
        sub_sel <= '1';
        -- Initialize subtraction selection signal to perform addition operation.
        
        a <= "0011";
        b <= "0011";
        wait for 100ns;
        
        a <= "1001";
        b <= "1001";
        wait for 100ns;
        
        a <= "0110";
        b <= "1010";
        wait;
  end process;
        
end Behavioral;
