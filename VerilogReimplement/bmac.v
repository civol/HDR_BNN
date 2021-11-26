`timescale 1 ns/10 ps

module bmac(vecA,vecB,vecP);
   parameter VWIDTH = 0;
   parameter CWIDTH = 0;

   input[VWIDTH-1:0] vecA, vecB;
   output[CWIDTH-1:0] vecP;

   wire[VWIDTH-1:0] xnors;

   assign xnors = ~(vecA ^ vecB);

   popcount1 #(VWIDTH,CWIDTH) popcountI(xnors,vecP);
endmodule
