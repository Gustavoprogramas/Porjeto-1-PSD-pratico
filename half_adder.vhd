library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port (
        A, B : in std_logic;
        S, Cout : out std_logic
    );
end half_adder;

architecture logic of half_adder is
begin
    S <= A XOR B;
    Cout <= A AND B;
end logic;