library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_8_to_1 is
    Port ( S  : in  STD_LOGIC_VECTOR (2 downto 0);
           D  : in  STD_LOGIC_VECTOR (7 downto 0);
           EN : in  STD_LOGIC;
           Y  : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
    signal decoder_out : STD_LOGIC_VECTOR (7 downto 0);
    signal Y_anded     : STD_LOGIC_VECTOR (7 downto 0);
begin
    Decoder_inst : entity work.Decoder_3_to_8 
        port map (I => S, EN => EN, Y => decoder_out);

    Y_anded <= D and decoder_out;
    Y <= Y_anded(0) or Y_anded(1) or Y_anded(2) or Y_anded(3) or 
         Y_anded(4) or Y_anded(5) or Y_anded(6) or Y_anded(7);
end Behavioral;