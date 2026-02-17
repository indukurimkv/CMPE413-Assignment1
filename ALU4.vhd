library ieee;
use ieee.std_logic_1164.all;

entity alu_4 is
     port (
               A : in std_logic_vector(3 downto 0);
               B : in std_logic_vector(3 downto 0);
               Cin : in std_logic;
               S0 : in std_logic;
               S1 : in std_logic;
               G : out std_logic_vector(3 downto 0);
               Cout : out std_logic
          );
end alu_4;


architecture structural of alu_4 is
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

    component Inverter4
        port (
            inBits: in std_logic_vector(3 downto 0);
            outBits: out std_logic_vector(3 downto 0)
         );
    end component;

    component ADD_x4
        port(
            sig_x, sig_y: in std_logic_vector(3 downto 0);
            cin: in std_logic;

            sig_g: out std_logic_vector(3 downto 0);
            cout: out std_logic
        );
    end component;

    signal sig_Y: std_logic_vector(3 downto 0);
    signal B_n: std_logic_vector(3 downto 0);
    signal bus_high, bus_low: std_logic_vector(3 downto 0);
begin
    bus_high <= "1111";
    bus_low <= "0000";
    B_inverter: Inverter4 port map (B, B_n);
    Y_MUX: MUX4_1_x4 port map (bus_low, B, B_n, bus_high, S1, S0, sig_Y);
    ADD_Main: ADD_x4 port map(A, sig_Y, Cin, G, Cout);
end structural;
