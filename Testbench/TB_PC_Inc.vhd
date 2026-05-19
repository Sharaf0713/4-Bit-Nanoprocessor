library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC_Inc is
end TB_PC_Inc;

architecture Behavioral of TB_PC_Inc is
    signal A_in  : std_logic_vector(2 downto 0);
    signal A_out : std_logic_vector(2 downto 0);
begin
    UUT: entity work.PC_Inc 
        port map (A_in => A_in, A_out => A_out);

    process
    begin
        A_in <= "000"; wait for 20 ns;
        A_in <= "011"; wait for 20 ns;
        A_in <= "111"; wait for 20 ns;
        wait;
    end process;
end Behavioral;
