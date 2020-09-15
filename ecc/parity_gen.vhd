library ieee;
use ieee.std_logic_1164.all;

entity parity_gen is
    port(
        d : in std_logic_vector(3 downto 0);
        p : out std_logic_vector(2 downto 0)
        );
end entity;

architecture structural of parity_gen is

begin

    p(0) <= (d(0) xor d(1)) xor d(3);
    p(1) <= (d(0) xor d(2)) xor d(3);
    p(2) <= (d(1) xor d(2)) xor d(3);

end structural;