`timescale 1 ns/10 ps

module bneuron_bench;
   parameter VWIDTH = 32;
   parameter CWIDTH = 6;

   reg[VWIDTH-1:0] vecX;
   wire a0, a1, a2, a3;
   reg a0_exp, a1_exp, a2_exp, a3_exp;

   bneuron #(VWIDTH,CWIDTH,32'b00000000000000000000000000000000,6'b000000 + 6'b110000) bneuron0I(vecX, a0);
   bneuron #(VWIDTH,CWIDTH,32'b00000000000000000000000000000001,6'b000001 + 6'b110000) bneuron1I(vecX, a1);
   bneuron #(VWIDTH,CWIDTH,32'b01010101010101010101010101010101,6'b001010 + 6'b110000) bneuron2I(vecX, a2);
   bneuron #(VWIDTH,CWIDTH,32'b11111111111111111111111111111110,6'b000101 + 6'b110000) bneuron3I(vecX, a3);

   initial begin
       vecX   = 32'b00000000000000000000000000000000;
       a0_exp = 1;
       a1_exp = 1;
       a2_exp = 1;
       a3_exp = 0;
       #10;
       vecX   = 32'b00000000000000000000000000000001;
       a0_exp = 1;
       a1_exp = 1;
       a2_exp = 1;
       a3_exp = 0;
       #10;
       vecX   = 32'b01010101010101010101010101010101;
       a0_exp = 1;
       a1_exp = 1;
       a2_exp = 1;
       a3_exp = 1;
       #10;
       vecX   = 32'b10011100011000111000010000100001;
       a0_exp = 1;
       a1_exp = 1;
       a2_exp = 1;
       a3_exp = 1;
       #10;
       vecX   = 32'b00001111000011110111000111000111;
       a0_exp = 0;
       a1_exp = 1;
       a2_exp = 1;
       a3_exp = 1;
       #10;
       vecX   = 32'b11110000001111110111110000011111;
       a0_exp = 0;
       a1_exp = 0;
       a2_exp = 1;
       a3_exp = 1;
       #10;
   end

endmodule
