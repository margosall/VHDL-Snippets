library IEEE;
use ieee.std_logic_1164.all;

entity comparator_when is 
    Port (
        a : in std_logic_vector(1 downto 0); -- 2 bits
        b : in std_logic_vector(1 downto 0); -- 2 bits
        equal : out std_logic;
        greater : out std_logic;
        lesser : out std_logic
    );
end comparator_when;

architecture behavioral of comparator_when is
signal output : std_logic_vector(2 downto 0);
begin
        output <= "010" when a & b = X"0" else
                  "001" when a & b = X"1" else
                  "001" when a & b = X"2" else
                  "001" when a & b = X"3" else
                  "100" when a & b = X"4" else
                  "010" when a & b = X"5" else
                  "001" when a & b = X"6" else
                  "001" when a & b = X"7" else
                  "100" when a & b = X"8" else
                  "100" when a & b = X"9" else
                  "010" when a & b = X"A" else
                  "001" when a & b = X"B" else
                  "100" when a & b = X"C" else
                  "100" when a & b = X"D" else
                  "100" when a & b = X"E" else
                  "010" when a & b = X"F";
        lesser <= output(0);
        equal <= output(1);
        greater <= output(2);

end behavioral;
