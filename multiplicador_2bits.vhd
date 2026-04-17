library ieee;
use ieee.std_logic_1164.all;

entity multiplicador_2bits is
    port (
        A, B : in std_logic_vector(1 downto 0);
        resultado : out std_logic_vector(3 downto 0)
    );
end multiplicador_2bits;

architecture estrutura of multiplicador_2bits is
    component half_adder
        port (
            A, B : in std_logic;
            S, Cout : out std_logic
        );
    end component;
    
signal porta00, porta10, porta01, porta11 : std_logic;
signal c1, c2, : std_logic;

begin
    porta00 <= A(0) AND B(0);
    porta10 <= A(1) AND B(0);
    porta01 <= A(0) AND B(1);
    porta11 <= A(1) AND B(1);
    
    resultado(0) <= porta00;
    
    HA1 : half_adder port map ( --bit 1 que soma o p10 com a p01
        A => porta10,
        B => porta01,
        S => resultado(1),
        Cout => c1
    );
    
    HA2 : half_adder port map ( -- soma p11 com o carry da coluna anterior
        A => porta11,
        B => c1,
        S => resultado(2),
        Cout => c2
    );
    
    resultado(3) <= c2; --carry final que soboru da coluna 2 eh o ultimo bit


end estrutura;