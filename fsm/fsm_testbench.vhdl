-- edgeDetector_VisualTest.vhd
-- Moore and Mealy visual test

library ieee;
use ieee.std_logic_1164.all; 

entity fsm_test is
end fsm_test;

architecture arch of fsm_test is     

    component fsm is
    port(
        clk, reset : in std_logic;
        P : in std_logic;
        R: out std_logic 
    );
    end component;
    
    component clock is
        port ( clk: out std_logic );
    end component;

    signal clki: std_logic;
    constant reset : std_logic := '0';

    signal R : std_logic;
    signal P : std_logic;

    begin
    CLK1 : clock port map(clki);

    FSM1 : fsm
        port map (clki, reset, P, R);

                    stim_proc: process
                    begin
                        P <= '1';
                        wait for 30 ns;
                        -- assert R = 1
                        wait for 10 ns;
                        P <= '0';
                        wait for 10 ns;
                        P <= '1';
                        wait for 30 ns;
                        -- assert R = 1
                        wait for 20 ns;
                        wait;
                    end process;
end arch; 
    