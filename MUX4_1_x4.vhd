library ieee;
use ieee.std_logic_1164.all;

entity MUX4_1_x4 is
    port(
            sig_A: in std_logic_vector(3 downto 0);
            sig_B: in std_logic_vector(3 downto 0);
            sig_C: in std_logic_vector(3 downto 0);
            sig_D: in std_logic_vector(3 downto 0);
            
            sig_sel: in std_logic_vector(1 downto 0);
            
            sig_Y: out std_logic_vector(3 downto 0);
        );
end MUX4_1_x4;


architecture MUX4_1_x4_A of MUX4_1_x4 is
begin
    sig_Y(0) <= ((nor sig_sel) and sig_A(0)) or ((sig_sel(0) and (xor sig_sel)) and sig_B(0)) or ((sig_sel(1) and (xor sig_sel)) and sig_C(0)) or ((and sig_sel) and sig_D(0));
    sig_Y(1) <= ((nor sig_sel) and sig_A(1)) or ((sig_sel(0) and (xor sig_sel)) and sig_B(1)) or ((sig_sel(1) and (xor sig_sel)) and sig_C(1)) or ((and sig_sel) and sig_D(1));
    sig_Y(2) <= ((nor sig_sel) and sig_A(2)) or ((sig_sel(0) and (xor sig_sel)) and sig_B(2)) or ((sig_sel(1) and (xor sig_sel)) and sig_C(2)) or ((and sig_sel) and sig_D(2));
    sig_Y(3) <= ((nor sig_sel) and sig_A(3)) or ((sig_sel(0) and (xor sig_sel)) and sig_B(3)) or ((sig_sel(1) and (xor sig_sel)) and sig_C(3)) or ((and sig_sel) and sig_D(3));
end MUX4_1_x4_A;
