----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2019 08:46:37 PM
-- Design Name: 
-- Module Name: rom - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom is
    Generic(
        size : integer := 4
    );
    Port ( addr : in std_logic_vector (7 downto 0);
           data : out std_logic_vector (7 downto 0) := X"00";
           clk : in std_logic );
end rom;

architecture Behavioral of rom is
    type  ROMtype  is array(size-1 downto 0) of std_logic_vector(7 downto 0);
    constant memory_arr :  ROMtype  :=  (X"6C",X"6C",X"65",X"48");
    signal addr_int : std_logic_vector(size/2-1 downto 0) := (others => '0');
begin
    PROCESS(clk)
    BEGIN
        IF(rising_edge(CLK)) THEN
            data <= memory_arr(to_integer(Unsigned(addr(size/2-1 downto 0))));

        END IF;
    END PROCESS;
end Behavioral;
