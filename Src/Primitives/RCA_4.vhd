library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4 is
    Port ( A     : in  STD_LOGIC_VECTOR(3 downto 0);
           B     : in  STD_LOGIC_VECTOR(3 downto 0);
           C_in  : in  STD_LOGIC;
           S     : out STD_LOGIC_VECTOR(3 downto 0);
           C_out : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is
    signal carries : STD_LOGIC_VECTOR(4 downto 0);
begin
    carries(0) <= C_in;
    FAs : for i in 0 to 3 generate
        FA_inst : entity work.FA
            port map (A => A(i), B => B(i), C_in => carries(i), S => S(i), C_out => carries(i+1));
    end generate FAs;
    C_out <= carries(4);
end Behavioral;