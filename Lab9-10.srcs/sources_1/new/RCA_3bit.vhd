----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 01:21:22 PM
-- Design Name: 
-- Module Name: RCA_3bit - Behavioral
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

-- Entity declaration for a 3-bit Ripple Carry Adder (RCA)
entity RCA_3bit is
    Port (
        -- Input ports
        A_in : in STD_LOGIC_VECTOR (2 downto 0);
        -- Output ports
        S_out : out STD_LOGIC_VECTOR (2 downto 0);
        C_out : out STD_LOGIC
    );
end RCA_3bit;

-- Architecture defining the behavior of the 3-bit Ripple Carry Adder
architecture Behavioral of RCA_3bit is
    -- Declaration of a full adder component
    component FA
        port (
            A : in std_logic;
            B : in std_logic;
            C_in : in std_logic;
            S : out std_logic;
            C_out : out std_logic
        );
    end component;
    
    -- Signals for carry propagation
    signal C0, C1 : std_logic;
begin
    -- Instantiation of the first full adder
    FA_0 : FA
        port map (
            A => A_in(0),
            B => '1',         -- Constant value for second input
            C_in => '0',      -- Constant value for carry-in
            S => S_out(0),
            C_out => C0
        );
    
    -- Instantiation of the second full adder
    FA_1 : FA
        port map (
            A => A_in(1),
            B => '0',         -- Constant value for second input
            C_in => C0,       -- Carry from previous stage
            S => S_out(1),
            C_out => C1
        );
    
    -- Instantiation of the third full adder
    FA_2 : FA
        port map (
            A => A_in(2),
            B => '0',         -- Constant value for second input
            C_in => C1,       -- Carry from previous stage
            S => S_out(2),
            C_out => C_out    -- Final carry-out
        );
end Behavioral;
