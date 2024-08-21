----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 09:39:34 PM
-- Design Name: 
-- Module Name: ALU_4bit - Behavioral
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

entity ALU_4bit is
    Port (
        a : in STD_LOGIC_VECTOR (3 downto 0);  -- Input operand A
        b : in STD_LOGIC_VECTOR (3 downto 0);  -- Input operand B
        sub_sel : in STD_LOGIC;                -- Subtraction selection signal
        result : out STD_LOGIC_VECTOR (3 downto 0);  -- Output result
        overflow : out STD_LOGIC;              -- Overflow flag
        zero : out STD_LOGIC;                  -- Zero flag
        negative : out STD_LOGIC               -- Negative flag
    );
end ALU_4bit;

architecture Behavioral of ALU_4bit is
    component FA 
        port( 
             A:in std_logic;                    -- Input A of full adder
             B:in std_logic;                    -- Input B of full adder
             C_in:in std_logic;                 -- Carry input
             S:out std_logic;                   -- Sum output
             C_out:out std_logic                 -- Carry output
             );
    end component;

    signal  f_add0_c, f_add1_c, f_add2_c, f_add3_c : std_logic;  -- Signals for full adder outputs
    signal b0, b1, b2, b3 : std_logic;         -- Signals for adjusted B inputs
    signal s : std_logic_vector (3 downto 0);  -- Signal for ALU output
    signal over_flow, zero_0 : std_logic;      -- Overflow and zero flag signals

begin
    -- Adjust B inputs based on subtraction selection
    b0 <= b(0) xor sub_sel;
    b1 <= b(1) xor sub_sel;
    b2 <= b(2) xor sub_sel;
    b3 <= b(3) xor sub_sel;

    -- Full adder instantiation and connections
    FA_0 : FA port map (
        a => a(0),
        b => b0,
        c_in => sub_sel,
        s => s(0),
        c_out => f_add0_c
    );

    FA_1 : FA port map (
        a => a(1),
        b => b1,
        c_in => f_add0_c,
        s => s(1),
        c_out => f_add1_c
    );

    FA_2 : FA port map (
        a => a(2),
        b => b2,
        c_in => f_add1_c,
        s => s(2),
        c_out => f_add2_c
    );

    FA_3 : FA port map (
        a => a(3),
        b => b3,
        c_in => f_add2_c,
        s => s(3),
        c_out => f_add3_c
    );

    -- Determine overflow and negative flags
    over_flow <= f_add2_c xor f_add3_c;
    negative <= over_flow xor s(3);
    overflow <= over_flow;

    -- Calculate zero flag
    zero <= not(s(0) or s(1) or s(2) or s(3) or over_flow);

    -- Output result
    result <= s;

end Behavioral;



