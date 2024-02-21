library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--EL ERROR ESTABA EN QUE TODOS LOS COMPONENTES TIENEN QUE TENER EL MISMO NOMBRE
--ES DECIR RESUL EN SUMADOR DEBE SER EL MISMO QUE EN SEGMENTOS
entity Interfaz is
port
	(
		--Puertos de entrada
		A,B	: in std_logic_vector(3 downto 0); --entrada es un num de 4 bits
		
		--Puertos de salida
		--Cout  : out std_logic; --acarreo de la ultima suma
		--Resul : out std_logic_vector(3 downto 0); --resultados S
		segmento1, segmento2 : out std_logic_vector(6 downto 0)
	);
end Interfaz;

architecture Behavioral of Interfaz is
   -- signal A, B : std_logic_vector(3 downto 0);
    signal Cout : std_logic;
    signal Resul : std_logic_vector(3 downto 0);
    --signal segmento1, segmento2 : std_logic_vector(6 downto 0);

    -- Componente Sumador
    component sumador
        port (
            A, B : in std_logic_vector(3 downto 0);
            Cout : out std_logic;
            Resul : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Componente Segmentos
    component segmentos
        port (
            Resul : in std_logic_vector(3 downto 0);
            Cout : in std_logic;
            segmento1, segmento2 : out std_logic_vector(6 downto 0)
        );
    end component;

begin 
    -- Instancia del Sumador
    UUT_Sumador : sumador port map (A, B, Cout, Resul);

    -- Instancia del Segmentos
    UUT_Segmentos : segmentos port map (Resul, Cout, segmento1, segmento2);


end Behavioral;

