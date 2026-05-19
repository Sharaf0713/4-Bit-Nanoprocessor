library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use work.cpu_types.all;

entity Program_ROM is
    Port ( ROM_address : in  instruction_address; 
           I           : out instruction_bus);
end Program_ROM;

architecture Behavioral of Program_ROM is
    type rom_type is array (0 to 7) of instruction_bus;
    constant PROGRAM : rom_type := (
            0 => "101110000001", -- MOVI R7, 1 (Output becomes 1)
            1 => "100010000010", -- MOVI R1, 2
            2 => "001110010000", -- ADD R7, R1 (Output becomes 1+2 = 3)
            3 => "100100000011", -- MOVI R2, 3
            4 => "001110100000", -- ADD R7, R2 (Output becomes 3+3 = 6) <-- FIXED HERE
            5 => "110000000101", -- JZR R0, 5  (Infinite loop to hold the result)
            6 => "000000000000", 
            7 => "000000000000"  
    );
begin
    process(ROM_address) begin
        I <= PROGRAM(to_integer(unsigned(ROM_address)));
    end process;
end Behavioral;