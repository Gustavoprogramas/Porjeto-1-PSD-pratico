library ieee;
use ieee.std_logic_1164.all;

entity visor is
port (
			bin : in std_logic_vector(3 downto 0); --codigo binario
			seg : out std_logic_vector(6 downto 0) --segmentos do visor de a até g
			);
end visor;

architecture bhv of visor is
begin
		process(bin)
		begin
				case bin is
				when "0000" => seg <= "1000000";
				when "0001" => seg <= "1111001";
				when "0010" => seg <= "0100100";
				when "0011" => seg <= "0110000";
				when "0100" => seg <= "0110001";
				when "0101" => seg <= "0010010";
				when "0110" => seg <= "0000010";
				when "0111" => seg <= "1111000";
				when "1000" => seg <= "0000000";
				when "1001" => seg <= "0010000";
				when "1010" => seg <= "0001000";
				when "1011" => seg <= "0000011";
				when "1100" => seg <= "1000110";
				when "1101" => seg <= "0100001";
				when "1110" => seg <= "0000110";
				when "1111" => seg <= "0001110";
				when others => seg <= "1111111";
				end case;
			end process;
		end bhv;
