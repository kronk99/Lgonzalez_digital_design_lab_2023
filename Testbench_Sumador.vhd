library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench_Sumador is --no se definen buses de entrada o salidas
end Testbench_Sumador;

architecture Behavioral of Testbench_Sumador is
    signal A, B:std_logic_vector(3 downto 0);--STD_LOGIC := '0'; --se declaran las señales que va a recibir
	 --el sumador, aca lo que esta diciendo es que la simulacion va a iniciar con valores 
	 --de a , b y el accareo en 0. a lo que entiendo se hace como buena practica
	 --para que el testbench haga predecible las demas salidas, ya luego
	 --en la asignacion de estimulos se puede cambiar.
    signal Cout : STD_LOGIC;
	 signal Resul : std_logic_vector(3 downto 0);

    component sumador --se declara el componente sumador , con sus entradas y salidas
        port(
            --Puertos de entrada
				A,B	: in std_logic_vector(3 downto 0); --entrada es un num de 4 bits
				--Puertos de salida
				Cout  : out std_logic; --acarreo de la ultima suma
				Resul : out std_logic_vector(3 downto 0) --resultados S
        );
    end component;
begin
    UUT : sumador port map(A, B, Cout,Resul); --esto lo que hace es conectar
	 --las señales a los peuertos del sumador

    -- Estímulos (input) del testbench
    process
    begin
        A <= "0000";
        B <= "0000";
        wait for 10 ns;

        A <= "1101";
        B <= "0001";
        wait for 10 ns;
		  A <= "1010";
        B <= "0111";
        wait for 10 ns;
		  A <= "0100";
        B <= "1001";
        wait;
    end process;

end Behavioral;