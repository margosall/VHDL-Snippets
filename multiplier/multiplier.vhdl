library ieee; 
use ieee.std_logic_1164.all;
use work.constants.all;

entity multiplier is
    port(
      a, b : in std_logic_vector(SIZE-1 downto 0);
      output : out std_logic_vector(SIZE*2-1 downto 0)
    ); 
end multiplier;

architecture structure of multiplier is

    component nbit_adder is
        port(
            a, b : in std_logic_vector(SIZE-1 downto 0);
            ci: in std_logic;
            s : out std_logic_vector(SIZE-1 downto 0);
            co: out std_logic
        );
    end component;

    constant carry_zero : std_logic := '0';

    signal result_int : std_logic_vector(SIZE-1 downto 0);

    signal carry_int : std_logic_vector(SIZE-1 downto 0);
    type results_array is array (0 to SIZE) of std_logic_vector(SIZE-1 downto 0);
    signal r : results_array := (others=>(others=>'0'));
    signal carry_sum_int : results_array := (others=>(others=>'0'));
    signal a_int: results_array := (others=>(others=>'0'));

    begin

    with b(0) select  a_int(0) <= 
        a when '1', 
        (others => '0') when others;
    carry_sum_int(1) <= "0" & a_int(0)(SIZE-1 downto 1);
    result_int(0) <= a_int(0)(0);

    GEN_MULTIPLIER: for I in 1 to SIZE-1 generate


        MULTI_X : if I>0 generate
        MX: nbit_adder port map
            (carry_sum_int(I), a_int(I), carry_zero,r(I), carry_int(I));
            with b(I) select  a_int(I) <= 
                a when '1', 
                (others => '0') when others;
            carry_sum_int(I+1) <= carry_int(I) & r(I)(SIZE-1 downto 1);

            result_int(I) <= r(I)(0);
        end generate MULTI_X;
    
    end generate GEN_MULTIPLIER;

    output <= carry_int(SIZE-1) & r(SIZE-1)(SIZE-1 downto 1) & result_int;

end architecture;