----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 05:52:00 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
component Instruction_Decoder
        Port (
        clk : in STD_LOGIC;                               -- Clock input
        instruction : in STD_LOGIC_VECTOR (11 downto 0);  -- Input instruction
        reg_data : in STD_LOGIC_VECTOR (3 downto 0);      -- Input register data
        reg_en : out STD_LOGIC_VECTOR (2 downto 0);       -- Output register enable signals
        load_imm : out STD_LOGIC;                         -- Output signal indicating immediate value load
        imm_value : out STD_LOGIC_VECTOR (3 downto 0);    -- Output immediate value
        mux_a_sel, mux_b_sel : out STD_LOGIC_VECTOR (2 downto 0);  -- Output signals for selecting mux inputs
        sub_sel : out STD_LOGIC;                          -- Output signal for subtraction operation selection
        jump : out STD_LOGIC;                             -- Output signal indicating jump instruction
        jump_addr : out STD_LOGIC_VECTOR (2 downto 0)     -- Output jump address

        );
end component; 

signal clk : std_logic := '0';
signal load_imm, sub_sel, jump : std_logic;
signal reg_en, mux_a_sel, mux_b_sel, jump_addr : std_logic_vector (2 downto 0);
signal reg_data, imm_value : std_logic_vector (3 downto 0);
signal instruction : std_logic_vector (11 downto 0);
    
begin
UUT : Instruction_Decoder
        port map (
            clk => clk,
            instruction => instruction,
            reg_data => reg_data,
            reg_en => reg_en,
            load_imm => load_imm,
            imm_value => imm_value,
            mux_a_sel => mux_a_sel,
            mux_b_sel => mux_b_sel,
            sub_sel => sub_sel,
            jump => jump,
            jump_addr => jump_addr
        );

-- Clock generation process
process
    begin
        wait for 10ns;  -- Toggle clock every 10ns
        clk <= not clk;
    end process;

-- Test stimuli process
process
    begin
        -- Provide different instructions to test the Instruction_Decoder
        
        -- Test a simple instruction
        instruction <= "100000000010";  -- Sample instruction
        wait for 100 ns;
        
        -- Test another type of instruction
        instruction <= "100010000111";
        wait for 100 ns;
        
        -- Test another type of instruction
        instruction <= "100110001110";
        wait for 100 ns;
        
        -- Test another type of instruction
        instruction <= "010110000000";
        wait for 100 ns;
        
        -- Test an instruction with register data
        reg_data <= "0000";  -- Sample register data
        instruction <= "000010000000";
        wait for 100 ns;
        
        -- Test another type of instruction
        instruction <= "110010000010";
        wait for 100 ns;
        
        -- Test another type of instruction
        instruction <= "111110000001";
        wait for 100 ns;
    end process;

end Behavioral;