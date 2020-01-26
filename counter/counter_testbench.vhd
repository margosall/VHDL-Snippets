library ieee; 
use ieee.std_logic_1164.all;

entity counter_testbench is
end counter_testbench;

architecture behavior of counter_testbench is

    component clock is
        port ( CLK: out std_logic );
    end component;

    component byte_counter is
        Port (  RST : in STD_LOGIC;
                CLK : in STD_LOGIC;
                O : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    constant rsti : std_logic := '0';
    signal byte_out : std_logic_vector(7 downto 0):=X"00";
    signal clki : std_logic;

    begin
    clk1 : clock port map(clki);
    count : byte_counter port map(
        rsti,
        clki,
        byte_out
    );

end behavior;