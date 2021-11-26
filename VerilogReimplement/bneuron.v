`timescale 1 ns/10 ps

module bneuron(vecX,a);
   parameter VWIDTH = 0;
   parameter CWIDTH = 0;
   parameter VECW = 0;
   parameter BIAS = 0;

   input[VWIDTH-1:0] vecX;
   output a;

   wire[CWIDTH-1:0] z;

   bmac #(VWIDTH,CWIDTH) bmacI(vecX,VECW,z);
   bact#(CWIDTH) bactI(z,BIAS,a);

endmodule
