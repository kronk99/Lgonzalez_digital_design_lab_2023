module contadorFPGA #(parameter N = 6, parameter F = 63)
  (input logic clk, // Entrada del reloj
   input logic rst, // Entrada de reset boton 
   input logic decremento, // Botón para decrementar
   input logic set_valor_btn, // Botón para establecer el valor inicial
   output logic [N-1:0] q, // Salida del contador de N bits
   output logic [6:0] segmentos, // Display de 7 segmentos - Digito menos significativo
   output logic [6:0] segmentos2, // Display de 7 segmentos - Digito más significativo
   output logic reset_active); // Salida indicando estado de reset activo

  logic [N-1:0] count, next_count; // Contadores internos
  logic reset_active_ff; // Flip-flop para mantener el estado del reset activo
  logic [2:0] set_valor_count; // Contador para el número de veces que se presiona el botón de establecer valor
  logic set_valor_active; // Variable para indicar si se debe establecer un nuevo valor

  always_ff @(posedge clk or posedge rst)
    if (rst)
    begin
      count <= 0;
      reset_active_ff <= 1;
      set_valor_count <= 0;
      set_valor_active <= 0;
    end
    else if (decremento && count != 0)
      count <= count - 1;
    else if (set_valor_btn && set_valor_count < F)
    begin
      set_valor_count <= set_valor_count + 1;
      set_valor_active <= 1;
      reset_active_ff <= 1; // Puedes ajustar esto según tus necesidades
    end
    else if (count != F)
    begin
      count <= next_count;
      reset_active_ff <= 0;
      set_valor_active <= 0;
    end
    else
    begin
      count <= 0;
      reset_active_ff <= 1;
      set_valor_active <= 0;
    end

  always_ff @(posedge clk)
    if (rst)
      next_count <= 0;
    else if (set_valor_active)
      next_count <= set_valor_count;
    else
      next_count <= count + 1;

  // Lógica para el display de 7 segmentos
  // Asignación de salidas
  assign q = count;
  assign reset_active = reset_active_ff;

  // Definición de la lógica para obtener la representación de 7 segmentos
  Segmentos misegmentos (
    .bcd(count),
	 .seg(segmentos),
	 .seg2(segmentos2)
  );
endmodule