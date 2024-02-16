module Segmentos(input logic [4:0] bcd, output logic [6:0] seg);
  always_comb begin
    case (bcd)
      5'b00000: seg = 7'b0000001;
      5'b00001: seg = 7'b1001111;
      5'b00010: seg = 7'b0010010;
      5'b00011: seg = 7'b0000110;
      5'b00100: seg = 7'b1001100;
      5'b00101: seg = 7'b0100100;
      5'b00110: seg = 7'b0100000;
      5'b00111: seg = 7'b0001111;
      5'b01000: seg = 7'b0000000;
      5'b01001: seg = 7'b0000100;
      default: seg = 7'b1111111;
    endcase
  end
endmodule
