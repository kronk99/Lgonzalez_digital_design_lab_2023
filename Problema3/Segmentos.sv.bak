module Segmentos(input logic [4:0] bcd, output logic [6:0] seg);
  always_comb begin 
    case (bcd)
      5'b00000: seg = 7'b0000001; //numero 0
      5'b00001: seg = 7'b1001111; //numero 1
      5'b00010: seg = 7'b0010010;	//numero2
      5'b00011: seg = 7'b0000110; //numero3
      5'b00100: seg = 7'b1001100; //num 4
      5'b00101: seg = 7'b0100100; //num5
      5'b00110: seg = 7'b0100000;//num6
      5'b00111: seg = 7'b0001111;//num7
      5'b01000: seg = 7'b0000000;//num8
      5'b01001: seg = 7'b0000100;//num9
		5'b10000: seg = 7'b0001000;//A hex 10
		5'b10001: seg = 7'b1100000;//B hex 11
		5'b10010: seg = 7'b0110001;//C    12
		5'b10011: seg = 7'b1000010;//D    13
		5'b10100: seg = 7'b0110000;//E    14
		5'b10101: seg = 7'b0111000;//F 15
      default: seg = 7'b1111111;
    endcase
  end
endmodule