library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_3_to_8 is
    Port ( I  : in  STD_LOGIC_VECTOR(2 downto 0);
           EN : in  STD_LOGIC;
           Y  : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
    signal Y0, Y1 : STD_LOGIC_VECTOR (3 downto 0);
    signal EN0, EN1 : STD_LOGIC;
begin
    EN0 <= (NOT I(2)) AND EN;
    EN1 <= I(2) AND EN;

    Decoder_low : entity work.Decoder_2_to_4 port map (I => I(1 downto 0), EN => EN0, Y => Y0);
    Decoder_high : entity work.Decoder_2_to_4 port map (I => I(1 downto 0), EN => EN1, Y => Y1);

    Y(3 downto 0) <= Y0;
    Y(7 downto 4) <= Y1;
end Behavioral;