library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg is
    generic( N : integer := 4 );
    Port ( D   : in  std_logic_vector(N-1 downto 0);
           Res : in  STD_LOGIC;
           En  : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Q   : out std_logic_vector(N-1 downto 0));
end Reg;

architecture Behavioral of Reg is
begin
    D_Flip_Flops: for i in 0 to N-1 generate
        D_FF_Inst: entity work.D_FF port map(
            D    => D(i),
            Res  => Res,
            En   => En,
            Clk  => Clk,
            Q    => Q(i),
            Qbar => open
        ); 
    end generate D_Flip_Flops;
end Behavioral;