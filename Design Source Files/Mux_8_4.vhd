library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.cpu_types.all;

entity Mux_8_4 is
    port ( S  : in  std_logic_vector (2 downto 0);
           D  : in  data_buses; 
           EN : in  std_logic;            
           Y  : out std_logic_vector(3 downto 0));
end Mux_8_4;

architecture Behavioral of Mux_8_4 is
    type buses_4_8 is array (3 downto 0) of std_logic_vector(7 downto 0);
    signal Mux_In : buses_4_8;
begin
    multiplexers: for i in 0 to 3 generate
        Mux_In(i) <= D(7)(i) & D(6)(i) & D(5)(i) & D(4)(i) & 
                     D(3)(i) & D(2)(i) & D(1)(i) & D(0)(i);
                     
        mux_inst: entity work.Mux_8_to_1
            port map (S => S, D => Mux_In(i), EN => EN, Y => Y(i));
    end generate multiplexers;
end Behavioral;