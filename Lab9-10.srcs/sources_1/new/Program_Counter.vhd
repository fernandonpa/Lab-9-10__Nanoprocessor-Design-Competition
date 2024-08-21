----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 12:58:41 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
    Port (
        clk : in STD_LOGIC;          -- Input clock signal
        reset : in STD_LOGIC;        -- Input reset signal
        d : in STD_LOGIC_VECTOR (2 downto 0);  -- Input data signal
        q : out STD_LOGIC_VECTOR (2 downto 0)  -- Output data signal
    );
end Program_Counter;

architecture Behavioral of Program_Counter is
begin
    process (clk, reset)
    begin
        if (reset = '1') then               -- If reset signal is active high
            q <= "000";                     -- Reset the output to all zeros
        elsif (rising_edge(clk)) then       -- If rising edge of the clock
            q <= d;                         -- Update the output with input data
        end if;
    end process; 
end Behavioral;

