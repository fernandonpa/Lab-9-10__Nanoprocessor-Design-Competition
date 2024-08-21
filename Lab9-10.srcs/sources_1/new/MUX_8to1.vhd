----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 11:50:15 AM
-- Design Name: 
-- Module Name: MUX_8to1 - Behavioral
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

entity MUX_8to1 is
    Port ( d : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           y  : out STD_LOGIC);
end MUX_8to1;

architecture mux_arch of MUX_8to1 is
begin
process (d,sel)
    begin

    case sel is
        when "000" => y <= d(0);
        when "001" => y <= d(1);
        when "010" => y <= d(2);
        when "011" => y <= d(3);
        when "100" => y <= d(4);
        when "101" => y <= d(5);
        when "110" => y <= d(6);
        when "111" => y <= d(7);
        when others => y <= '0';
    end case;
end process; 
end mux_arch;

