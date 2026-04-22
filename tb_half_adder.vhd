library ieee;
use ieee.std_logic_1164.all;

entity tb_half_adder is
    end tb_half_adder;
    
    architecture simulacao of tb_half_adder is
        component half_adder port (
            A, B : in std_logic;
            S, Cout : out std_logic
        );
        end component;
signal A_tb, B_tb : std_logic := '0';
signal S_tb, Cout_tb : std_logic;
begin
    DUT: half_adder port map (
        A => A_tb,
        B => B_tb,
        S => S_tb,
        Cout => Cout_tb
    );
process
begin
    A_tb <= '0'; B_tb <= '0'; wait for 100ps;
    A_tb <= '0'; B_tb <= '1'; wait for 100ps;
    A_tb <= '1'; B_tb <= '0'; wait for 100ps;
    A_tb <= '1'; B_tb <= '1'; wait for 100ps;
    wait;
    end process;
end simulacao;
