library IEEE;
use ieee.std_logic_1164.all;

entity comparator_logic is 
    Port (
        a : in std_logic_vector(1 downto 0); -- 2 bits
        b : in std_logic_vector(1 downto 0); -- 2 bits
        equal : out std_logic;
        greater : out std_logic;
        lesser : out std_logic
    );
end comparator_logic;

architecture behavioral of comparator_logic is
    signal gi : std_logic;
    signal li : std_logic;
    begin
    greater <= not(
        not(not(b(1)) and a(1)) and
        not(not(b(1)) and not(b(0)) and a(0)) and
        not(not(b(0)) and a(1) and a(0))
        );
    lesser <= not(
        not(b(1) and not(a(1))) and
        not(b(0) and not(a(1)) and not(a(0))) and
        not(b(1) and b(0) and not(a(0)))
    );
    equal <= not(
        not(not(b(1)) and not(b(0)) and not(a(1)) and not(a(0))) and
        not(not(b(1)) and     b(0)  and not(a(1)) and     a(0))  and
        not(    b(1) and      b(0)  and     a(1)  and     a(0))  and
        not(    b(1) and not(b(0))  and     a(1)  and not(a(0)))
    );
    -- greater <= gi;
    -- lesser <= li;
    -- equal <= not(gi or li);

end behavioral;
