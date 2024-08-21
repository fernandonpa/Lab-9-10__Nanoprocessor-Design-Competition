----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 03:25:32 PM
-- Design Name: 
-- Module Name: TB_Program_ROM_1 - Behavioral
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

entity TB_Program_ROM_1 is
--  Port ( );
end TB_Program_ROM_1;

architecture Behavioral of TB_Program_ROM_1 is

component Program_ROM_1 
     port( 
            addr : in STD_LOGIC_VECTOR (2 downto 0);
            ROMSel : in STD_LOGIC;
            instruction : out STD_LOGIC_VECTOR (11 downto 0) 
            );
end component; 

Signal addr : STD_LOGIC_VECTOR(2 downto 0);
Signal ROMSel : STD_LOGIC;
Signal instruction : STD_LOGIC_VECTOR(11 downto 0);

begin
UUT : Program_ROM_1 
    port map( 
            addr => addr,
            ROMSel => ROMSel,
            instruction => instruction
            );

process 
begin
        ROMSel <= '0';
        addr <= "000"; 
        wait for 120ns;
         
        addr <= "001"; 
        wait for 120ns;
         
        addr <= "010"; 
        wait for 120ns;
         
        addr <= "011"; 
        wait for 120ns; 
        
        addr <= "100"; 
        wait for 120ns;
        
        addr<="101"; 
        Wait for 120ns;
        
        addr<="110"; 
        Wait for 120ns;
        
        addr<="111"; 
        wait; 
  end process; 
end Behavioral;