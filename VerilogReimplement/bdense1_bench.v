`timescale 1 ns/10 ps

module bdense1_bench;
   `include "check1_bench.v"

   reg[IWIDTH-1:0] vecX;
   wire[OWIDTH-1:0] vecO;
   reg[OWIDTH-1:0] vecO_exp;

   bdense1 bdenseI(vecX,vecO);

   initial begin
       vecX = VECXS[IWIDTH*1-1:IWIDTH*0];
       vecO_exp = VECOS[OWIDTH*1-1:OWIDTH*0];
       #10;
       vecX = VECXS[IWIDTH*2-1:IWIDTH*1];
       vecO_exp = VECOS[OWIDTH*2-1:OWIDTH*1];
       #10;
       vecX = VECXS[IWIDTH*3-1:IWIDTH*2];
       vecO_exp = VECOS[OWIDTH*3-1:OWIDTH*2];
       #10;
       vecX = VECXS[IWIDTH*4-1:IWIDTH*3];
       vecO_exp = VECOS[OWIDTH*4-1:OWIDTH*3];
       #10;
       vecX = VECXS[IWIDTH*5-1:IWIDTH*4];
       vecO_exp = VECOS[OWIDTH*5-1:OWIDTH*4];
       #10;
       vecX = VECXS[IWIDTH*6-1:IWIDTH*5];
       vecO_exp = VECOS[OWIDTH*6-1:OWIDTH*5];
       #10;
       vecX = VECXS[IWIDTH*7-1:IWIDTH*6];
       vecO_exp = VECOS[OWIDTH*7-1:OWIDTH*6];
       #10;
       vecX = VECXS[IWIDTH*8-1:IWIDTH*7];
       vecO_exp = VECOS[OWIDTH*8-1:OWIDTH*7];
       #10;
       vecX = VECXS[IWIDTH*9-1:IWIDTH*8];
       vecO_exp = VECOS[OWIDTH*9-1:OWIDTH*8];
       #10;
       vecX = VECXS[IWIDTH*10-1:IWIDTH*9];
       vecO_exp = VECOS[OWIDTH*10-1:OWIDTH*9];
       #10;
   end

endmodule
