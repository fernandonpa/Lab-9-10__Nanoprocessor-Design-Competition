----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 07:50:10 AM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is

    component Register_Bank
        Port (
            clk : in STD_LOGIC;                         -- Clock input
            reset : in STD_LOGIC;                      -- Reset signal input
            reg_en : in STD_LOGIC_VECTOR (2 downto 0); -- Register enable signals input
            d : in STD_LOGIC_VECTOR (3 downto 0);      -- Data input for registers
            R0 : out STD_LOGIC_VECTOR (3 downto 0);    -- Output of register 0
            R1 : out STD_LOGIC_VECTOR (3 downto 0);    -- Output of register 1
            R2 : out STD_LOGIC_VECTOR (3 downto 0);    -- Output of register 2
            R3 : out STD_LOGIC_VECTOR (3 downto 0);    -- Output of register 3
            R4 : out STD_LOGIC_VECTOR (3 downto 0);    -- Output of register 4
            R5 : out STD_LOGIC_VECTOR (3 downto 0);    -- Output of register 5
            R6 : out STD_LOGIC_VECTOR (3 downto 0);    -- Output of register 6
            R7 : out STD_LOGIC_VECTOR (3 downto 0)     -- Output of register 7
        );
    end component;

    signal reg_en : STD_LOGIC_VECTOR (2 downto 0) := "101";
    signal clk, reset : STD_LOGIC := '0';
    signal d : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    signal R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR (3 downto 0);

begin

    UUT : Register_Bank
        port map (
            clk => clk,
            reset => reset,
            reg_en => reg_en,
            d => d,
            R0 => R0,
            R1 => R1,
            R2 => R2,
            R3 => R3,
            R4 => R4,
            R5 => R5,
            R6 => R6,
            R7 => R7
        );

    clk_gen : process
    begin
        wait for 40 ns;
        clk <= not clk;
    end process clk_gen;

    reset_gen : process
    begin
        wait for 60 ns;
        reset <= not reset;
        wait for 100 ns;
        reset <= not reset;
        wait;
    end process reset_gen;

    reg_en_gen : process
    begin
        wait for 165 ns;
        reg_en <= "010";
        wait;
    end process reg_en_gen;

    data_gen : process
    begin
        wait for 100 ns;
        d <= "0001";
        wait for 100 ns;
        d <= "0100";
        wait for 100 ns;
        d <= "1111";
        wait for 100 ns;
        d <= "1100";
        wait for 100 ns;
        d <= "1001";
        wait for 100 ns;
        d <= "0011";
        wait for 100 ns;
        d <= "0101";
        wait for 100 ns;
        d <= "1101";
        wait;
    end process data_gen;

end Behavioral;