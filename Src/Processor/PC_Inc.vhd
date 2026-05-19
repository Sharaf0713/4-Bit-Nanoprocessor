library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_Inc is
    port( A_in  : in  std_logic_vector(2 downto 0);
          A_out : out std_logic_vector(2 downto 0));
end PC_Inc;

architecture Behavioral of PC_Inc is
begin
    Add: entity work.RCA_3 
        port map(A => A_in, B => "001", C_in => '0', S => A_out, C_out => open);
end Behavioral;