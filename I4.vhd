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
    outBits <= inBits;
end Inverter4Basic;

