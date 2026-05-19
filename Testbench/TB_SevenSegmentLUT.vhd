library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_SevenSegmentLUT is
end TB_SevenSegmentLUT;

architecture Behavioral of TB_SevenSegmentLUT is
    signal address : std_logic_vector(3 downto 0);
    signal data    : std_logic_vector(6 downto 0);
begin
    UUT: entity work.SevenSegmentLUT 
        port map (address => address, data => data);

    process
    begin
        address <= "0000"; wait for 200 ns;
        address <= "0011"; wait for 200 ns;
        address <= "0110"; wait for 200 ns;
        address <= "1010"; wait for 200 ns;
        address <= "1111"; wait for 200 ns;
        wait;
    end process;
end Behavioral;
