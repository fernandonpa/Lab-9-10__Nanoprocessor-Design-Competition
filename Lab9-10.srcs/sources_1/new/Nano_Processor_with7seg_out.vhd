----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 04:16:53 PM
-- Design Name: 
-- Module Name: Nano_Processor_with7seg_out - Behavioral
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

entity Nano_Processor_with_out is
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
end Nano_Processor_with_out;

architecture Behavioral of Nano_Processor_with_out is
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
    
    component Slow_Clk
         Generic (max_count :integer:= 10);
         Port ( Clk_in : in STD_LOGIC;
                Clk_out : out STD_LOGIC);
     end component;

    component LUT_16_7
        Port (
            address : in  STD_LOGIC_VECTOR (3 downto 0);
            data    : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    signal R7_output : STD_LOGIC_VECTOR (3 downto 0);
    signal ResInput, SlowClk_out : STD_LOGIC;
    signal DispDigit : INTEGER range 0 to 1 := 0;
    signal S_7seg : STD_LOGIC_VECTOR (6 downto 0);
    signal FirstReset : STD_LOGIC:='1';

begin
    Nano_Processor_0 : Nano_Processor
    port map (
        Clk => Clk,
        Reset => ResInput,
        ROMSel => ROMSel,
        Overflow => Overflow,
        Zero => Zero,
        Negative => Negative,
        R7_out => R7_output
    );

    Slow_Clk_0 : Slow_Clk
    generic map (
                    max_count => 10
                )
    port map (
        Clk_in => Clk,
        Clk_out => SlowClk_out
    );

    LUT_16_7_0 : LUT_16_7
    port map (
        address => R7_output,
        data => S_7seg
    );

    seg_out <= R7_output;

    -- Reset controller
    process (Clk)
    begin
        if rising_edge(Clk) then
            if reset = '1' then
                ResInput <= '1';
                FirstReset <= '0';
            elsif FirstReset = '1' then
                ResInput <= '1';
            else
                ResInput <= '0';
            end if;
        end if;
    end process;

    -- 7-segment display control
    process (SlowClk_out)
    begin
        if rising_edge(SlowClk_out) then
            DispDigit <= (DispDigit + 1) mod 2;
        end if;
    end process;

    process (DispDigit, R7_output, S_7seg)
    begin
        if DispDigit = 0 then
            Anode_7Seg <= "1110";
            Cathode_7Seg <= S_7seg;
        elsif DispDigit = 1 then
            Anode_7Seg <= "1101";
            if R7_output(3) = '1' then
                Cathode_7Seg <= "0111111"; -- Display '-'
            else
               Cathode_7Seg <= "1000000"; -- Display '0'
            end if;
        end if;
    end process;


end Behavioral;

