library ieee; 
use ieee.std_logic_1164.all;
use work.constants.all;

entity ram_testbench is
end ram_testbench;

architecture behavioral of ram_testbench is
    component ram is
        port(
            addr : in std_logic_vector(RAM_SIZE-1 downto 0);
            clk : in std_logic;
            write_enable : in std_logic;
            data_in : in std_logic_vector(WORD_SIZE-1 downto 0);
            data_out : out std_logic_vector(WORD_SIZE-1 downto 0)
            );
    end component;

    component clock is
        port ( CLK: out std_logic );
    end component;
    signal clki : std_logic;
    signal addri : std_logic_vector(RAM_SIZE-1 downto 0);
    signal datai : std_logic_vector(WORD_SIZE-1 downto 0);
    signal datao : std_logic_vector(WORD_SIZE-1 downto 0);
    signal we : std_logic;

    begin
        clk1 : clock port map(clki);
        ram1 : ram port map(addri,clki,we,datai,datao);
        sim_proc: process
        begin
            we <= '0';
            addri <= "00";
            datai <= (others => 'Z');
            wait for 10 ns;
            we <= '1';
            addri <= "00"; datai <= X"12"; wait for 10 ns;
            addri <= "01"; datai <= X"34"; wait for 10 ns;
            addri <= "10"; datai <= X"56"; wait for 10 ns;
            addri <= "11"; datai <= X"78"; wait for 10 ns;
            we <= '0';
            datai <= (others => 'Z');
            addri <= "00"; wait for 10 ns;
            addri <= "01"; wait for 10 ns;
            addri <= "10"; wait for 10 ns;
            addri <= "11"; wait for 10 ns;

            wait;
        end process;

end behavioral;
