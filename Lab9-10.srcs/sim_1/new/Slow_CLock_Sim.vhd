----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 05:12:26 PM
-- Design Name: 
-- Module Name: Slow_CLock_Sim - Behavioral
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

entity Slow_CLock_Sim is
--  Port ( );
end Slow_CLock_Sim;

architecture Behavioral of Slow_CLock_Sim is
component Slow_Clk
    Generic (max_count :integer:= 10);
    port( Clk_in : in STD_LOGIC;
          Clk_out : out STD_LOGIC);
end component;

signal Clk_Slow: STD_LOGIC;
signal Clk: STD_LOGIC :='0';

begin

process
    begin
        wait for 5ns;
        Clk <= NOT Clk;
    end process; 
    UUT :Slow_Clk
        port map (
            Clk_in => Clk,
            Clk_out => Clk_slow);


end Behavioral;
