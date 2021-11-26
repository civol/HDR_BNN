`timescale 1 ns/10 ps

module bmac_bench;
   parameter VWIDTH = 8;
   parameter CWIDTH = 4;

   reg[VWIDTH-1:0] vecA, vecB;
   wire[CWIDTH-1:0] vecP;
   reg[CWIDTH-1:0] vecP_exp;

   bmac #(VWIDTH,CWIDTH) bmacI(vecA,vecB,vecP);

   initial begin
       vecA     = 8'b00000000;
       vecB     = 8'b00000000;
       vecP_exp = 4'b1000;
       #10;
       vecA     = 8'b00000001;
       vecB     = 8'b00000000;
       vecP_exp = 4'b0111;
       #10;
       vecA     = 8'b11111111;
       vecB     = 8'b00000000;
       vecP_exp = 4'b0000;
       #10;
       vecA     = 8'b00000000;
       vecB     = 8'b11111111;
       vecP_exp = 4'b0000;
       #10;
       vecA     = 8'b10101010;
       vecB     = 8'b11111111;
       vecP_exp = 4'b0100;
       #10;
       vecA     = 8'b10101010;
       vecB     = 8'b11001100;
       vecP_exp = 4'b0100;
       #10;
   end

endmodule
