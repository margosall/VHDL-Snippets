library ieee; 
use ieee.std_logic_1164.all;

entity clock is
    port ( CLK: out std_logic );
end clock;
architecture behavior of clock is
    begin
    process begin
        CLK <= '1'; wait for 10 ns;
        CLK <= '0'; wait for 10 ns;
    end process;
end behavior;