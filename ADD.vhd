library ieee;
use ieee.std_logic_1164.all;


entity ADD is
    port(
            sig_a: in std_logic;
            sig_b: in std_logic;
            cin: in std_logic;
            sig_c: out std_logic;
            cout: out std_logic
    );
end ADD;

architecture ADD_A of ADD is
begin
    sig_c <= sig_a xor sig_b xor cin;
    cout <= (sig_a and sig_b) or (sig_a and cin) or (sig_b and cin);
end ADD_A;
