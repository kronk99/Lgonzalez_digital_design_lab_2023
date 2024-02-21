library IEEE;
	use ieee.std_logic_1164.all;
entity sumador is
	port
	(
		--Puertos de entrada
		A,B	: in std_logic_vector(3 downto 0); --entrada es un num de 4 bits
		
		--Puertos de salida
		Cout  : out std_logic; --acarreo de la ultima suma
		Resul : out std_logic_vector(3 downto 0) --resultados S
	);
end sumador;
--arquitectura concurrente es que todo el codigo se ejecuta a la vez.
architecture concurrente of sumador is
	signal C0,C1,C2,C3: std_logic := '0'; --se inicializan los bits de acarreo en 0
	component sumador1bit
        port (
            A, B,Cin : in std_logic;
            Cout : out std_logic;
            Resul : out std_logic
        );
	end component;
begin 
	--Instancia del Sumador
    UUT_Sumador1 : sumador1bit port map (A(0), B(0), C0,C1, Resul(0));
	 
    UUT_Sumador2 : sumador1bit port map (A(1), B(1), C1,C2, Resul(1));
	 
    UUT_Sumador3 : sumador1bit port map (A(2), B(2), C2,C3, Resul(2));
	 
    UUT_Sumador4 : sumador1bit port map (A(3), B(3), C3,Cout, Resul(3));--ultimo sumador
	
end concurrente;