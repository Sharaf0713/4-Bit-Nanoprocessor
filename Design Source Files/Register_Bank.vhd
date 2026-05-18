library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.cpu_types.all;

entity Register_Bank is
    Port ( Reg_En     : in  register_address; 
           Res        : in  STD_LOGIC;
           Clk        : in  STD_LOGIC;
           Data       : in  data_bus;         
           Data_Buses : out data_buses );
end Register_Bank;

architecture Behavioral of Register_Bank is
    signal Reg_sel : std_logic_vector(7 downto 0);
begin
    Dec_0 : entity work.Decoder_3_to_8
        port map(I => Reg_En, EN => '1', Y => Reg_sel);

    R0: entity work.reg generic map(N => 4)
        port map(D => "0000", Res => Res, En => '1', Clk => Clk, Q => Data_Buses(0));

    Reg_Gen: for i in 1 to 7 generate
        Ri: entity work.reg generic map(N => 4)
            port map(D => Data, Res => Res, En => Reg_sel(i), Clk => Clk, Q => Data_Buses(i));
    end generate;
end Behavioral;