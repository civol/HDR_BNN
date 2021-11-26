`timescale 1 ns/10 ps

module bneuron2(vecX,a);
   parameter VWIDTH2 = 0;
   parameter CWIDTH2 = 0;
   parameter VECW2 = 0;
   parameter BIAS2 = 0;

   input[VWIDTH2-1:0] vecX;
   output a;

   wire[CWIDTH2-1:0] z;

   bmac #(VWIDTH2,CWIDTH2) bmacI(vecX,VECW2,z);
   bact#(CWIDTH2) bactI(z,BIAS2,a);

endmodule
