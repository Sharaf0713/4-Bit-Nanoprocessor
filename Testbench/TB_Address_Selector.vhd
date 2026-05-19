library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Address_Selector is
end TB_Address_Selector;

architecture Behavioral of TB_Address_Selector is
    signal PC : std_logic_vector(2 downto 0);
    signal JA : std_logic_vector(2 downto 0);
    signal J  : std_logic;
    signal A  : std_logic_vector(2 downto 0);
begin
    UUT: entity work.Address_Selector 
        port map (PC => PC, JA => JA, J => J, A => A);

    process
    begin
        PC <= "001"; JA <= "111"; J <= '0'; wait for 20 ns;
        J <= '1'; wait for 20 ns;
        PC <= "010"; JA <= "100"; J <= '0'; wait for 20 ns;
        J <= '1'; wait for 20 ns;
        wait;
    end process;
end Behavioral;