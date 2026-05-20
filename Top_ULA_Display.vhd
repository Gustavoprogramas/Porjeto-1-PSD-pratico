library ieee;
use ieee.std_logic_1164.all;

entity Top_ULA_Display is
    port (
        SW   : in  std_logic_vector(10 downto 0);
        LEDR : out std_logic_vector(5 downto 0);
        HEX0 : out std_logic_vector(6 downto 0);
        HEX2 : out std_logic_vector(6 downto 0);
        HEX4 : out std_logic_vector(6 downto 0);
        HEX6 : out std_logic_vector(6 downto 0);
        HEX7 : out std_logic_vector(6 downto 0)
    );
end Top_ULA_Display;

architecture structural of Top_ULA_Display is

    
    component decoder_7seg
        port (
            bin : in  std_logic_vector(3 downto 0);
            seg : out std_logic_vector(6 downto 0)
        );
    end component;

    component ULA
        port (
            A        : in  std_logic_vector(3 downto 0);
            B        : in  std_logic_vector(3 downto 0);
            AluOp    : in  std_logic_vector(2 downto 0);
            Result   : out std_logic_vector(3 downto 0);
            Zero 		: out std_logic;
				Overflow 		: out std_logic;
				CarryOut 		: out std_logic;
				Equ 		: out std_logic;
				Grt		: out std_logic;
				Lst 		: out std_logic
        );
    end component;

    signal fio_resultado : std_logic_vector(3 downto 0);
    signal fio_op_padded : std_logic_vector(3 downto 0);

begin

    -- aluop tem 3 bits e o decodificador 4, sendo assim é só colocar um 0 a esquerda para virar um numero
    
    fio_op_padded <= '0' & SW(2 downto 0);

    -- aqui é nstanciando a ula e inicializando os sws
    U_ALU: ULA port map (
        A      => SW(10 downto 7),
        B      => SW(6 downto 3),
        AluOp  => SW(2 downto 0),
        Result => fio_resultado,
        Zero => LEDR(1),
		  Overflow => LEDR(2),
		  Equ => LEDR(3),
		  Grt => LEDR(4),
		  Lst => LEDR(5)
    );

    
    
    
    U_DISPLAY_OPCODE: decoder_7seg port map (
        bin => fio_op_padded,
        seg => HEX0
    );

    
    U_DISPLAY_B: decoder_7seg port map (
        bin => SW(6 downto 3),
        seg => HEX2
    );

    
    U_DISPLAY_A: decoder_7seg port map (
        bin => SW(10 downto 7),
        seg => HEX4
    );

    
   
DISPLAY_RESULT: bin_to_7seg_signed port map (
    bin   => fio_resultado,
    seg   => HEX6,
    sinal => HEX7
);

end structural;