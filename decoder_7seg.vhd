library ieee;
use ieee.std_logic_1164.all;

entity decoder_7seg is
    port (
        bin : in  std_logic_vector(3 downto 0);
        seg : out std_logic_vector(6 downto 0) -- segmentos a até g
    );
end decoder_7seg;

architecture bhv of decoder_7seg is
begin
    
    process(bin)
    begin
        case bin is
            when "0000" => seg <= "0000001";
				
				
				when "0001" => seg <= "1001111";
				when "0010" => seg <= "0010010";
				when "0011" => seg <= "0000110";
				when "0100" => seg <= "1001100";
				when "0101" => seg <= "0100100";
				when "0110" => seg <= "0100000";--
				when "0111" => seg <= "0001111";--
				when "1000" => seg <= "1111111";
				when "1001" => seg <= "0001111"; --arrumado ate aqui
				when "1010" => seg <= "0100000"; --aqui usa o hex 7, arrumar!
				when "1011" => seg <= "0100100";--
				when "1100" => seg <= "1001100";--
				when "1101" => seg <= "0000110";--
				when "1110" => seg <= "0010010";
				when "1111" => seg <= "1001111"; 
        end case;
    end process;
end bhv;