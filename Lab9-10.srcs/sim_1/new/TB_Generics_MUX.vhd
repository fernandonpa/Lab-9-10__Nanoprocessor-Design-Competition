----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 03:12:51 PM
-- Design Name: 
-- Module Name: TB_Generics_MUX - Behavioral
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

entity TB_Generics_MUX is
--  Port ( );
end TB_Generics_MUX;

architecture Behavioral of TB_Generics_MUX is

component Generic_MUX
    Generic (
    WIDTH : positive := 4 -- WIDTH specifies the number of bits in the input and output vectors, default is 4
);
-- Port declaration for inputs and output of the MUX.
Port (
    D0 : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0); -- Input data vector 0
    D1 : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0); -- Input data vector 1
    S  : in  STD_LOGIC; -- Select line indicating which input to choose
    Y  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0) -- Output data vector
);
end component;

signal D0,D1,Y : std_logic_vector(3 downto 0);
signal S : std_logic;

begin

UUT: Generic_MUX
    port map(
        D0 => D0,
        D1 => D1,
        S => S,
        Y => Y
    );
    

process
begin

    D0 <= "0111";
    D1 <= "0100";    
    S <= '0';
    wait for 100 ns;    
    
    S <= '1';
    wait for 100 ns;
    
    D0 <= "1010";
    D1 <= "1100";    
    S <= '0';
    wait for 100 ns;
    
    S <= '1';
    wait for 100 ns;
    
    D0 <= "0001";
    D1 <= "0111";    
    S <= '0';
    wait for 100 ns;
    
    S <= '1';
    wait;
    
end process;

end Behavioral;
