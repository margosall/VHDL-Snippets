library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity multiplier_testbench is
end multiplier_testbench;

architecture behavioral of multiplier_testbench is
    component multiplier is
        port(
          a, b : in std_logic_vector(SIZE-1 downto 0);
          output : out std_logic_vector(SIZE*2-1 downto 0)
        ); 
    end component;

    signal ai,bi : std_logic_vector(SIZE-1 downto 0);
    signal oi : std_logic_vector(SIZE*2-1 downto 0);

begin
    multi: multiplier port map(ai,bi,oi);
    stim_proc: process
    begin
        ai <= X"0"; bi <= X"0"; wait for 1 ns; assert oi = X"00" report "3*2 failed";
        ai <= X"3"; bi <= X"2"; wait for 1 ns; assert oi = X"06" report "3*2 failed";
        ai <= X"2"; bi <= X"3"; wait for 1 ns; assert oi = X"06" report "2*3 failed";
        ai <= X"2"; bi <= X"2"; wait for 1 ns; assert oi = X"04" report "2*2 failed";
        ai <= X"3"; bi <= X"3"; wait for 1 ns; assert oi = X"09" report "3*3 failed";
        ai <= X"D"; bi <= X"A"; wait for 1 ns; assert oi = X"82" report "13*10 failed";
        ai <= X"F"; bi <= X"F"; wait for 1 ns; assert oi = X"E1" report "15*15 failed";
        -- ai <= X"FF"; bi <= X"FF"; wait for 1 ns; assert oi = X"FE01" report "15*15 failed";

        report "Multiplier testbench finished";
        wait;
    end process;


end behavioral;

