library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ecc_tb is 
end entity;
architecture behavioral of ecc_tb is
    component parity_gen is
        port(
            d : in std_logic_vector(3 downto 0);
            p : out std_logic_vector(2 downto 0)
            );
    end component;

    component parity_check is
        port(
            d : in std_logic_vector(3 downto 0);
            p : in std_logic_vector(2 downto 0);
            r : out std_logic_vector(2 downto 0)
            );
    end component;

    component ecc is
        port(
            di : in std_logic_vector(3 downto 0);
            pi : in std_logic_vector(2 downto 0);
            do : out std_logic_vector(3 downto 0);
            po : out std_logic_vector(2 downto 0)
            );
    end component;

    signal p : std_logic_vector(2 downto 0);

    signal di : std_logic_vector(3 downto 0);
    signal pi : std_logic_vector(2 downto 0);

    signal dc : std_logic_vector(3 downto 0);
    signal pc : std_logic_vector(2 downto 0);

    signal r : std_logic_vector(2 downto 0);

    signal vdc : std_logic_vector(3 downto 0);
    signal vpc : std_logic_vector(2 downto 0);
    signal rcheck : std_logic_vector(2 downto 0);

begin
    vpc <= pc xor p;
    pg1 : component parity_gen port map(d=>di,p=>p);
    pc1 : component parity_check port map(d=>di,p=>pi,r=>r);
    ecc1: component ecc port map (di=>di,pi=>pi,do=>dc,po=>pc);


stim: process
begin
    di <= "0001";
    wait for 1 ns;
    pi <= p;
    wait for 1 ns;

    for i in 0 to 2 loop
        if I = 0 then
            pi(I) <= pi(I) xor '1';
        else
            pi(I downto I-1) <= pi(I downto I-1) xor "11";
        end if;
        wait for 1 ns;

        assert r(I) & pc = "1011" report "parity repair " & integer'image(I) & " failed";
    end loop;

    pi <= p;
    rcheck <= "011";
    wait for 1 ns;
    
    for i in 0 to 3 loop
        if I = 0 then
            di(I) <= di(I) xor '1';
        else
            di(I downto I-1) <= di(I downto I-1) xor "11";
        end if;
        wait for 1 ns;
        assert dc = "0001" report "data repair " & integer'image(I) & " failed";
        assert r = rcheck report "parity fail check " & integer'image(I) & " failed";

        if I < 2 then
            rcheck(2-I downto 1-I) <= rcheck(2-I downto 1-I) xor "11";
        elsif I = 2 then
            rcheck(0) <= rcheck(0) xor '1';
        end if;

    end loop;


    report "Testbench finished!";
    wait;
end process;

end behavioral;