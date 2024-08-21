----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 10:04:43 PM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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

entity Nano_Processor is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        ROMSel   : in  STD_LOGIC;
        overflow : out STD_LOGIC;
        zero     : out STD_LOGIC;
        negative : out STD_LOGIC;
        R7_out   : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Nano_Processor;

architecture Behavioral of Nano_Processor is

component Slow_Clk 
   Generic (max_count:integer:= 10);
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component MUX_8to1_4bit
    Port ( r0 : in STD_LOGIC_VECTOR (3 downto 0);
           r1 : in STD_LOGIC_VECTOR (3 downto 0);
           r2 : in STD_LOGIC_VECTOR (3 downto 0);
           r3 : in STD_LOGIC_VECTOR (3 downto 0);
           r4 : in STD_LOGIC_VECTOR (3 downto 0);
           r5 : in STD_LOGIC_VECTOR (3 downto 0);
           r6 : in STD_LOGIC_VECTOR (3 downto 0);
           r7 : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Register_Bank
    Port ( clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       reg_en : in STD_LOGIC_VECTOR (2 downto 0);
       d : in STD_LOGIC_VECTOR (3 downto 0);
       R0 : out STD_LOGIC_VECTOR (3 downto 0);
       R1 : out STD_LOGIC_VECTOR (3 downto 0);
       R2 : out STD_LOGIC_VECTOR (3 downto 0);
       R3 : out STD_LOGIC_VECTOR (3 downto 0);
       R4 : out STD_LOGIC_VECTOR (3 downto 0);
       R5 : out STD_LOGIC_VECTOR (3 downto 0);
       R6 : out STD_LOGIC_VECTOR (3 downto 0);
       R7 : out STD_LOGIC_VECTOR (3 downto 0));
       
end component;

component ALU_4bit
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sub_sel : in STD_LOGIC;
           result : out STD_LOGIC_VECTOR (3 downto 0);
           overflow : out STD_LOGIC;
           zero : out STD_LOGIC;
           negative:out std_logic);
end component;

component RCA_3bit
    Port (  A_in : in STD_LOGIC_VECTOR (2 downto 0);            
            S_out: out STD_LOGIC_VECTOR (2 downto 0);     
            C_out : out STD_LOGIC);
end component;

component Instruction_Decoder
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
end component;

component Program_Counter
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR (2 downto 0);
           q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Program_ROM_1 
    Port (
        addr : in STD_LOGIC_VECTOR (2 downto 0);
        ROMSel : in STD_LOGIC;
        instruction : out STD_LOGIC_VECTOR (11 downto 0)
    );
end component;

component Generic_MUX 
    Generic (
        WIDTH : positive := 4
    );
    Port (
        D0 : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        D1 : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        S  : in  STD_LOGIC;
        Y  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
    );
end component;

    -- Signal declarations
    signal SlowClk : STD_LOGIC;
    signal Instruction : STD_LOGIC_VECTOR(11 downto 0);
    signal NextAddress,PC_out,PC_next : STD_LOGIC_VECTOR(2 downto 0);
    signal JumpAddress,MuxA_Sel,MuxB_Sel : STD_LOGIC_VECTOR(2 downto 0);
    signal ImmediateValue : STD_LOGIC_VECTOR(3 downto 0);
    signal MuxA_Output : STD_LOGIC_VECTOR(3 downto 0);
    signal MuxB_Output : STD_LOGIC_VECTOR(3 downto 0);
    signal ALU_Result : STD_LOGIC_VECTOR(3 downto 0);
    signal RegisterData : STD_LOGIC_VECTOR(3 downto 0);
    signal RegisterAddress : STD_LOGIC_VECTOR(2 downto 0);
    signal Jump : STD_LOGIC;
    signal LoadImmediate : STD_LOGIC;
    signal SubtractEnable : STD_LOGIC;
    signal R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Slow clock generation
    Slow_Clk_0 : Slow_Clk
        generic map (
                max_count => 10
            )
        port map (
            Clk_in  => Clk,
            Clk_out => SlowClk
        );

    -- Program counter
    Program_Counter_0 : Program_Counter
        port map (
            clk   => SlowClk,
            reset => reset,
            d     => NextAddress,
            q     => PC_out
        );

    -- Program ROM
    ProgramROM_0 : Program_ROM_1
        port map (
            addr      => PC_out,
            ROMSel      => ROMSel,
            instruction => Instruction
        );

    -- Instruction decoder
    Instruction_Decoder_0 : Instruction_Decoder
        port map (
            clk              => SlowClk,
            instruction      => Instruction,
            reg_data         => MuxA_Output,
            reg_en           => RegisterAddress,
            load_imm         => LoadImmediate,
            imm_value        => ImmediateValue,
            mux_a_sel        => MuxA_Sel,
            mux_b_sel        => MuxB_Sel,
            sub_sel          => SubtractEnable,
            jump             => Jump,
            jump_addr        => JumpAddress
        );

    -- Register bank
    RegisterBank_0 : Register_Bank
        port map (
            clk   => SlowClk,
            reset => reset,
            reg_en=> RegisterAddress,
            d     => RegisterData,
            R0    => R0,
            R1    => R1,
            R2    => R2,
            R3    => R3,
            R4    => R4,
            R5    => R5,
            R6    => R6,
            R7    => R7
           
        );

    -- ALU
    ALU_0 : ALU_4bit
        port map (
            a        => MuxB_Output,
            b        => MuxA_Output,
            sub_sel  => SubtractEnable,
            result        => ALU_Result,
            overflow => overflow,
            zero     => zero,
            negative => negative
        );

    -- Multiplexers
    MuxA : MUX_8to1_4bit
        port map (
            r0 => R0,
            r1 => R1,
            r2 => R2,
            r3 => R3,
            r4 => R4,
            r5 => R5,
            r6 => R6,
            r7 => R7,
            y  => MuxA_Output,
            sel  => MuxA_Sel
        );

    MuxB : MUX_8to1_4bit
        port map (
            r0 => R0,
            r1 => R1,
            r2 => R2,
            r3 => R3,
            r4 => R4,
            r5 => R5,
            r6 => R6,
            r7 => R7,
            y  => MuxB_Output,
            sel  => MuxB_Sel
        );
        
    RCA_3bit_0:RCA_3bit
            port map(
                A_in=>PC_out,
                S_out=>PC_next);
                
--Instantiate the generic MUX for MuxNextAddress (3-bit)
    MuxNextAddress : Generic_MUX
        generic map (
            WIDTH => 3
        )
        port map (
            D0 => PC_next,
            D1 => JumpAddress,
            S  => Jump,
            Y  => NextAddress
        );
        
 -- Instantiate the generic MUX for MuxRegisterData (4-bit)
    MuxRegisterData : Generic_MUX
         generic map (
             WIDTH => 4
         )
         port map (
             D0 => ALU_Result,
             D1 => ImmediateValue,
             S  => LoadImmediate,
             Y  => RegisterData
         );
    -- Output assignment

R7_out <= R7;
end Behavioral;