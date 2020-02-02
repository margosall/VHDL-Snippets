-- Simple Moore fsm based on 
-- https://www.allaboutcircuits.com/technical-articles/implementing-a-finite-state-machine-in-vhdl/

library ieee;
use ieee.std_logic_1164.all; 

entity fsm is
port(
    clk, reset : in std_logic;
    P : in std_logic;
    R: out std_logic 
);
end fsm;

architecture arch of fsm is 
    type state_type is (A, B,C,D); -- 2 states are required for Mealy
    signal State : state_type;
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            State <= A;
        elsif(rising_edge(clk)) then
            case State is 
            when A =>  -- set 'tick = 1' if state = zero and level = '1'
                if P = '1' then -- if level is 1, then go to state one,
                    State <= B; -- otherwise remain in same state.
                end if; 
            when B =>  
                if P = '1' then  -- if level is 0, then go to zero state,
                    State <= C; -- otherwise remain in one state.
                end if;
            when C =>
                if P = '1' then  -- if level is 0, then go to zero state,
                    State <= D; -- otherwise remain in one state.
                end if;
            when D =>
                if P = '1' then  -- if level is 0, then go to zero state,
                    State <= B; -- otherwise remain in one state.
                else
                    State <= A;
                end if;
            WHEN others =>
                State <= A;
            end case; 
        end if; 
    end process;

    R <= '1' WHEN State=D ELSE '0';
end arch; 