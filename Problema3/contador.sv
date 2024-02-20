module contador #(parameter N = 4) //parametro cambiable
  (input logic clk, // Entrada del reloj
   input logic rst, // Entrada de reset 
   output logic [N-1:0] q); // Salida del contador de N bits

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
  always_ff @(posedge clk or posedge rst)
    if (rst)
      count <= 0; // Reset asincrónico
    else
      count <= next_count; // Incremento del contador

  // Lógica para incrementar el contador
  /*otro ciclo while, si el reset esta en high, el siguiente contador es 0
  si no le suma 1 al next count*/
  always_ff @(posedge clk)
    if (rst)
      next_count <= 0; // Reset asincrónico
    else
      next_count <= count + 1; // Incremento del contador

  // Asignación de la salida del contador
  assign q = count; //la salida es count.

endmodule