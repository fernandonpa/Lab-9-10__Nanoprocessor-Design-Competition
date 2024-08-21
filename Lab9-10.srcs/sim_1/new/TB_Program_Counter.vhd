----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 01:05:54 PM
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
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

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is
component Program_Counter
    Port ( clk : in STD_LOGIC; 
          reset : in STD_LOGIC; 
          d : in STD_LOGIC_VECTOR (2 downto 0);
          q : out STD_LOGIC_VECTOR (2 downto 0));
end component; 

signal res,clk:std_logic:='0';
signal d_temp,q_temp :STD_LOGIC_VECTOR (2 downto 0);
 

begin
UUT:Program_Counter
     port map( 
             clk=>clk,
             reset=>res,
             d=>d_temp,
             q=>q_temp);
process
begin
     wait for 20ns;
     clk<=not(clk);
end process; 

process
begin
    res<='1'; 
    wait for 20ns;
    d_temp<="010"; 
    wait for 100ns;
    d_temp<="110"; 
    wait for 100ns;
    
    res<='0'; 
    wait for 20ns;
    d_temp<="001"; 
    wait for 100ns;
    d_temp<="000"; 
    wait for 100ns;
    d_temp<="011"; 
    wait;
 end process;
end behavioral;