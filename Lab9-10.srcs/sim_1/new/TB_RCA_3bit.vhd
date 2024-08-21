----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 01:49:07 PM
-- Design Name: 
-- Module Name: TB_RCA_3bit - Behavioral
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

entity TB_RCA_3bit is
--  Port ( );
end TB_RCA_3bit;

architecture Behavioral of TB_RCA_3bit is
component RCA_3bit
    Port (
    -- Input ports
    A_in : in STD_LOGIC_VECTOR (2 downto 0);
    -- Output ports
    S_out : out STD_LOGIC_VECTOR (2 downto 0);
    C_out : out STD_LOGIC
);
end component; 

signal C_out:std_logic; 
signal A_in,S_out :STD_LOGIC_VECTOR (2 downto 0);

begin
UUT:RCA_3bit
     port map( 
             A_in=>A_in,
             S_out=>S_out,
             C_out=>C_out
             );
 
 process
 begin
     A_in<="010"; 
     wait for 200ns;
     
     A_in<="110"; 
     wait for 200ns;
     
     A_in<="111"; 
     wait for 200ns;
     
     A_in<="000"; 
     wait for 200ns;
     
     A_in<="100"; 
     wait for 200ns;
 
   end process; 
 end Behavioral; 
