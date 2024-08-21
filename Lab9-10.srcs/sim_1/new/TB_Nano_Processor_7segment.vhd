----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 05:00:21 PM
-- Design Name: 
-- Module Name: TB_Nano_Processor_7segment - Behavioral
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

entity TB_Nano_Processor_7segment is
--  Port ( );
end TB_Nano_Processor_7segment;

architecture Behavioral of TB_Nano_Processor_7segment is
component Nano_Processor_with_out 
    Port (
        clk          : in  STD_LOGIC;
        reset        : in  STD_LOGIC;
        ROMSel       : in  STD_LOGIC;
        overflow     : out STD_LOGIC;
        zero         : out STD_LOGIC;
        negative     : out STD_LOGIC;
        seg_out      : out STD_LOGIC_VECTOR (3 downto 0);
        Anode_7Seg   : out STD_LOGIC_VECTOR (3 downto 0);
        Cathode_7Seg : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;
signal Clk : std_logic := '0';
signal Reset : std_logic;
signal ROMSel : std_logic:='0';
signal overflow,Zero,Negative : std_logic;
signal LED_out,Anode_7Seg : STD_LOGIC_VECTOR (3 downto 0);
signal Cathode_7Seg :STD_LOGIC_VECTOR (6 downto 0);
begin
UUT:Nano_Processor_with_out
    port map(
        Clk=>Clk,
        Reset=>Reset,
        ROMSel=>ROMSel,
        OverFlow=>Overflow,
        Zero=>Zero,
        Negative=>Negative,
        seg_out => LED_out,
        Anode_7Seg => Anode_7Seg,
        Cathode_7Seg => Cathode_7Seg);
process 
begin
    wait for 0.5 ns;
    Clk<=not(Clk);
end process;

process 
begin
wait for 100ns;
Reset<='1';
wait for 20ns;
Reset<='0';
wait;
end process;
end Behavioral;