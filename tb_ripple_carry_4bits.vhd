library ieee;
use ieee.std_logic_1164.all;

entity tb_ripple_carry_4bits is
    end tb_ripple_carry_4bits;

    architecture simulacao of tb_ripple_carry_4bits is
        component ripple_carry_4bits port (
            A, B : in std_logic_vector(3 downto 0);
            Operation : in std_logic;
            Resultado : out std_logic_vector(3 downto 0);
            Cout : out std_logic;
            Overflow : out std_logic
        );
        end component;
        signal A_tb, B_tb : std_logic_vector(3 downto 0); := "0000";
        signal Operation_tb : std_logic := '0';
        signal Resultado_tb : std_logic_vector (3 downto 0);
        signal Cout_tb, Overflow_tb : std_logic;
        begin
            DUT: ripple_carry_4bits port map (
                A => A_tb,
                B => B_tb,
                Operation => Operation_tb,
                Resultado => Resultado_tb,
                Cout => Cout_tb,
                Overflow => Overflow_tb
            );
            process begin
                A_tb <= "0010"; B_tb <= "0011"; Operation_tb <= '0'; wait for 100ps; --soma sem overflow
                A_tb <= "0111"; B_tb <= "0001"; Operation_tb <= '0'; wait for 100ps; --soma com overflow
                A_tb <= "0101"; B_tb <= "0011"; Operation_tb <= '1'; wait for 100ps; --subtração sem overflow
                A_tb <= "0011"; B_tb <= "0101"; Operation_tb <= '1'; wait for 100ps; --subtração gerando negativo
                wait;
            end process;
    end simulacao;

