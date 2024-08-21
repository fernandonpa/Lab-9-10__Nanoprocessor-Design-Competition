----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 06:59:24 AM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);  -- Input data
           EN : in STD_LOGIC;        -- Enable signal
           Clk : in STD_LOGIC;       -- Clock signal
           reset : in STD_LOGIC;      -- Reset signal
           Q : out STD_LOGIC_VECTOR (3 downto 0));   -- Output data
end Reg;

architecture Behavioral of Reg is
begin
-- Process to control the register behavior
     process (Clk,reset,EN) begin
        if reset='1' then          -- Reset condition
            Q <= "0000";           -- Reset the output to zero
        elsif (falling_edge(Clk)) then   -- Check for falling edge of clock
           if EN ='1' then       -- Check if enable signal is high
                Q <= D;       -- Load input data into the register
           end if;
        end if;
     end process; 

end Behavioral;
