library ieee; 
use ieee.std_logic_1164.all;

entity nbit_adder is
    generic (size : integer:=4);
    port(
      a, b : in std_logic_vector(size-1 downto 0);
      ci: in std_logic;
      s : out std_logic_vector(size-1 downto 0);
      co: out std_logic
    ); 
end nbit_adder;

architecture structure of nbit_adder is
    -- signal c0,c1,c2,c3,c4,c5,c6 : std_logic;
    signal c : std_logic_vector(size-1 downto 0);
    component full_adder is
    port(
        a  : in  std_logic;
        b  : in  std_logic;
        ci : in  std_logic;
        s  : out std_logic;
        co : out std_logic
    );
    end component;

    begin
        GEN_ADD: for I in 0 to size-1 generate

            FIRST_ADDER : if I = 0 generate
                U0: full_adder port map
                    (a(I),b(I),ci,s(I),c(I));
            end generate FIRST_ADDER;

            OTHER_ADDERS : if I > 0 generate
                UX: full_adder port map
                    (a(I),b(I),c(I-1),s(I),c(I));
            end generate OTHER_ADDERS;
        
        end generate GEN_ADD;
        
        co <= c(size-1);

end structure;