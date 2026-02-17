library ieee;
use ieee.std_logic_1164.all;


entity ADD is
    port(
            sig_a: in std_logic; -- First operand
            sig_b: in std_logic; -- Second operand
            cin: in std_logic; -- Carry in input
            sig_c: out std_logic; -- Output bit
            cout: out std_logic -- Carry out
    );
end ADD;

architecture ADD_A of ADD is
begin
    -- Set output and carry based on reduced expression from truth table
    sig_c <= sig_a xor sig_b xor cin;
    cout <= (sig_a and sig_b) or (sig_a and cin) or (sig_b and cin);
end ADD_A;
