----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 02:17:07 PM
-- Design Name: 
-- Module Name: MUX_8to1_4bit - Behavioral
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

-- Entity declaration for an 8-to-1 multiplexer with 4-bit inputs and output
-- Entity declaration for an 8-to-1 multiplexer with 4-bit data inputs and a 3-bit selection signal.
entity MUX_8to1_4bit is
    Port (
        -- Inputs: Eight 4-bit data inputs
        r0 : in STD_LOGIC_VECTOR (3 downto 0);
        r1 : in STD_LOGIC_VECTOR (3 downto 0);
        r2 : in STD_LOGIC_VECTOR (3 downto 0);
        r3 : in STD_LOGIC_VECTOR (3 downto 0);
        r4 : in STD_LOGIC_VECTOR (3 downto 0);
        r5 : in STD_LOGIC_VECTOR (3 downto 0);
        r6 : in STD_LOGIC_VECTOR (3 downto 0);
        r7 : in STD_LOGIC_VECTOR (3 downto 0);
        -- Input: 3-bit selection signal
        sel : in STD_LOGIC_VECTOR (2 downto 0);
        -- Output: 4-bit output
        y : out STD_LOGIC_VECTOR (3 downto 0)
    );
end MUX_8to1_4bit;

architecture Behavioral of MUX_8to1_4bit is
    -- Declaration of a component for an 8-to-1 multiplexer with 1-bit data inputs
    component MUX_8to1
        Port (
            d : in STD_LOGIC_VECTOR (7 downto 0); -- Data inputs
            sel : in STD_LOGIC_VECTOR (2 downto 0); -- Selection signal
            y  : out STD_LOGIC -- Output
        );
    end component;

begin
    -- Instantiation of the MUX_8to1 component for each bit of the output
    -- Each MUX_8to1 instance selects one bit from each of the eight input vectors based on the selection signal

    -- MUX_A selects the 0th bit from each input vector
    MUX_A : MUX_8to1
        Port map(
            d(0) => r0(0),
            d(1) => r1(0),
            d(2) => r2(0),
            d(3) => r3(0),
            d(4) => r4(0),
            d(5) => r5(0),
            d(6) => r6(0),
            d(7) => r7(0),
            sel => sel,
            y => y(0)
        );

    -- Similarly, MUX_B, MUX_C, and MUX_D select the 1st, 2nd, and 3rd bits from each input vector, respectively
    MUX_B : MUX_8to1
        Port map(
            d(0) => r0(1),
            d(1) => r1(1),
            d(2) => r2(1),
            d(3) => r3(1),
            d(4) => r4(1),
            d(5) => r5(1),
            d(6) => r6(1),
            d(7) => r7(1),
            sel => sel,
            y => y(1)
        );

    MUX_C : MUX_8to1
        Port map(
            d(0) => r0(2),
            d(1) => r1(2),
            d(2) => r2(2),
            d(3) => r3(2),
            d(4) => r4(2),
            d(5) => r5(2),
            d(6) => r6(2),
            d(7) => r7(2),
            sel => sel,
            y => y(2)
        );

    MUX_D : MUX_8to1
        Port map(
            d(0) => r0(3),
            d(1) => r1(3),
            d(2) => r2(3),
            d(3) => r3(3),
            d(4) => r4(3),
            d(5) => r5(3),
            d(6) => r6(3),
            d(7) => r7(3),
            sel => sel,
            y => y(3)
        );
end Behavioral;


