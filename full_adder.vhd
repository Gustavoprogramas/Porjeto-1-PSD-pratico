library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        A, B, Cin : in std_logic;
        S, Cout : out std_logic
    );
end full_adder;

architecture logic of full_adder is
begin
    S <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (Cin AND (A XOR B));
end logic;