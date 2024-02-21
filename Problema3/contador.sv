module contador #(parameter N = 4 ,parameter F =15) //parametro cambiable
//el F representa el numero en el cual se hará el reset, por default son 4 bits,
//entonces por default se reinicia en counter =15
  (input logic clk, // Entrada del reloj //clock esta al revez
   input logic rst, // Entrada de reset 
   output logic [N-1:0] q); // Salida del contador de N bits
//HACE FALTA HACERLE UN PARAMETRO ADICIONAL , QUE DIGA HASTA DONDE ES EL RESET
//Y QUE SI EL COUNTER ES IGUAL AL MAXIMO NUMERO, ENTONCES QUE SERESETEE
  logic [N-1:0] count, next_count; //se declaran señales internas , el count y el 
  //next count

  // en el siguiente codigo implementa los flip flops de manera automatica, no tengo que
  //construirlos en system verilog , al parecer estan construidos, entonces
  /* entonces internamente hace una aritmetica de flip flop en el clk y en el reset
  //luego de determinar, si el rst es 1 , al count lo pone en 0
  //si no incremente el count al siguiente count
  el always es un tipo de ciclo while infinito, entonces luego de pasar por el flip
  flop se reinicia, verifica cuando es 0 y cuando es 1
  */
  //hacerlo negedge para la fpga
  always_ff @(posedge clk or posedge rst) //el reset debe de hacerse con un switch
    if (rst)
      count <= 0; // Reset asincrónico
    else
		if(count != F)
		count <= next_count; // Incremento del contador
		else
			count <= 0; //reset asincrono cuando llega a ser igual al numero

  // Lógica para incrementar el contador
  /*otro ciclo while, si el reset esta en high, el siguiente contador es 0
  si no le suma 1 al next count*/
  always_ff @(posedge clk)
    if (rst)
      next_count <= 0; // Reset asincrónico
    else //preguntar si el count llego al valor establecido , si lo es se reinicia
      next_count <= count + 1; // Incremento del contador

  // Asignación de la salida del contador
  assign q = count; //la salida es count.

endmodule