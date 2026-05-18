library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.cpu_types.all;

entity Add_Sub_4_bit is
    Port ( A_AS     : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           B_AS     : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           CTRL     : in  STD_LOGIC;
           S_AS     : out STD_LOGIC_VECTOR (3 DOWNTO 0);
           Zero     : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end Add_Sub_4_bit;

architecture Structural of Add_Sub_4_bit is
    signal B_inter : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal S_inter : STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
    B_inter(0) <= B_AS(0) XOR CTRL;
    B_inter(1) <= B_AS(1) XOR CTRL;
    B_inter(2) <= B_AS(2) XOR CTRL;
    B_inter(3) <= B_AS(3) XOR CTRL;

    RCA_inst : entity work.RCA_4
        port map(A => A_AS, B => B_inter, C_in => CTRL, S => S_inter, C_out => OverFlow);

    S_AS <= S_inter;
    Zero <= '1' when S_inter = "0000" else '0';
end Structural;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.cpu_types.all;

entity AU is
    Port( I1        : in  data_bus;
          I2        : in  data_bus;
          O         : out data_bus;
          Overflow  : out std_logic;
          Zero      : out std_logic;
          Operation : in  Operation_Sel);
end AU;

architecture Behavioral of AU is
    signal AS_CTRL : std_logic;
begin
    process(Operation) begin
        case Operation is
            when AU_SUB_SIGNAL => AS_CTRL <= '1';
            when others => AS_CTRL <= '0';
        end case;
    end process;
    
    Adder_Sub_Inst : entity work.Add_Sub_4_bit 
        port map(A_AS => I1, B_AS => I2, CTRL => AS_CTRL, S_AS => O, Zero => Zero, OverFlow => Overflow);
end Behavioral;