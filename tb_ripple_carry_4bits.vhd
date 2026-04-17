library ieee;
use ieee.std_logic_1164.all;

entity tb_ripple_carry_4bits is
    port (
        SW   : in  std_logic_vector(10 downto 0);
        LEDR : out std_logic_vector(5 downto 0)
    );
end tb_ripple_carry_4bits;

architecture bhv of tb_ripple_carry_4bits is
    
    component ripple_carry_4bits
        port (
            A, B      : in std_logic_vector(3 downto 0);
            Operation : in std_logic;
            Resultado : out std_logic_vector(3 downto 0);
            Cout      : out std_logic;
            Overflow  : out std_logic
        );
    end component;
begin
    U1: ripple_carry_4bits port map (
        A         => SW(10 downto 7),
        B         => SW(6 downto 3),
        Operation => SW(0),
        Resultado => LEDR(3 downto 0),
        Cout      => LEDR(4),
        Overflow  => LEDR(5)
    );
end bhv;
