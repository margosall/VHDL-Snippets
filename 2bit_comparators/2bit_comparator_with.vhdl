library IEEE;
use ieee.std_logic_1164.all;

entity comparator_with is 
    Port (
        a : in std_logic_vector(1 downto 0); -- 2 bits
        b : in std_logic_vector(1 downto 0); -- 2 bits
        equal : out std_logic;
        greater : out std_logic;
        lesser : out std_logic
    );
end comparator_with;

architecture behavioral of comparator_with is
signal output : std_logic_vector(2 downto 0);
signal ab : std_logic_vector(3 downto 0);
begin
    -- Concatenate signal for evaluation
    ab <= a & b;

    with ab select output <= 
                "010" when X"0",
                "001" when X"1",
                "001" when X"2",
                "001" when X"3",
                "100" when X"4",
                "010" when X"5",
                "001" when X"6",
                "001" when X"7",
                "100" when X"8",
                "100" when X"9",
                "010" when X"A",
                "001" when X"B",
                "100" when X"C",
                "100" when X"D",
                "100" when X"E",
                "010" when X"F",
                "000" when others;

    -- Map internal signal to outputs
    lesser <= output(0);
    equal <= output(1);
    greater <= output(2);

end behavioral;
