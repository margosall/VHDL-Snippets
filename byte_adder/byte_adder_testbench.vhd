library ieee;
use ieee.std_logic_1164.all;

entity byte_adder_testbench is
end byte_adder_testbench;

architecture behavior of byte_adder_testbench is
    component byte_adder is
    port(
        a, b : in std_logic_vector(7 downto 0);
        ci: in std_logic;
        s : out std_logic_vector(7 downto 0);
        co: out std_logic
    ); 
    end component;
    signal input  : std_logic_vector(16 downto 0);
    signal output : std_logic_vector(8 downto 0);
begin

    ba: byte_adder 
        port map(
            a => input(7 downto 0),
            b => input(15 downto 8),
            ci => input(16),
            s => output(7 downto 0),
            co => output(8)
        );
    stim_proc: process
    begin
        input <= "0" & X"0000"; wait for 1 ns; assert output = "0" & X"00" report "0+0+0 failed";
        input <= "0" & X"0302"; wait for 1 ns; assert output = "0" & X"05" report "2+3+0 failed";
        input <= "1" & X"0302"; wait for 1 ns; assert output = "0" & X"06" report "2+3+1 failed";
        input <= "0" & X"0A0A"; wait for 1 ns; assert output = "0" & X"14" report "10+10+0 failed";
        input <= "1" & X"FFFF"; wait for 1 ns; assert output = "1" & X"FF" report "0xFF+0xFF+1 failed";

        report "Full adder testbench finished";
        wait;
    end process;

end behavior;