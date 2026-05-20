library ieee;
use ieee.std_logic_1164.all;

entity multiplicador_2bits is
    port (
        a      : in  std_logic_vector(1 downto 0);
        b      : in  std_logic_vector(1 downto 0);
        resultado : out std_logic_vector(3 downto 0)
    );
end multiplicador_2bits;

architecture logic of multiplicador_2bits is
    -- Fio interno para calcular o bit de sinal do resultado
    signal r3_int : std_logic;
begin
    
    --Multiplicação simpless
    resultado(0) <= a(0) and b(0);

    --cruzamento de sinais
    resultado(1) <= (a(1) and b(0)) xor (a(0) and b(1));

    --sinal negativo da multiplicação
    r3_int <= (a(1) and (not b(1)) and b(0)) or ((not a(1)) and b(1) and a(0));
    resultado(3) <= r3_int;

    --caso -2 * -2 = +4 (0100)
    resultado(2) <= r3_int or (a(1) and (not a(0)) and b(1) and (not b(0)));

end logic;