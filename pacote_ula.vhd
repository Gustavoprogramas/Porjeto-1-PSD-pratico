library ieee;
use ieee.std_logic_1164.all;

package pacote_ula is

    -- somador
    component full_adder
        port (
            A, B, Cin : in std_logic;
            S, Cout   : out std_logic
        );
    end component;

    --  Somador de 2 números de 4 bits
    component somador_4bits
        port (
            A        : in  std_logic_vector(3 downto 0);
            B        : in  std_logic_vector(3 downto 0);
            Cin      : in  std_logic;
            Resultado: out std_logic_vector(3 downto 0);
            Cout     : out std_logic;
            Overflow : out std_logic
        );
    end component;

    -- Multiplicador de 2 bits
    component multiplicador_2bits
        port (
            a      : in  std_logic_vector(1 downto 0);
            b      : in  std_logic_vector(1 downto 0);
            result : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Comparador de 4 bits
    component comparador
        port (
            a   : in  std_logic_vector(3 downto 0);
            b   : in  std_logic_vector(3 downto 0);
            equ : out std_logic;
            grt : out std_logic;
            lst : out std_logic
        );
    end component;

end pacote_ula;