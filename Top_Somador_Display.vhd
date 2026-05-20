library ieee;
use ieee.std_logic_1164.all;

entity Top_Somador_Display is
    port (
        SW   : in  std_logic_vector(10 downto 0);
        LEDR : out std_logic_vector(1 downto 0);
        HEX6 : out std_logic_vector(6 downto 0);
        HEX7 : out std_logic_vector(6 downto 0)
    );
end Top_Somador_Display;

architecture structural of Top_Somador_Display is

    component ripple_carry_4bits
        port (
            A, B      : in std_logic_vector(3 downto 0);
            Operation : in std_logic;
            Resultado : out std_logic_vector(3 downto 0);
            Cout      : out std_logic;
            Overflow  : out std_logic
        );
    end component;

    component bin_to_7seg_signed
        port (
            bin   : in  std_logic_vector(3 downto 0);
            seg   : out std_logic_vector(6 downto 0);
            sinal : out std_logic_vector(6 downto 0)
        );
    end component;

    signal fio_resultado : std_logic_vector(3 downto 0);

begin

    U_SOMADOR: ripple_carry_4bits port map (
        A         => SW(10 downto 7),
        B         => SW(6 downto 3),
        Operation => SW(0),
        Resultado => fio_resultado,
        Cout      => LEDR(0),
        Overflow  => LEDR(1)
    );

    U_DISPLAY: bin_to_7seg_signed port map (
        bin   => fio_resultado,
        seg   => HEX6,
        sinal => HEX7
    );

end structural;