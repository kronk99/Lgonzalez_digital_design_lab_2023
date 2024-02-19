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
	signal c0,c1,c2: std_logic := '0'; --se inicializan los bits de acarreo en 0
	
begin 
	-- Half-Adder (HA) -- semi - sumador 0
	c0 <= A(0) and B(0); --Con este se encuentra el Cout (Acarreo )  de los bits
	--menos significativos 
	Resul(0) <= A(0) xor B(0); -- el primer resultado del numero menos significativo 
	--a xor b ,
	-- Full -Adder (FA1) o sumador completo, a partir de aca es conexion en cascada
	--con el resto 
	--SUMADOR 1
	c1 <= (A(1) and B(1)) or(A(1) and c0) or (B(1) and c0); --ESTE ES EL ACARREO COUT
	--CONSIDERE C0 COMO CIN 
	Resul(1) <= c0 xor A(1) xor B(1); --el resultado es axorbxorc 
	--FA2
	c2 <= (A(2) and B(2)) or (A(2) and c1) or (B(2) and c1);
	Resul(2) <= c1 xor A(2) xor B(2);
	
	--FA2
	Cout <= (A(3) and B(3)) or (A(3) and c2) or (B(3) and c2);
	Resul(3) <= c2 xor A(3) xor B(3);
	end concurrente;