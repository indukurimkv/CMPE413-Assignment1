library ieee;
use ieee.std_logic_1164.all;


entity MUX4_1 is
	port(
		sig_sel1: in std_logic;
		sig_sel0: in std_logic;
		sig_A: in std_logic;
		sig_B: in std_logic;
		sig_C: in std_logic;
		sig_D: in std_logic;
		sig_out: out std_logic;
	    );
end MUX4_1;


architecture MUX4_1_A of MUX4_1 is
begin
    -- 1-bit 4-1 mux logic with gates
    sig_out <= ((not sig_sel1) and (not sig_sel2) and sig_A) or (((not sig_sel1) and sig_sel2) and sig_B) or (sig_sel1 and (not sig_sel2) and sig_C) or sig_D;
end MUX4_1_A;
