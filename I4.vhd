library ieee;
use ieee.std_logic_1164.all;


entity Inverter4 is
    port (
            inBits: in std_logic_vector(3 downto 0);
            outBits: out std_logic_vector(3 downto 0);
         );
end entity Inverter4;


architecture Inverter4Basic is Inverter4 is
begin
    outBits(0) <= not inBits(0);
    outBits(1) <= not inBits(1);
    outBits(2) <= not inBits(2);
    outBits(3) <= not inBits(3);
end Inverter4Basic;

