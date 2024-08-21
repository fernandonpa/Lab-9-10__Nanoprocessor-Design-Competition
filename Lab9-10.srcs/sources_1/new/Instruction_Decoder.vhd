----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 05:08:56 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    port (
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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
    component Fetch_Instruction
        Port (
            clk : in STD_LOGIC;                              -- Clock input
            instruction : in STD_LOGIC_VECTOR (11 downto 0); -- Input instruction
            operation : out STD_LOGIC_VECTOR (1 downto 0);   -- Output operation
            reg_A : out STD_LOGIC_VECTOR (2 downto 0);       -- Output reg_A
            reg_B : out STD_LOGIC_VECTOR (2 downto 0);       -- Output reg_B
            imm_val : out STD_LOGIC_VECTOR (3 downto 0)     -- Output immediate value
        );
    end component;

    -- Signals declaration
    signal jzr,sub: STD_LOGIC;
    signal oper: STD_LOGIC_VECTOR (1 downto 0);
    signal reg_A,reg_B: STD_LOGIC_VECTOR (2 downto 0);
    signal temp_imm, r_data: STD_LOGIC_VECTOR (3 downto 0);

begin
    -- Instance of Fetch_Instruction component
    Fetch_Instruction_0: Fetch_Instruction
        port map(
            clk => clk,
            instruction => instruction,
            operation => oper,
            reg_A => reg_A,
            reg_B => reg_B,
            imm_val => temp_imm
        );

    -- Assignments
    imm_value <= temp_imm;                               -- Immediate value output
    reg_en <= reg_A;                                     -- Register enable signal
    jump_addr <= temp_imm (2 downto 0);                  -- Jump address output
    r_data <= reg_data;                                  -- Register data input
    load_imm <= oper (1) and not(oper(0));               -- Immediate value load signal
    mux_a_sel <= reg_A;                                  -- MUX A select signal
    mux_b_sel <= reg_B;                                  -- MUX B select signal
    sub <= not(oper(1)) and oper(0);                 -- Subtraction select signal
    sub_sel <= sub;
    
    -- Jump condition evaluation
    jzr <= oper(1) and oper(0);                          -- Jump if zero flag set
    jump <= (not(r_data(0) or r_data(1) or r_data(2) or r_data(3))) and jzr;  -- Jump signal evaluation
end Behavioral;
