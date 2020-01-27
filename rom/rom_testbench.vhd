library ieee; 
use ieee.std_logic_1164.all;

entity rom_testbench is
end rom_testbench;

architecture behavior of rom_testbench is

    component clock is
        port ( CLK: out std_logic );
    end component;

    component byte_counter is
        Port (  RST : in STD_LOGIC;
                CLK : in STD_LOGIC;
                O : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component rom is

        Port ( addr : in std_logic_vector (7 downto 0);
               data : out std_logic_vector (7 downto 0);
               clk : in std_logic );
    
    end component;

    constant rsti : std_logic := '0';
    signal clki : std_logic;
    signal counter_out : std_logic_vector(7 downto 0):=X"00";
    signal byte_out : std_logic_vector(7 downto 0):=X"00";

    begin
    clk_gen : clock port map(clki);
    counter : byte_counter port map(
        rsti,
        clki,
        counter_out
    );
    rom1 : rom port map (
        counter_out,
        byte_out,
        clki
    );

end behavior;
