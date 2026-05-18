library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Address_Selector is
    Port ( PC  : in  std_logic_vector(2 downto 0); 
           JA  : in  std_logic_vector(2 downto 0); 
           J   : in  std_logic;                    
           A   : out std_logic_vector(2 downto 0));
end Address_Selector;

architecture Behavioral of Address_Selector is
begin
    Mux_Inst: entity work.Mux_2_N
        generic map (N => 3)
        port map (S => J, A => PC, B => JA, O => A);
end Behavioral;