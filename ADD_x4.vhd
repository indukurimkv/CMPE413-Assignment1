library IEEE;
use ieee.std_logic_1164.all;

entity ADD_x4 is
    port(
            sig_x, sig_y: in std_logic_vector(3 downto 0); -- 4-bit input operands
            cin: in std_logic; -- carry in

            sig_g: out std_logic_vector(3 downto 0); -- 4-bit output
            cout: out std_logic -- carry out
        );
end ADD_x4;


architecture ADD_x4_A of ADD_X4 is
    -- wires to route carrout from one adder to carry in of next
    signal cin_1, cin_2, cin_3: std_logic;
    -- The 1-bit adder component
    component ADD
        port(
                sig_a: in std_logic;
                sig_b: in std_logic;
                cin: in std_logic;
                sig_c: out std_logic;
                cout: out std_logic
        );
    end component;
begin
    -- Use 4 1-bit adders and route carry signals to form 4-bit adder
    ADD_x4_INST0 : ADD port map (sig_x(0), sig_y(0), cin, sig_g(0), cin_1);
    ADD_x4_INST1 : ADD port map (sig_x(1), sig_y(1), cin_1, sig_g(1), cin_2);
    ADD_x4_INST2 : ADD port map (sig_x(2), sig_y(2), cin_2, sig_g(2), cin_3);
    ADD_x4_INST3 : ADD port map (sig_x(3), sig_y(3), cin_3, sig_g(3), cout);
end ADD_x4_A;
