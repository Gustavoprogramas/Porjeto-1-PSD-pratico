library ieee;
use ieee.std_logic_1164.all;
use work.pacote_ula.all; -- Importando os 4 componentes exigidos

entity ULA is
    port (
        A        : in  std_logic_vector(3 downto 0);
        B        : in  std_logic_vector(3 downto 0);
        AluOp    : in  std_logic_vector(2 downto 0);
        Result   : out std_logic_vector(3 downto 0);
        Zero     : out std_logic;
        Overflow : out std_logic;
        CarryOut : out std_logic;
        Equ      : out std_logic;
        Grt      : out std_logic;
        Lst      : out std_logic
    );
end ULA;

architecture structural of ULA is

    -- Sinais para roteamento
    signal B_xor      : std_logic_vector(3 downto 0);
    signal res_soma   : std_logic_vector(3 downto 0);
    signal res_mult   : std_logic_vector(3 downto 0);
    signal result_mux : std_logic_vector(3 downto 0);
    
    -- Sinais para captura de flags
    signal cout_int, ovf_int : std_logic;
    signal equ_int, grt_int, lst_int : std_logic;

begin

    
    B_xor(0) <= B(0) xor AluOp(0);
    B_xor(1) <= B(1) xor AluOp(0);
    B_xor(2) <= B(2) xor AluOp(0);
    B_xor(3) <= B(3) xor AluOp(0);

    INST_SOMADOR: somador_4bits port map (
        A         => A,
        B         => B_xor,
        Cin       => AluOp(0), -- + 1 na subtração complemento de 2
        Resultado => res_soma,
        Cout      => cout_int,
        Overflow  => ovf_int
    );

    INST_MULT: multiplicador_2bits port map (
        a      => A(1 downto 0),
        b      => B(1 downto 0),
        result => res_mult
    );

    INST_COMP: comparador port map (
        a   => A,
        b   => B,
        equ => equ_int,
        grt => grt_int,
        lst => lst_int
    );


    with AluOp select --MUX baseado no valor dos SW0 - SW2
        result_mux <= (A and B) when "001", -- Porta AND
                      (A or B)  when "010", -- Porta OR
                      (not B)   when "011", -- Porta NOT
                      res_soma  when "100", -- Soma
                      res_soma  when "101", -- Subtração
                      res_mult  when "110", -- Multiplicação
                      "0000"    when others; -- NOP 

    Result <= result_mux;

-- flags para zerar o resultado do visor
    Zero     <= '1'       when (result_mux = "0000" and AluOp /= "000") else '0';
    CarryOut <= cout_int  when (AluOp = "100" or AluOp = "101") else '0';
    Overflow <= ovf_int   when (AluOp = "100" or AluOp = "101") else '0';
    
    Equ      <= equ_int   when (AluOp = "111") else '0';
    Grt      <= grt_int   when (AluOp = "111") else '0';
    Lst      <= lst_int   when (AluOp = "111") else '0';

end structural;
