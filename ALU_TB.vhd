library IEEE;
use ieee.std_logic_1164.all;
use STD.textio.all;
use ieee.std_logic_textio.all;


entity ALU_TB is
end ALU_TB;


architecture ALU_TB_SIM of ALU_TB is
    component alu_4
        port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            S0 : in std_logic;
            S1 : in std_logic;
            G : out std_logic_vector(3 downto 0);
            Cout : in std_logic
        );
    end component;

    signal clock: std_logic;
begin
    clock: process
    begin
        clock <= '0','1' after 5 ns;
        wait for 10 ns;
    end clock;


    test_suite: process
        file infile : text is in "ALU_IN.txt";
        file outfile: text is out "ALU_OUT.txt";
        variable buf_in: line;
        varibale buf_out: line;

        signal sig_A: std_logic_vector(3 downto 0);
        signal sig_B: std_logic_vector(3 downto 0);
        signal Cin: std_logic;
        signal S0: std_logic;
        signal S1: std_logic;
        signal G: std_logic_vector(3 downto 0);
        signal Cout: std_logic;
        signal _: std_logic;
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
        while not (endfile(infile)) loop
            readline(infile, buf_in);
            read(buf_in, S1);
            read(buf_in, _);
            read(buf_in, S0);
            read(buf_in, _);
            read(buf_in, sig_A);
            read(buf_in, _);
            read(buf_in, sig_B);
            read(buf_in, _);
            read(buf_in, Cin);

            wait until falling_edge(clk);

            write(buf_out, G);
            write(buf_out, Cout);
            writeline(outfile, buf_out);
        end loop;
    wait;
    end test_suite;
end ALU_TB_SIM;
