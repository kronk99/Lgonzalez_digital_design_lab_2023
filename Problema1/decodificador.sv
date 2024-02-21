module decodificador(input logic a, b, c, d, output logic v, w, x, y, z);
assign v = (a & b ) | (a & c);
assign w = a & !b & !c ;
assign x = (!a & b ) | (b & c);
assign y = (!a & c) | (a & b & !c);
assign z = d;

endmodule