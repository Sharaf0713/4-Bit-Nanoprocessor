library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor_TB is
end Nanoprocessor_TB;

architecture Behavioral of Nanoprocessor_TB is

    component Nanoprocessor
        port(
            Clk      : in  std_logic;
            Res      : in  std_logic;
            Overflow : out std_logic;
            Zero     : out std_logic;
            Data     : out std_logic_vector(3 downto 0)
        );
    end component;

    signal Clk      : std_logic := '0';
    signal Res      : std_logic := '0';
    signal Overflow : std_logic;
    signal Zero     : std_logic;
    signal Data     : std_logic_vector(3 downto 0);

    constant clk_period : time := 100 ns;

begin

    UUT: Nanoprocessor 
        port map (
            Clk => Clk,
            Res => Res,
            Overflow => Overflow,
            Zero => Zero,
            Data => Data
        );

    clk_process : process
    begin
        Clk <= '0';
        wait for clk_period/2;
        Clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin		
        Res <= '1';
        wait for 100 ns;	
        Res <= '0';
        wait;
    end process;

end Behavioral;