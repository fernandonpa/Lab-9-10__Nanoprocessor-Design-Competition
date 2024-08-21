----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 10:01:52 PM
-- Design Name: 
-- Module Name: Generic_MUX - Behavioral
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

-- This is a VHDL entity declaration for a generic multiplexer (MUX).
entity Generic_MUX is
    -- Generic declaration allows customization of the width of the MUX.
    Generic (
        WIDTH : positive := 4 -- WIDTH specifies the number of bits in the input and output vectors, default is 4
    );
    -- Port declaration for inputs and output of the MUX.
    Port (
        D0 : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0); -- Input data vector 0
        D1 : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0); -- Input data vector 1
        S  : in  STD_LOGIC; -- Select line indicating which input to choose
        Y  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0) -- Output data vector
    );
end Generic_MUX;

-- Architecture defining the behavior of the generic MUX.
architecture Behavioral of Generic_MUX is
begin
    -- Output Y is assigned based on the value of select line S.
    Y <= D0 when S = '0' else  -- When S is '0', output Y is equal to input D0
         D1 when S = '1' else  -- When S is '1', output Y is equal to input D1
         (others => '0');      -- Default case, when S is neither '0' nor '1', output Y is all zeros
end Behavioral;

