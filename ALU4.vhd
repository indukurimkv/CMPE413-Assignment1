library ieee;
use ieee.std_logic_1164.all;

entity alu_4 is
     port (
               A : in std_logic_vector(3 downto 0); -- 4-bit operand A
               B : in std_logic_vector(3 downto 0); -- 4-bit operand B
               Cin : in std_logic; -- carry in
               S0 : in std_logic; -- MUX select signal LSB
               S1 : in std_logic; -- MUX select signal MSB
               G : out std_logic_vector(3 downto 0); -- 4-bit output
               Cout : out std_logic -- carry out
          );
end alu_4;


architecture structural of alu_4 is
    -- 4-bit 4-1 MUX for selecting operating mode
    component MUX4_1_x4
        port(
            sig_A: in std_logic_vector(3 downto 0);
            sig_B: in std_logic_vector(3 downto 0);
            sig_C: in std_logic_vector(3 downto 0);
            sig_D: in std_logic_vector(3 downto 0);
            
            sig_S1: in std_logic;
            sig_S0: in std_logic;
            
            sig_Y: out std_logic_vector(3 downto 0)
        );
    end component;

    -- 4-bit inverter for operand B
    component Inverter4
        port (
            inBits: in std_logic_vector(3 downto 0);
            outBits: out std_logic_vector(3 downto 0)
         );
    end component;

    -- 4-bit adder
    component ADD_x4
        port(
            sig_x, sig_y: in std_logic_vector(3 downto 0);
            cin: in std_logic;

            sig_g: out std_logic_vector(3 downto 0);
            cout: out std_logic
        );
    end component;

    -- Output of MUX (based on S1S0)
    signal sig_Y: std_logic_vector(3 downto 0);
    -- Inverted operand B
    signal B_n: std_logic_vector(3 downto 0);
    -- bus_high is "1111" and low is "0000"(selected based on S1S0)
    signal bus_high, bus_low: std_logic_vector(3 downto 0);
begin
    -- Implement Mux logic by routing appropriate signals
    bus_high <= "1111";
    bus_low <= "0000";
    B_inverter: Inverter4 port map (B, B_n);
    Y_MUX: MUX4_1_x4 port map (bus_low, B, B_n, bus_high, S1, S0, sig_Y);
    ADD_Main: ADD_x4 port map(A, sig_Y, Cin, G, Cout);
end structural;
