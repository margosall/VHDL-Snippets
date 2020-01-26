library ieee; 
use ieee.std_logic_1164.all;

entity register_testbench is
end register_testbench;

architecture behavior of register_testbench is

    component clock is
        port ( CLK: out std_logic );
    end component;

    component byte_register is
        Port (
            D : in std_logic_vector(7 downto 0);
            Q : out std_logic_vector(7 downto 0);
            CLK : in std_logic;
            EN : in std_logic);
     end component;

    signal en : std_logic := '1';
    signal clki : std_logic;


    signal reg_in : std_logic_vector(7 downto 0):=X"A5";
    signal reg_out : std_logic_vector(7 downto 0):=X"00";

    begin
    clk1 : clock port map(clki);
    reg1 : byte_register port map(
        reg_in,
        reg_out,
        clki,
        en
    );

end behavior;