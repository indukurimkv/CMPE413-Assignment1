library IEEE;
library STD;
use ieee.std_logic_1164.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
use std.env.all;


architecture ALU_TB_SIM_STDOUT of ALU_TB is
    component alu_4
        port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            S0 : in std_logic;
            S1 : in std_logic;
            G : out std_logic_vector(3 downto 0);
            Cout : out std_logic
        );
    end component;

    signal sig_A, sig_B, G: std_logic_vector(3 downto 0);
    signal clk, Cin, S0, S1, Cout: std_logic;

begin
    ALU_UT: alu_4 port map (
        sig_A,
        sig_B,
        Cin,
        S0,
        S1,
        G,
        Cout
    );

    clock: process
    begin
        clk <= '0','1' after 5 ns;
        wait for 10 ns;
    end process;


    test_suite: process
        file infile : text is in "ALU_IN.txt";
        file outfile: text is out "ALU_OUT.txt";
        variable buf_in: line;
        variable buf_out: line;

        variable sig_A_IN, sig_B_IN, G_OUT: std_logic_vector(3 downto 0);
        variable Cin_IN, S0_IN, S1_IN, Cout_OUT: std_logic;
        variable Space_IN: character;

    begin
        while not (endfile(infile)) loop
            readline(infile, buf_in);
            read(buf_in, S1_IN);
            read(buf_in, space_IN);
            read(buf_in, S0_IN);
            read(buf_in, space_IN);
            read(buf_in, sig_A_IN);
            read(buf_in, space_IN);
            read(buf_in, sig_B_IN);
            read(buf_in, space_IN);
            read(buf_in, Cin_IN);

            sig_A <= sig_A_IN; sig_B <= sig_B_IN;
            Cin <= Cin_IN; S0 <= S0_IN; S1 <= S1_IN;

            wait until falling_edge(clk);

            G_OUT := G; Cout_OUT := Cout;


            write(buf_out, G_OUT);
            write(buf_out, Space_IN);
            write(buf_out, Cout_OUT);
            writeline(output, buf_out);
        end loop;
        finish;
    end process;
end ALU_TB_SIM_STDOUT;
