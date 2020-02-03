library ieee; 
use ieee.std_logic_1164.all;

entity byte_adder is
  generic (size : integer:=8);
  port(
    a, b : in std_logic_vector(7 downto 0);
    ci: in std_logic;
    s : out std_logic_vector(7 downto 0);
    co: out std_logic
  ); 
end byte_adder;

architecture structure of byte_adder is
    -- signal c0,c1,c2,c3,c4,c5,c6 : std_logic;
    signal c : std_logic_vector(7 downto 0);

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
        -- add0: full_adder
        --     port map (a(0),b(0),ci,s(0),c0);
        -- add1: full_adder
        --     port map (a(1),b(1),c(0),s(1),c1);
        -- add2: full_adder
        --     port map (a(2),b(2),c(1),s(2),c2);
        -- add3: full_adder
        --     port map (a(3),b(3),c(2),s(3),c3);
        -- add4: full_adder
        --     port map (a(4),b(4),c(3),s(4),c4);
        -- add5: full_adder
        --     port map (a(5),b(5),c(4),s(5),c5);
        -- add6: full_adder
        --     port map (a(6),b(6),c(5),s(6),c6);
        -- add7: full_adder
        --     port map (a(7),b(7),c(6),s(7),co);


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
        
          co <= c(7);
end structure;