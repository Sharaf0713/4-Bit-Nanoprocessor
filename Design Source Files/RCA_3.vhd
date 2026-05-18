library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_3 is
    Port ( A     : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           B     : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           C_in  : in  STD_LOGIC;
           S     : out STD_LOGIC_VECTOR(2 DOWNTO 0);
           C_out : out STD_LOGIC);
end RCA_3;

architecture Behavioral of RCA_3 is
    constant N : integer := 3;
    signal carries : STD_LOGIC_VECTOR(N downto 0);
begin
    carries(0) <= C_in;
    FAs : for i in 0 to N-1 generate
        FA_inst : entity work.FA
            port map (A => A(i), B => B(i), C_in => carries(i), S => S(i), C_out => carries(i+1));
    end generate FAs;
    C_out <= carries(N);
end Behavioral;