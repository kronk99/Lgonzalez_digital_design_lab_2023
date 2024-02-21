module testbench;

  // Parámetros del contador
  parameter N = 2;
  parameter F = 1; //el  numero al que se detiene, al ser 4 bits el maximo es 15 para
  //el reset

  // Señales de entrada y salida
  logic clk, rst;
  logic [N-1:0] q;

  // Instancia del contador
  contador #(N, F) dut (
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Generación de reloj
  initial begin
    clk = 0; //se pone el clock en 0
    forever #5 clk = ~clk; // Cambio de reloj cada 5 unidades de tiempo , 
  end

  // Inicialización del testbench
  initial begin
    // Inicialización de las señales
    rst = 0;
    q = 0;

    // Aplicación de reset
    #10 rst = 1; //cuando pasen 10 segundos, el reset se pone en 1

    // Espera un ciclo de reloj
    #5;

    // Desactivación del reset
    rst = 0;

    // Verificación del contador
    #100;
    if (q !== F) // Verifica si la salida es igual a F
      $fatal("Error: El contador no se reinició correctamente");

    // Finalización de la simulación
    $finish;
  end

endmodule