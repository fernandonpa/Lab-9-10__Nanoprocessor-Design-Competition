----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 07:30:41 AM
-- Design Name: 
-- Module Name: TB_Nano_Processor - Behavioral
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

entity TB_Nano_Processor is
--  Port ( );
end TB_Nano_Processor;

architecture Behavioral of TB_Nano_Processor is

    component Nano_Processor
        Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        ROMSel   : in  STD_LOGIC;
        overflow : out STD_LOGIC;
        zero     : out STD_LOGIC;
        negative : out STD_LOGIC;
        R7_out   : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    
    signal Overflow, Zero,Negative : std_logic;
    signal Clk, Reset : std_logic := '1';  -- Removed extra colon here
    signal R7_out : STD_LOGIC_VECTOR (3 downto 0);

begin
    UUT: Nano_Processor
port map( 
    clk => Clk,
    reset => Reset,
    ROMSel=>'0',
    overflow => Overflow,  -- Corrected port name
    zero => Zero,
    negative=>Negative,
    R7_out => R7_out
);

    process 
    begin
        wait for 0.4 ns;
        Clk <= not Clk;  -- Simplified the not operator
    end process; 

    process 
    begin
        wait for 100 ns;
        Reset <= '0'; 
        
        
        wait; 
    end process; 


end Behavioral;
