library ieee;
use ieee.std_logic_1164.all;

-- assemble 1-bit 4-1 MUXs into 4-bit 4-1 MUX
entity MUX4_1_x4 is
    port(
            sig_A: in std_logic_vector(3 downto 0); -- Signal for S1S0=00
            sig_B: in std_logic_vector(3 downto 0); -- Signal for S1S0=01
            sig_C: in std_logic_vector(3 downto 0); -- Signal for S1S0=10
            sig_D: in std_logic_vector(3 downto 0); -- Signal for S1S0=11
            
            sig_S1: in std_logic; -- MSB of select signal
            sig_S0: in std_logic; -- LSB of select signal
            
            sig_Y: out std_logic_vector(3 downto 0) -- 4-bit output
        );
end MUX4_1_x4;


architecture MUX4_1_x4_A of MUX4_1_x4 is
-- The 1-bit 4-1 MUX component
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
    -- Map each of the 4 bits to an individual MUX, routing select signals in paralel
    sig_Y0: MUX4_1 port map (sig_S1, sig_S0, sig_A(0), sig_B(0), sig_C(0), sig_D(0), sig_Y(0));
    sig_Y1: MUX4_1 port map (sig_S1, sig_S0, sig_A(1), sig_B(1), sig_C(1), sig_D(1), sig_Y(1));
    sig_Y2: MUX4_1 port map (sig_S1, sig_S0, sig_A(2), sig_B(2), sig_C(2), sig_D(2), sig_Y(2));
    sig_Y3: MUX4_1 port map (sig_S1, sig_S0, sig_A(3), sig_B(3), sig_C(3), sig_D(3), sig_Y(3));
end MUX4_1_x4_A;
