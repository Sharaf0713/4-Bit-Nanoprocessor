library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.cpu_types.all;

entity Nanoprocessor is
    port(
        Clk      : in  std_logic;
        Res      : in  std_logic;
        Overflow : out std_logic;
        Zero     : out std_logic;
        Data     : out std_logic_vector(3 downto 0) 
    );
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is

    signal Next_Address     : std_logic_vector(2 downto 0);
    signal Current_Address  : std_logic_vector(2 downto 0); 
    signal Selected_Address : std_logic_vector(2 downto 0);
    signal Jump_Address     : std_logic_vector(2 downto 0);
    signal Jump_Flag        : std_logic;
    signal Instruction      : std_logic_vector(11 downto 0); 
    
    signal Load_Selection   : std_logic;
    signal Immediate_Value  : std_logic_vector(3 downto 0); 
    signal OprASelect       : std_logic_vector(2 downto 0);
    signal OprBSelect       : std_logic_vector(2 downto 0);
    signal OprAData         : std_logic_vector(3 downto 0);
    signal OprBData         : std_logic_vector(3 downto 0);
    signal Operation_Res    : std_logic_vector(3 downto 0); 
    
    signal Register_Data    : data_buses;
    signal AddSubSelect     : Operation_Sel; 
    signal Register_Enable  : std_logic_vector(2 downto 0);
    signal Selected_Load    : std_logic_vector(3 downto 0); 
    
begin

    Program_Counter : entity work.PC 
        port map(A => Selected_Address, Clk => Clk, Res => Res, M => Current_Address);

    PC_Incrementer : entity work.PC_Inc 
        port map(A_in => Current_Address, A_out => Next_Address);

    Address_Selector_0 : entity work.Address_Selector 
        port map(PC => Next_Address, JA => Jump_Address, J => Jump_Flag, A => Selected_Address);

    Program_ROM_0 : entity work.Program_ROM 
        port map(ROM_address => Current_Address, I => Instruction);

    Instruction_Decoder : entity work.IDecoder 
        port map(
            I      => Instruction,
            RCJump => OprAData, -- Fixed Datapath Bug!
            REN    => Register_Enable,
            RSA    => OprASelect,
            RSB    => OprBSelect,
            OpS    => AddSubSelect,
            IM     => Immediate_Value,
            J      => Jump_Flag,
            JA     => Jump_Address,
            L      => Load_Selection
        );

    Load_Selector_0 : entity work.Load_Selector 
        port map(LS => Load_Selection, IM => Immediate_Value, R => Operation_Res, O => Selected_Load);

    Opr_Selector_A : entity work.Mux_8_4 
        port map(S => OprASelect, D => Register_Data, EN => '1', Y => OprAData);

    Opr_Selector_B : entity work.Mux_8_4 
        port map(S => OprBSelect, D => Register_Data, EN => '1', Y => OprBData);

    Arithmetic_Unit_0 : entity work.AU 
        port map(I1 => OprAData, I2 => OprBData, O => Operation_Res, Overflow => Overflow, 
                 Zero => Zero, Operation => AddSubSelect);

    Register_Bank_0 : entity work.Register_Bank 
        port map(Reg_EN => Register_Enable, Res => Res, Clk => Clk, Data => Selected_Load, 
                 Data_Buses => Register_Data);

    Data <= Register_Data(7);
        
end Behavioral;