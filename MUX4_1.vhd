library ieee;
use ieee.std_logic_1164.all;


-- 1 bit 4-1 MUX
entity MUX4_1 is
	port(
                sig_sel1: in std_logic; -- MSB of select signal
                sig_sel0: in std_logic; -- LSB of select signal
                sig_A: in std_logic; -- Signal for S1S0=00
		sig_B: in std_logic; -- Signal for S1S0=01
		sig_C: in std_logic; -- Signal for S1S0=10 
		sig_D: in std_logic; -- Signal for S1S0=11
		sig_out: out std_logic -- Output signal
	    );
end MUX4_1;


architecture MUX4_1_A of MUX4_1 is
begin
    -- 1-bit 4-1 mux logic with gates(implement based on truth table)
    sig_out <= ((sig_sel0 nor sig_sel1) and sig_A) or (((not sig_sel1) and sig_sel0) and sig_B) or (sig_sel1 and (not sig_sel0) and sig_C) or (sig_sel0 and sig_sel1 and sig_D);
end MUX4_1_A;
