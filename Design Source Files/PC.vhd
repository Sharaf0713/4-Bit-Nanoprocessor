library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    Port ( A   : in  STD_LOGIC_VECTOR(2 downto 0);
           Res : in  STD_LOGIC;                    
           Clk : in  STD_LOGIC;                  
           M   : out std_logic_vector(2 downto 0));
end PC;

architecture Behavioral of PC is
    signal current_addr : unsigned(2 downto 0) := "000";
begin
    process(Clk, Res) begin
        if Res = '1' then
            current_addr <= (others => '0');
        elsif rising_edge(Clk) then
            current_addr <= unsigned(A);
        end if;
    end process;
    M <= std_logic_vector(current_addr);
end Behavioral;