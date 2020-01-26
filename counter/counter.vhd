library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity byte_counter is
    Port ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           O : out std_logic_vector (7 downto 0));
end byte_counter;

architecture behavioral of byte_counter is
begin

    process (clk) 
    variable counteri : std_logic_vector(7 downto 0) := X"00"; 
    begin
        if(rising_edge(CLK)) then
                counteri := counteri + 1;
                if(RST='1') then
                    counteri := X"00";
                end if;
        end if;
        O <= counteri;

    end process;
end behavioral;