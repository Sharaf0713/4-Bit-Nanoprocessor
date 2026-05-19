library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package constants is
    constant Immediate_Load : std_logic := '1';
end package constants;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.cpu_types.all;
use work.constants.all;

entity Load_Selector is
    port( LS : in  std_logic; IM : in  data_bus; R  : in  data_bus; O  : out data_bus);
end Load_Selector;

architecture Behavioral of Load_Selector is
    signal A, B : data_bus;
begin
    IM_LOAD_GEN : if Immediate_Load = '0' generate
        A <= IM; B <= R;
    end generate IM_LOAD_GEN;
    
    REG_LOAD_GEN : if Immediate_Load = '1' generate
        A <= R; B <= IM;
    end generate REG_LOAD_GEN;

    Mux_Inst: entity work.Mux_2_N
        generic map(N => 4)
        port map(S => LS, A => A, B => B, O => O);
end Behavioral;