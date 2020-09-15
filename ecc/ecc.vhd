library ieee;
use ieee.std_logic_1164.all;

entity ecc is
    port(
        di : in std_logic_vector(3 downto 0);
        pi : in std_logic_vector(2 downto 0);
        do : out std_logic_vector(3 downto 0);
        po : out std_logic_vector(2 downto 0)
        );
end entity;

architecture structural of ecc is
    component parity_check is
        port(
            d : in std_logic_vector(3 downto 0);
            p : in std_logic_vector(2 downto 0);
            r : out std_logic_vector(2 downto 0)
            );
    end component;
    signal r : std_logic_vector(2 downto 0);
begin
    pc_ecc : component parity_check port map(d=>di,p=>pi,r=>r);

    do(0) <= di(0) xor ((not(r(2)) and r(1)) and r(0));
    do(1) <= di(1) xor ((r(2) and not(r(1))) and r(0));
    do(2) <= di(2) xor ((r(2) and r(1)) and not(r(0)));
    do(3) <= di(3) xor ((r(2) and r(1)) and r(0));

    po(0) <= pi(0) xor ((r(2) nor r(1)) and r(0));
    po(1) <= pi(1) xor ((r(2) nor r(0)) and r(1));
    po(2) <= pi(2) xor ((r(1) nor r(0)) and r(2));

end structural;