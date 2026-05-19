library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.cpu_types.all;

entity TB_Program_ROM is
end TB_Program_ROM;

architecture Behavioral of TB_Program_ROM is
    signal ROM_address : instruction_address;
    signal I           : instruction_bus;
begin
    UUT: entity work.Program_ROM 
        port map (ROM_address => ROM_address, I => I);

    process
    begin
        ROM_address <= "000"; wait for 200 ns;
        ROM_address <= "001"; wait for 200 ns;
        ROM_address <= "010"; wait for 200 ns;
        ROM_address <= "101"; wait for 200 ns;
        ROM_address <= "111"; wait for 200 ns;
        wait;
    end process;
end Behavioral;