library IEEE;
use ieee.std_logic_1164.all;
use STD.textio.all;
use ieee.std_logic_textio.all;


entity ALU_TB is
end ALU_TB;


architecture ALU_TB_SIM of ALU_TB is
    component alu_4 is
        port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            S0 : in std_logic;
            S1 : in std_logic;
            G : out std_logic_vector(3 downto 0);
            Cout : in std_logic;
        );
    end alu_4;
begin

end ALU_TB_SIM;
