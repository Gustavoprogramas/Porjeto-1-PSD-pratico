library ieee;
use ieee.std_logic_1164.all;

entity tb_comparador is
    port (
        SW   : in  std_logic_vector(10 downto 0);
        LEDR : out std_logic_vector(2 downto 0)
    );
end tb_comparador;

architecture bhv of tb_comparador is
    component comparador
        port (
            A   : in  std_logic_vector(3 downto 0);
            B   : in  std_logic_vector(3 downto 0);
            Equ : out std_logic;
            Grt : out std_logic;
            Lst : out std_logic
        );
    end component;
begin
    U1: comparador port map (
        A   => SW(10 downto 7),
        B   => SW(6 downto 3),
        Equ => LEDR(0),
        Grt => LEDR(1),
        Lst => LEDR(2)
    );
end bhv;
