----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 07:28:32 AM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
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
end Register_Bank;

architecture Behavioral of Register_Bank is

    component Reg
        Port (
            D : in STD_LOGIC_VECTOR (3 downto 0);  -- Data input to the register
            En : in STD_LOGIC;                     -- Enable signal for the register
            Clk : in STD_LOGIC;                    -- Clock signal for the register
            reset : in STD_LOGIC;                  -- Reset signal for the register
            Q : out STD_LOGIC_VECTOR (3 downto 0)  -- Output of the register
        );
    end component;

    Component Decoder_3_to_8
        Port (
            I : in STD_LOGIC_VECTOR (2 downto 0);       -- Input to the decoder
            EN : in STD_LOGIC;                          -- Enable signal for the decoder
            Y : out STD_LOGIC_VECTOR (7 downto 0)       -- Output of the decoder
        );
    end component;

    signal EN : STD_LOGIC := '1';                         -- Initial value for the enable signal
    signal Y : STD_LOGIC_VECTOR (7 downto 0);             -- Output of the decoder

begin
    -- Instantiating the decoder
    Decoder_3_to_8_0: Decoder_3_to_8
        port map (
            I => reg_en,                                 -- Connect register enable signals to decoder input
            EN => EN,                                    -- Connect enable signal to decoder
            Y => Y                                       -- Output of the decoder
        );

    -- Instantiating the registers
    Reg_0: Reg
        port map (
            D => "0000",                                -- Constant input for register 0
            En => Y(0),                                 -- Enable signal from decoder for register 0
            Clk => clk,                                 -- Clock input
            reset => reset,                             -- Reset input
            Q => R0                                     -- Output of register 0
        );
    
    Reg_1: Reg
        port map (
            D => d,                                     -- Data input for register 1
            En => Y(1),                                 -- Enable signal from decoder for register 1
            Clk => clk,                                 -- Clock input
            reset => reset,                             -- Reset input
            Q => R1                                     -- Output of register 1
        );

    Reg_2: Reg
        port map (
            D => d,                                     -- Data input for register 2
            En => Y(2),                                 -- Enable signal from decoder for register 2
            Clk => clk,                                 -- Clock input
            reset => reset,                             -- Reset input
            Q => R2                                     -- Output of register 2
        );

    Reg_3: Reg
        port map (
            D => d,                                     -- Data input for register 3
            En => Y(3),                                 -- Enable signal from decoder for register 3
            Clk => clk,                                 -- Clock input
            reset => reset,                             -- Reset input
            Q => R3                                     -- Output of register 3
        );
   
    Reg_4: Reg
        port map (
            D => d,                                     -- Data input for register 4
            En => Y(4),                                 -- Enable signal from decoder for register 4
            Clk => clk,                                 -- Clock input
            reset => reset,                             -- Reset input
            Q => R4                                     -- Output of register 4
        );

    Reg_5: Reg
        port map (
            D => d,                                     -- Data input for register 5
            En => Y(5),                                 -- Enable signal from decoder for register 5
            Clk => clk,                                 -- Clock input
            reset => reset,                             -- Reset input
            Q => R5                                     -- Output of register 5
        );

    Reg_6: Reg
        port map (
            D => d,                                     -- Data input for register 6
            En => Y(6),                                 -- Enable signal from decoder for register 6
            Clk => clk,                                 -- Clock input
            reset => reset,                             -- Reset input
            Q => R6                                     -- Output of register 6
        );

    Reg_7: Reg
        port map (
            D => d,                                     -- Data input for register 7
            En => Y(7),                                 -- Enable signal from decoder for register 7
            Clk => clk,                                 -- Clock input
            reset => reset,                             -- Reset input
            Q => R7                                     -- Output of register 7
        );

end Behavioral;
