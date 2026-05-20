library ieee;
use ieee.std_logic_1164.all;

entity somador_4bits is
    port (
        A        : in  std_logic_vector(3 downto 0);
        B        : in  std_logic_vector(3 downto 0);
        Cin      : in  std_logic;
        Resultado: out std_logic_vector(3 downto 0);
        Cout     : out std_logic;
        Overflow : out std_logic
    );
end somador_4bits;

architecture structural of somador_4bits is

    component full_adder
        port (
            A, B, Cin : in std_logic;
            S, Cout   : out std_logic
        );
    end component;

    signal c      : std_logic_vector(2 downto 0);
    signal cout_f : std_logic;

begin
    FA0: full_adder port map (A => A(0), B => B(0), Cin => Cin,  S => Resultado(0), Cout => c(0));
    FA1: full_adder port map (A => A(1), B => B(1), Cin => c(0), S => Resultado(1), Cout => c(1));
    FA2: full_adder port map (A => A(2), B => B(2), Cin => c(1), S => Resultado(2), Cout => c(2));
    FA3: full_adder port map (A => A(3), B => B(3), Cin => c(2), S => Resultado(3), Cout => cout_f);

    Cout <= cout_f;
    Overflow <= c(2) xor cout_f;

end structural;