`timescale 1 ns/10 ps

module bnn_pipe12_bench;
   `include "check12_bench.v"

   reg clk,rst;

   reg[WIDTH0-1:0] vecX;
   wire[WIDTH2-1:0] vecO;
   reg[WIDTH2-1:0] vecO_exp;

   bnn_pipe12 bnn_pipe12I(clk,rst,vecX,vecO);

   initial begin
       clk = 0;
       #15;
       rst = 1;
       #20;
       rst = 0;
       #20;
       vecX = VECXS[WIDTH0*1-1:WIDTH0*0];
       
       #20;
       vecX = VECXS[WIDTH0*2-1:WIDTH0*1];
       #10;
       vecO_exp = VECOS[WIDTH2*1-1:WIDTH2*0];
       #10;
       vecX = VECXS[WIDTH0*3-1:WIDTH0*2];
       #10;
       vecO_exp = VECOS[WIDTH2*2-1:WIDTH2*1];
       #10;
       vecX = VECXS[WIDTH0*4-1:WIDTH0*3];
       #10;
       vecO_exp = VECOS[WIDTH2*3-1:WIDTH2*2];
       #10;
       vecX = VECXS[WIDTH0*5-1:WIDTH0*4];
       #10;
       vecO_exp = VECOS[WIDTH2*4-1:WIDTH2*3];
       #10;
       vecX = VECXS[WIDTH0*6-1:WIDTH0*5];
       #10;
       vecO_exp = VECOS[WIDTH2*5-1:WIDTH2*4];
       #10;
       vecX = VECXS[WIDTH0*7-1:WIDTH0*6];
       #10;
       vecO_exp = VECOS[WIDTH2*6-1:WIDTH2*5];
       #10;
       vecX = VECXS[WIDTH0*8-1:WIDTH0*7];
       #10;
       vecO_exp = VECOS[WIDTH2*7-1:WIDTH2*6];
       #10;
       vecX = VECXS[WIDTH0*9-1:WIDTH0*8];
       #10;
       vecO_exp = VECOS[WIDTH2*8-1:WIDTH2*7];
       #10;
       vecX = VECXS[WIDTH0*10-1:WIDTH0*9];
       #10;
       vecO_exp = VECOS[WIDTH2*9-1:WIDTH2*8];
       #10;
       vecO_exp = VECOS[WIDTH2*10-1:WIDTH2*9];
       #20;
   end

   always #10 clk=~clk;

endmodule
