library ieee;
use ieee.std_logic_1164.all;

entity MUX4_1_x4 is
    port(
            sig_A: in std_logic_vector(3 downto 0);
            sig_B: in std_logic_vector(3 downto 0);
            sig_C: in std_logic_vector(3 downto 0);
            sig_D: in std_logic_vector(3 downto 0);
            
            sig_S1: in std_logic;
            sig_S0: in std_logic;
            
            sig_Y: out std_logic_vector(3 downto 0)
        );
end MUX4_1_x4;


architecture MUX4_1_x4_A of MUX4_1_x4 is
component MUX4_1
        port(
            sig_sel1: in std_logic;
            sig_sel0: in std_logic;
            sig_A: in std_logic;
            sig_B: in std_logic;
            sig_C: in std_logic;
            sig_D: in std_logic;
            sig_out: out std_logic
        );
end component; 

begin
    -- sig_Y(0) <= ((nor sig_sel) and sig_A(0)) or ((sig_sel(0) and (xor sig_sel)) and sig_B(0)) or ((sig_sel(1) and (xor sig_sel)) and sig_C(0)) or ((and sig_sel) and sig_D(0));
    -- sig_Y(1) <= ((nor sig_sel) and sig_A(1)) or ((sig_sel(0) and (xor sig_sel)) and sig_B(1)) or ((sig_sel(1) and (xor sig_sel)) and sig_C(1)) or ((and sig_sel) and sig_D(1));
    -- sig_Y(2) <= ((nor sig_sel) and sig_A(2)) or ((sig_sel(0) and (xor sig_sel)) and sig_B(2)) or ((sig_sel(1) and (xor sig_sel)) and sig_C(2)) or ((and sig_sel) and sig_D(2));
    -- sig_Y(3) <= ((nor sig_sel) and sig_A(3)) or ((sig_sel(0) and (xor sig_sel)) and sig_B(3)) or ((sig_sel(1) and (xor sig_sel)) and sig_C(3)) or ((and sig_sel) and sig_D(3));
    sig_Y0: MUX4_1 port map (sig_S1, sig_S0, sig_A(0), sig_B(0), sig_C(0), sig_D(0), sig_Y(0));
    sig_Y1: MUX4_1 port map (sig_S1, sig_S0, sig_A(1), sig_B(1), sig_C(1), sig_D(1), sig_Y(1));
    sig_Y2: MUX4_1 port map (sig_S1, sig_S0, sig_A(2), sig_B(2), sig_C(2), sig_D(2), sig_Y(2));
    sig_Y3: MUX4_1 port map (sig_S1, sig_S0, sig_A(3), sig_B(3), sig_C(3), sig_D(3), sig_Y(3));
end MUX4_1_x4_A;
