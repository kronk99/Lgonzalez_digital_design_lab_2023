library IEEE;
	use ieee.std_logic_1164.all;
entity sumador1bit is
	port
	(
		--Puertos de entrada
		A,B,Cin	: in std_logic; --entrada es un num de 4 bits
		
		--Puertos de salida
		Cout  : out std_logic; --acarreo de la ultima suma
		Resul : out std_logic --resultados S
	);
end sumador1bit;
architecture Behavioral of sumador1bit is
begin 
	Cout <= (A and B) or(A and Cin) or (B and Cin);
	Resul <= A xor B xor Cin;
end Behavioral;