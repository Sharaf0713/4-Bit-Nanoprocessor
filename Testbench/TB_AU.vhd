library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.cpu_types.all;

entity TB_AU is
end TB_AU;

architecture Behavioral of TB_AU is
    signal I1, I2, O      : data_bus;
    signal Overflow, Zero : std_logic;
    signal Operation      : Operation_Sel;
begin
    UUT: entity work.AU 
        port map(
            I1 => I1, I2 => I2, O => O, Overflow => Overflow, 
            Zero => Zero, Operation => Operation
        );

    process
    begin
        Operation <= AU_ADD_SIGNAL;
        I1 <= "0011"; I2 <= "0010"; 
        wait for 200 ns;

        Operation <= AU_SUB_SIGNAL;
        I1 <= "0101"; I2 <= "0001"; 
        wait for 200 ns;
        
        Operation <= AU_SUB_SIGNAL;
        I1 <= "0010"; I2 <= "0010"; 
        wait for 200 ns;

        Operation <= AU_ADD_SIGNAL;
        I1 <= "1111"; I2 <= "0001"; 
        wait for 200 ns;

        wait;
    end process;
end Behavioral;