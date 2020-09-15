library ieee;
use ieee.std_logic_1164.all;

entity parity_check is
    port(
        d : in std_logic_vector(3 downto 0);
        p : in std_logic_vector(2 downto 0);
        r : out std_logic_vector(2 downto 0)
        );
end entity;

architecture structural of parity_check is

begin

    r(0) <= (p(0) xor d(0)) xor (d(1) xor d(3));
    r(1) <= (p(1) xor d(0)) xor (d(2) xor d(3));
    r(2) <= (p(2) xor d(1)) xor (d(2) xor d(3));

end structural;