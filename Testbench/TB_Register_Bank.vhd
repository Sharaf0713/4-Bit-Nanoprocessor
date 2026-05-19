library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.cpu_types.all;

entity TB_Register_Bank is
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is
    signal Reg_En : register_address;
    signal Res : std_logic;
    signal Clk : std_logic := '0';
    signal Data : data_bus;
    signal Data_Buses_Out : data_buses;
    constant clk_period : time := 100 ns;
begin
    UUT: entity work.Register_Bank 
        port map(
            Reg_En => Reg_En, Res => Res, Clk => Clk, 
            Data => Data, Data_Buses => Data_Buses_Out
        );

    Clk_process : process
    begin
        Clk <= '0'; wait for clk_period/2;
        Clk <= '1'; wait for clk_period/2;
    end process;

    process
    begin
        Res <= '1'; wait for 200 ns;
        Res <= '0'; 
        Data <= "1111"; Reg_En <= "001"; wait for 200 ns;
        Data <= "1010"; Reg_En <= "111"; wait for 200 ns;
        wait;
    end process;
end Behavioral;