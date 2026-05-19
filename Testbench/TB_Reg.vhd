library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Reg is
end TB_Reg;

architecture Behavioral of TB_Reg is
    signal D   : std_logic_vector(3 downto 0);
    signal Res : std_logic := '0';
    signal En  : std_logic := '0';
    signal Clk : std_logic := '0';
    signal Q   : std_logic_vector(3 downto 0);
    constant clk_period : time := 100 ns;
begin
    UUT: entity work.Reg 
        generic map (N => 4)
        port map (D => D, Res => Res, En => En, Clk => Clk, Q => Q);

    Clk_process : process
    begin
        Clk <= '0'; wait for clk_period/2;
        Clk <= '1'; wait for clk_period/2;
    end process;

    process
    begin
        Res <= '1'; wait for 200 ns;
        Res <= '0';
        D <= "1010"; En <= '0'; wait for 200 ns;
        En <= '1'; wait for 200 ns;
        D <= "0011"; wait for 200 ns;
        wait;
    end process;
end Behavioral;