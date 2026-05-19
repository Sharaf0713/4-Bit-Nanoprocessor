library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.cpu_types.all;

entity TB_Load_Selector is
end TB_Load_Selector;

architecture Behavioral of TB_Load_Selector is
    signal LS : std_logic;
    signal IM : data_bus;
    signal R  : data_bus;
    signal O  : data_bus;
begin
    UUT: entity work.Load_Selector 
        port map (LS => LS, IM => IM, R => R, O => O);

    process
    begin
        IM <= "1010"; R <= "0101"; 
        LS <= '0'; wait for 20 ns;
        LS <= '1'; wait for 20 ns;
        wait;
    end process;
end Behavioral;