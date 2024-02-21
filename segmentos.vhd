library IEEE;
use ieee.std_logic_1164.all;

entity segmentos is
    port
    (
        -- Puertos de entrada
        Resul: in std_logic_vector(3 downto 0); -- entrada es un número de 4 bits

        -- Puertos de salida
        Cout: in std_logic; -- acarreo de la última suma, necesito que sea in para hacer
        -- la suma
        -- ahora, para representar las sumas, el máximo en una suma es
        -- 15+15, dado que es una suma de números de 4 bits
        segmento1: out std_logic_vector(6 downto 0); -- resultados S
        segmento2: out std_logic_vector(6 downto 0)
    );
end segmentos;

architecture Behavioral of segmentos is
    signal suma: std_logic_vector(4 downto 0);

begin
    process (suma)
    begin
        suma(4) <= Cout;
        suma(3) <= Resul(3);
        suma(2) <= Resul(2);
        suma(1) <= Resul(1);
        suma(0) <= Resul(0);

        case suma is
            when "00000" =>
                segmento1 <= "0000001";
                segmento2 <= "0000001";
            when "00001" =>
                segmento1 <= "1001111"; --1
                segmento2 <= "0000001";
            when "00010" =>
                segmento1 <= "0010010"; --2
                segmento2 <= "0000001";
            when "00011" =>
                segmento1 <= "0000110"; --3
                segmento2 <= "0000001";
            when "00100" =>
                segmento1 <= "1001100"; --4
                segmento2 <= "0000001";
            when "00101" =>
                segmento1 <= "0100100"; --5
                segmento2 <= "0000001";
            when "00110" =>
                segmento1 <= "0100000"; --6
                segmento2 <= "0000001";
            when "00111" =>
                segmento1 <= "0001111"; --7
                segmento2 <= "0000001";
            when "01000" =>
                segmento1 <= "0000000"; --8
                segmento2 <= "0000001";
            when "01001" =>
                segmento1 <= "0000100"; --9
                segmento2 <= "0000001";
            when "01010" =>
                segmento1 <= "0001000"; --A
                segmento2 <= "0000001";
            when "01011" =>
                segmento1 <= "1100000"; --B
                segmento2 <= "0000001";
            when "01100" =>
                segmento1 <= "0110001"; --C
                segmento2 <= "0000001";
            when "01101" =>
                segmento1 <= "1000010"; --D
                segmento2 <= "0000001";
            when "01110" =>
                segmento1 <= "0110000"; --E
                segmento2 <= "0000001";
            when "01111" =>
                segmento1 <= "0111000"; --F
                segmento2 <= "0000001";
            -- hasta acá el segmento 2 sigue siendo siempre 0
            when "10000" =>
                segmento1 <= "0000001"; --16 10
                segmento2 <= "1001111";
            when "10001" =>
                segmento1 <= "1001111"; --17 X 11
                segmento2 <= "1001111";
            when "10010" =>
                segmento1 <= "0010010"; --18 X 12
                segmento2 <= "1001111";
            when "10011" =>
                segmento1 <= "0000110"; --19--1A 13
                segmento2 <= "1001111";
            when "10100" =>
                segmento1 <= "1001100"; --20 14
                segmento2 <= "1001111";
            when "10101" =>
                segmento1 <= "0100100"; --21 c 15
                segmento2 <= "1001111";
            when "10110" =>
                segmento1 <= "0100000"; --22 D 16
                segmento2 <= "1001111";
            when "10111" =>
                segmento1 <= "0001111"; --23E 17
                segmento2 <= "1001111";
            when "11000" =>
                segmento1 <= "0000000"; --24F 18
                segmento2 <= "1001111";
            when "11001" =>
                segmento1 <= "0000100"; --2519
                segmento2 <= "1001111";
            when "11010" =>
                segmento1 <= "0001000"; --26 1 A X
                segmento2 <= "1001111";
            when "11011" =>
                segmento1 <= "1100000"; --27 1B
                segmento2 <= "1001111";
            when "11100" =>
                segmento1 <= "0110001"; --28 1C X
                segmento2 <= "1001111";
            when "11101" =>
                segmento1 <= "1000010"; --29 1dX
                segmento2 <= "1001111";
            when "11110" =>
                segmento1 <= "0110000"; --30 1e X
                segmento2 <= "1001111";
            when others =>
                -- EN CASO DE ERORR, SE PRESENTA 88 EN AMBOS SEGMENTOS
                segmento1 <= "0000000";
                segmento2 <= "0000000";
        end case;
    end process;

end Behavioral;
