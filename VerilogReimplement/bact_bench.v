`timescale 1 ns/10 ps

module bact_bench;
   parameter WIDTH = 4;

   reg[3:0] x,b;
   wire o;
   reg o_exp;

   bact #(WIDTH) bactI(x,b,o);

   initial begin
       x     = 4'b0000;
       b     = 4'b0000;
       o_exp = 1'b1;
       #10;
       x     = 4'b0011;
       b     = 4'b0111;
       o_exp = 1'b1;
       #10;
       x     = 4'b0000;
       b     = 4'b1101;
       o_exp = 1'b0;
       #10;
       x     = 4'b1111;
       b     = 4'b1100;
       o_exp = 1'b1;
       #10;
       x     = 4'b1011;
       b     = 4'b0111;
       o_exp = 1'b0;
   end

endmodule
