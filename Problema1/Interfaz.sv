module Interfaz(input logic a, b, c, d, output logic [6:0] salida);
  // Se instancian señales de salida del primer modulo
  logic v, w, x, y, z;

  // se intancian las entradas de entrada del primer modulo
  logic [4:0] resultado;

  // Instancia del primer módulo (decodificador)
  decodificador miDecodificador (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .v(v),
    .w(w),
    .x(x),
    .y(y),
    .z(z)
  );

  // Lógica para formar el array resultado
  always_comb begin
    resultado[4:0] = {v, w, x, y, z};  // Concatenación de v, w, x, y, z en resultado[4:0]
  end

  // Instancia del segundo módulo (segmentos)
  Segmentos miSegmento (
    .bcd(resultado),
    .seg(salida)
  );
endmodule