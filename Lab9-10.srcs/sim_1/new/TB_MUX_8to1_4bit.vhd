----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 02:19:22 PM
-- Design Name: 
-- Module Name: TB_MUX_8to1_4bit - Behavioral
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

entity TB_MUX_8to1_4bit is
--  Port ( );
end TB_MUX_8to1_4bit;

architecture Behavioral of TB_MUX_8to1_4bit is
component MUX_8to1_4bit
     Port (  r0 : in STD_LOGIC_VECTOR (3 downto 0);
             r1 : in STD_LOGIC_VECTOR (3 downto 0);
             r2 : in STD_LOGIC_VECTOR (3 downto 0);
             r3 : in STD_LOGIC_VECTOR (3 downto 0);
             r4 : in STD_LOGIC_VECTOR (3 downto 0);
             r5 : in STD_LOGIC_VECTOR (3 downto 0);
             r6 : in STD_LOGIC_VECTOR (3 downto 0);
             r7 : in STD_LOGIC_VECTOR (3 downto 0);
             sel : in STD_LOGIC_VECTOR (2 downto 0);
             y : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

signal r0,r1,r2,r3,r4,r5,r6,r7 : std_logic_vector(3 downto 0);
signal sel : std_logic_vector(2 downto 0);
signal y : std_logic_vector(3 downto 0);

begin
UUT: MUX_8to1_4bit
    port map ( 
         r0 => r0,
         r1 => r1,
         r2 => r2,
         r3 => r3,
         r4 => r4,
         r5 => r5,
         r6 => r6,
         r7 => r7,
         sel => sel,
         y => y 
         );

process
begin
      r0 <= "0001"; 
      r1 <= "0010"; 
      r2 <= "0011"; 
      r3 <= "0110"; 
      r4 <= "1011"; 
      r5 <= "0000"; 
      r6 <= "1111"; 
      r7 <= "1100"; 
  
      sel <= "011"; 
      wait for 100 ns;
      sel <= "101"; 
      wait for 100 ns;
      sel <= "010"; 
      wait for 100 ns;
      sel <= "100"; 
      wait for 100 ns;
      sel <= "000"; 
      wait for 100 ns;
      sel <= "111"; 
      wait; 
 end process; 
 
end Behavioral;
