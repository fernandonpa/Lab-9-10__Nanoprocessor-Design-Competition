library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Program_ROM_1 is
    Port (
        addr : in STD_LOGIC_VECTOR (2 downto 0);
        ROMSel : in STD_LOGIC;
        instruction : out STD_LOGIC_VECTOR (11 downto 0)
    );
end Program_ROM_1;

architecture Behavioral of Program_ROM_1 is
    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

    -- Program 1: Calculate the total of all integers between 1 and 3
    constant Program1 : rom_type := (
        "100010000011", -- MOVI R1,3 
        "100100000001", -- MOVI R2,1
        "010100000000", -- NEG R2
        "001110010000", -- ADD R7,R1
        "000010100000", -- ADD R1,R2
        "110010000111", -- JZR R1,7
        "110000000011", -- JZR R0,3
        "110000000111"  -- JZR R0,7
    );

    -- Program 2: 
    constant Program2 : rom_type := (
        "101110001010", -- MOVI R7,-6
        "100100000001", -- MOVI R2,1
        "001110100000", -- ADD R7,R2
        "110010000101", -- JZR R1,5
        "000110100000", -- ADD R3,R2
        "110000000010", -- JZR R0,2
        "000111110000", -- ADD R3,R7
        "110010000111"  -- JZR R1,7
    );

begin
    process(addr, ROMSel)
    begin
        if ROMSel = '0' then
            instruction <= Program1(to_integer(unsigned(addr)));
        else
            instruction <= Program2(to_integer(unsigned(addr)));
        end if;
    end process;
end Behavioral;