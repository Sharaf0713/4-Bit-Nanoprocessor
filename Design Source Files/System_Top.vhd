library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity System_Top is
    Port ( 
        Clk      : in  STD_LOGIC; -- 100MHz board clock (W5)
        Res      : in  STD_LOGIC; -- Reset button (Center Button U18)
        LED      : out STD_LOGIC_VECTOR (3 downto 0); -- LD0 to LD3
        seg      : out STD_LOGIC_VECTOR (6 downto 0); -- 7-Segment Cathodes
        an       : out STD_LOGIC_VECTOR (3 downto 0); -- 7-Segment Anodes
        Zero     : out STD_LOGIC; -- LD14
        Overflow : out STD_LOGIC  -- LD15
    );
end System_Top;

architecture Behavioral of System_Top is
    signal slow_clk_sig : std_logic;
    signal data_out     : std_logic_vector(3 downto 0);
begin

    -- 1. Slow down the 100MHz clock
    Clock_Divider : entity work.Slow_Clk
        port map (
            Clk_in  => Clk,
            Clk_out => slow_clk_sig
        );

    -- 2. Instantiate the Nanoprocessor using the Slow Clock
    CPU : entity work.Nanoprocessor
        port map (
            Clk      => slow_clk_sig,
            Res      => Res,
            Overflow => Overflow,
            Zero     => Zero,
            Data     => data_out
        );

    -- 3. Route the R7 data to the 7-Segment LUT
    Seven_Seg : entity work.SevenSegmentLUT
        port map (
            address => data_out,
            data    => seg
        );

    -- 4. Route the R7 data directly to the LEDs
    LED <= data_out;

    -- 5. Turn on only the right-most 7-segment digit (Active Low)
    an <= "1110"; 

end Behavioral;