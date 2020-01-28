library IEEE;
use ieee.std_logic_1164.all;

entity comparator_testbench is
end comparator_testbench;
    
architecture behavioral of comparator_testbench is

    component comparator_logic is 
        Port (
            a : in std_logic_vector(1 downto 0); -- 2 bits
            b : in std_logic_vector(1 downto 0); -- 2 bits
            equal : out std_logic;
            greater : out std_logic;
            lesser : out std_logic
        );
    end component;

    component comparator_when is 
        Port (
            a : in std_logic_vector(1 downto 0); -- 2 bits
            b : in std_logic_vector(1 downto 0); -- 2 bits
            equal : out std_logic;
            greater : out std_logic;
            lesser : out std_logic
        );
    end component;

    component comparator_with is 
        Port (
            a : in std_logic_vector(1 downto 0); -- 2 bits
            b : in std_logic_vector(1 downto 0); -- 2 bits
            equal : out std_logic;
            greater : out std_logic;
            lesser : out std_logic
        );
    end component;

    signal a : std_logic_vector(1 downto 0);
    signal b : std_logic_vector(1 downto 0);
    signal ab :std_logic_Vector(3 downto 0);

    signal equal : std_logic_vector(2 downto 0);
    signal greater : std_logic_vector(2 downto 0);
    signal lesser : std_logic_vector(2 downto 0);

    -- signal error : std_logic_vector(2 downto 0);

    begin
    a <= ab(3 downto 2);
    b <= ab(1 downto 0);

    comp_logic : comparator_logic   port map (a,b,equal(0),greater(0),lesser(0));
    comp_when : comparator_when     port map (a,b,equal(1),greater(1),lesser(1));
    comp_with : comparator_with     port map (a,b,equal(2),greater(2),lesser(2));

    -- error(0) <= not((not(equal(0)) and not(equal(1)) and not(equal(2))) or 
    --             (equal(0) and equal(1) and equal(2)));
    -- error(1) <= not((not(greater(0)) and not(greater(1)) and not(greater(2))) or 
    --             (greater(0) and greater(1) and greater(2)));
    -- error(2) <= not((not(lesser(0)) and not(lesser(1)) and not(lesser(2))) or 
    --             (lesser(0) and lesser(1) and lesser(2)));

    sim_proc: process
    begin
        ab <= X"0"; wait for 1 ns; assert equal & greater & lesser = "111" & "000" & "000" report "0 0 failed";
        ab <= X"1"; wait for 1 ns; assert equal & greater & lesser = "000" & "000" & "111" report "0 1 failed";
        ab <= X"2"; wait for 1 ns; assert equal & greater & lesser = "000" & "000" & "111" report "0 1 failed";
        ab <= X"3"; wait for 1 ns; assert equal & greater & lesser = "000" & "000" & "111" report "0 3 failed";
        ab <= X"4"; wait for 1 ns; assert equal & greater & lesser = "000" & "111" & "000" report "1 0 failed";
        ab <= X"5"; wait for 1 ns; assert equal & greater & lesser = "111" & "000" & "000" report "1 1 failed";
        ab <= X"6"; wait for 1 ns; assert equal & greater & lesser = "000" & "000" & "111" report "1 2 failed";
        ab <= X"7"; wait for 1 ns; assert equal & greater & lesser = "000" & "000" & "111" report "1 3 failed";
        ab <= X"8"; wait for 1 ns; assert equal & greater & lesser = "000" & "111" & "000" report "2 0 failed";
        ab <= X"9"; wait for 1 ns; assert equal & greater & lesser = "000" & "111" & "000" report "2 1 failed";
        ab <= X"A"; wait for 1 ns; assert equal & greater & lesser = "111" & "000" & "000" report "2 2 failed";
        ab <= X"B"; wait for 1 ns; assert equal & greater & lesser = "000" & "000" & "111" report "2 3 failed";
        ab <= X"C"; wait for 1 ns; assert equal & greater & lesser = "000" & "111" & "000" report "3 0 failed";
        ab <= X"D"; wait for 1 ns; assert equal & greater & lesser = "000" & "111" & "000" report "3 1 failed";
        ab <= X"E"; wait for 1 ns; assert equal & greater & lesser = "000" & "111" & "000" report "3 2 failed";
        ab <= X"F"; wait for 1 ns; assert equal & greater & lesser = "111" & "000" & "000" report "3 3 failed";

        report "Comparator testbench finished";
        wait;
    end process;

end behavioral;