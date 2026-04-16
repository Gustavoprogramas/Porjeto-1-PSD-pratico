library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_4bits is
    port (
        A, B : in std_logic_vector(3 downto 0);
        Operation : in std_logic;
        Resultado : out std_logic_vector(3 downto 0);
        Cout : out std_logic;
        Overflow : out std_logic
    );
end ripple_carry_4bits;

architecture structural of ripple_carry_4bits is
    component full_adder
        port (
            A, B, Cin : in std_logic;
            S, Cout : out std_logic
        );
    end component;

    signal carry : std_logic_vector(2 downto 0);
    signal b_xor : std_logic_vector(3 downto 0);
    signal Cout_f : std_logic;
    begin
        b_xor(0) <= B(0) xor Operation;
        b_xor(1) <= B(1) xor Operation;
        b_xor(2) <= B(2) xor Operation;
        b_xor(3) <= B(3) xor Operation;

        FA0: full_adder port map (A => A(0), B => b_xor(0), Cin => Operation, S => Resultado(0), Cout => carry(0));
        FA1: full_adder port map (A => A(1), B => b_xor(1), Cin => carry(0), S => Resultado(1), Cout => carry(1));
        FA2: full_adder port map (A => A(2), B => b_xor(2), Cin => carry(1), S => Resultado(2), Cout => carry(2));
        FA3: full_adder port map (A => A(3), B => b_xor(3), Cin => carry(2), S => Resultado(3), Cout => Cout_f);
        Cout <= Cout_f;
        Overflow <= carry(2) XOR Cout_f;
end structural;