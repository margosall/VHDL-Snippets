library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constants.all;

entity ram is
    port(
        addr : in std_logic_vector(RAM_SIZE-1 downto 0);
        clk : in std_logic;
        write_enable : in std_logic;
        data_in : in std_logic_vector(WORD_SIZE-1 downto 0);
        data_out : out std_logic_vector(WORD_SIZE-1 downto 0):=(others => 'Z')
    );
end ram;

architecture Behavioral of ram is 
    type RAMType is array(0 to RAM_SIZE**2-1) of std_logic_vector(WORD_SIZE-1 downto 0);
    signal memory : RAMType := (others=>(others=>'0'));
    begin

    process(clk)
    begin
        if(rising_edge(clk)) then
            if(write_enable = '1') then
                data_out <= (others => 'Z');
                memory(to_integer(unsigned(addr))) <= data_in;
            else
                data_out <= memory(to_integer(unsigned(addr)));
            end if;
        end if;

    end process;

end Behavioral;