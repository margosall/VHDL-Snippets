library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity uart_tb is
end uart_tb;

architecture behavioral of uart_tb is

COMPONENT uart IS
GENERIC(
    clk_freq		:	INTEGER		:= 50_000_000;	--frequency of system clock in Hertz
    baud_rate	:	INTEGER		:= 19_200;		--data link baud rate in bits/second
    os_rate		:	INTEGER		:= 16;			--oversampling rate to find center of receive bits (in samples per baud period)
    d_width		:	INTEGER		:= 8; 			--data bus width
    parity		:	INTEGER		:= 1;				--0 for no parity, 1 for parity
    parity_eo	:	STD_LOGIC	:= '0');			--'0' for even, '1' for odd parity
PORT(
    clk		:	IN		STD_LOGIC;										--system clock
    reset_n	:	IN		STD_LOGIC;										--ascynchronous reset
    tx_ena	:	IN		STD_LOGIC;										--initiate transmission
    tx_data	:	IN		STD_LOGIC_VECTOR(d_width-1 DOWNTO 0);  --data to transmit
    rx			:	IN		STD_LOGIC;										--receive pin
    rx_busy	:	OUT	STD_LOGIC;										--data reception in progress
    rx_error	:	OUT	STD_LOGIC;										--start, parity, or stop bit error detected
    rx_data	:	OUT	STD_LOGIC_VECTOR(d_width-1 DOWNTO 0);	--data received
    tx_busy	:	OUT	STD_LOGIC;  									--transmission in progress
    tx			:	OUT	STD_LOGIC);										--transmit pin
END COMPONENT;

component clock is
    port ( CLK: out std_logic );
end component;
    signal clki : std_logic := 'Z';
    constant rst :std_logic := '1';

    signal chr1 : std_logic_vector (7 downto 0) := X"A7";
    constant chr2 : std_logic_vector (7 downto 0) := X"B6";

    signal tx_latch1 :std_logic:='0';
    signal rx_in1 : std_logic;
    signal rx_status1:std_logic;
    signal rx_error1:std_logic;
    signal rx_data1:std_logic_vector(7 downto 0);
    signal tx_busy1:std_logic;
    signal tx1:std_logic;

    signal tx_latch2 :std_logic:='0';
    signal rx_in2 : std_logic;
    signal rx_status2 : std_logic;
    signal rx_error2 : std_logic;
    signal rx_data2 : std_logic_vector(7 downto 0);
    signal tx_busy2 : std_logic;
    signal tx2 : std_logic;
    
    type character_string is array ( 0 to 6 ) of std_logic_vector( 7 downto 0 );
    constant str :  character_string  :=  (X"48",X"65",X"6C",X"6C",X"6F",X"0D",X"0A");

    type state_type is (Send1,Send2, Sending);
    signal State : state_type;


begin
    clk_gen : clock port map(clki);
    transceiver1 : uart port map(
        clk => clki,
        reset_n => rst,
        tx_ena => tx_latch1,
        tx_data => chr1,
        rx => rx_in1,
        rx_busy => rx_status1,
        rx_error => rx_error1,
        rx_data => rx_data1,
        tx_busy => tx_busy1,
        tx => tx1
    );

    transceiver2 : uart port map(
        clk => clki,
        reset_n => rst,
        tx_ena => tx_latch2,
        tx_data => chr2,
        rx => rx_in2,
        rx_busy => rx_status2,
        rx_error => rx_error2,
        rx_data => rx_data2,
        tx_busy => tx_busy2,
        tx => tx2
    );
    rx_in1 <= tx2;
    rx_in2 <= tx1;

    sender_ctrl:  process(clki)
    variable char_count : integer range 0 to 7; 

    begin
        if(rising_edge(clki)) then
            case State is
            when Send1 =>
                if tx_busy1 = '0' then
                    chr1 <= str(char_count);
                    tx_latch1 <= '1';
                    char_count := char_count + 1;
                    State <= Send2;
                end if;
            when Send2 =>
                tx_latch1 <= '0';
                State <= Sending;
            when Sending =>
                if tx_busy1 = '0' then
                    State <= Send1;
                end if ;
            end case;
        end if;
    end process sender_ctrl;

end behavioral;