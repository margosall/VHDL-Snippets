library ieee; 
use ieee.std_logic_1164.all;

entity byte_register is
    Port (
           D : in std_logic_vector(7 downto 0);
           Q : out std_logic_vector(7 downto 0) := X"00";
           CLK : in std_logic;
           EN : in std_logic);
end byte_register;


architecture Behavioral of byte_register is
begin
    process (clk) begin
        if(EN = '1') then
            if (rising_edge(clk)) then 
                    Q <= D;
            end if;
        end if;
    end process;
end Behavioral;