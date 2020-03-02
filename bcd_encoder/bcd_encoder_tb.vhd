library IEEE;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

use ieee.numeric_std.all;

use work.ENC.all;

entity bcd_encoder_tb is
end bcd_encoder_tb;
    
architecture behavioral of bcd_encoder_tb is
    signal nr : integer range 0 to 9999 := 5319;
    signal n1,n2,n3,n4: integer range 0 to 9;
    signal nr1_bin:std_logic_vector(3 downto 0);

    begin
    SEG_CTRL(NR,N1,N2,N3,N4);

    stim_process : process

    begin
    
        report "Encoder test finished";
        wait for 10 ns;
        wait;
    end process;
    nr1_bin <= std_logic_vector(to_unsigned(N1,4));
end behavioral;