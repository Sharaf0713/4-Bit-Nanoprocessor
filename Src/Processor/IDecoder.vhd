library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.cpu_types.all; 

entity IDecoder is
    Port ( I      : in  instruction_bus;   
           RCJump : in  data_bus;          
           REn    : out register_address;  
           RSA    : out register_address;  
           RSB    : out register_address;  
           OpS    : out Operation_Sel;     
           IM     : out data_bus;          
           J      : out std_logic;         
           JA     : out instruction_address;
           L      : out std_logic);
end IDecoder;

architecture Behavioral of IDecoder is
    constant MOVI_OP : std_logic_vector(1 downto 0) := "10";
    constant ADD_OP  : std_logic_vector(1 downto 0) := "00";
    constant NEG_OP  : std_logic_vector(1 downto 0) := "01";
    constant JZR_OP  : std_logic_vector(1 downto 0) := "11";
begin
    decode: process(I, RCJump) begin
        REn <= "000"; RSA <= "000"; RSB <= "000";
        IM  <= "0000"; J <= '0'; JA  <= "000"; L <= '0'; OpS <= AU_ADD_SIGNAL;

        case I(11 downto 10) is
            when MOVI_OP => REn <= I(9 downto 7); IM <= I(3 downto 0); L <= '1';
            when ADD_OP  => REn <= I(9 downto 7); RSA <= I(9 downto 7); RSB <= I(6 downto 4); OpS <= AU_ADD_SIGNAL;
            when NEG_OP  => REn <= I(9 downto 7); RSA <= "000"; RSB <= I(9 downto 7); OpS <= AU_SUB_SIGNAL; 
            when JZR_OP  => 
                    RSA <= I(9 downto 7); -- Fix: route register out to check it
                    if RCJump = "0000" then
                        J  <= '1'; JA <= I(2 downto 0);
                    end if;
            when others => null;
        end case;
    end process;
end Behavioral;