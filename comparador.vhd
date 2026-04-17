library ieee;
use ieee.std_logic_1164.all;

entity comparador is
    port (
        a, b : in std_logic_vector(3 downto 0);
        equ, grt, lst : out std_logic
    );
    end comparador;

    architecture programacao of comparador is
        signal i : std_logic_vector(3 downto 0); --vetor de comparacao
        signal equ_interno, grt_interno : std_logic;

    begin

        i(0) <= NOT(a(0) XOR b(0));
        i(1) <= NOT(a(1) XOR b(1));
        i(2) <= NOT(a(2) XOR b(2));
        i(3) <= NOT(a(3) XOR b(3));
        equ_interno <= i(3) AND i(2) AND i(1) AND i(0); --se todos os bits forem iguais, entao equ_interno = 1
        equ <= equ_interno; --saida

        grt_interno <= (a(3) AND NOT b(3)) OR 
                        (i(3) AND a(2) AND NOT b(2)) OR 
                        (i(3) AND i(2) AND a(1) AND NOT b(1)) OR 
                        (i(3) AND i(2) AND i(1) AND a(0) AND NOT b(0));
        grt <= grt_interno; --saida

        lst <= NOT(equ_interno or grt_interno); --se nao for igual e nem maior, entao eh menor
end programacao;
