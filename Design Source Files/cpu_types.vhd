library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package cpu_types is
    subtype data_bus is std_logic_vector(3 downto 0);
    subtype register_address is std_logic_vector(2 downto 0);
    subtype instruction_address is std_logic_vector(2 downto 0);
    subtype instruction_bus is std_logic_vector(11 downto 0);
    
    type Operation_Sel is (AU_ADD_SIGNAL, AU_SUB_SIGNAL, LU_AND_SIGNAL, LU_OR_SIGNAL);
    type data_buses is array (0 to 7) of data_bus;
end package cpu_types;