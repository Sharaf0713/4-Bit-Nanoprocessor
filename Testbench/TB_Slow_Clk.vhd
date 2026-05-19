library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Slow_Clk is
end TB_Slow_Clk;

architecture Behavioral of TB_Slow_Clk is
    signal Clk_in  : std_logic := '0';
    signal Clk_out : std_logic;
    constant clk_period : time := 100 ns;
begin
    UUT: entity work.Slow_Clk 
        port map (Clk_in => Clk_in, Clk_out => Clk_out);

    Clk_process : process
    begin
        Clk_in <= '0'; wait for clk_period/2;
        Clk_in <= '1'; wait for clk_period/2;
    end process;

    process
    begin
        wait for 1000 ns;
        wait;
    end process;
end Behavioral;
