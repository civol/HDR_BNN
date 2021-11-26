`timescale 1 ns/10 ps

module popcount1_bench;
   parameter VWIDTH = 8;
   parameter CWIDTH = 4;

   reg[VWIDTH-1:0] ivec;
   wire[CWIDTH-1:0] ovec;
   reg[CWIDTH-1:0] ovec_exp;

   popcount1 #(VWIDTH,CWIDTH) popcountI(ivec,ovec);

   initial begin
       ivec     = 8'b00000000;
       ovec_exp = 4'b0000;
       #10;
       ivec     = 8'b00000001;
       ovec_exp = 4'b0001;
       #10;
       ivec     = 8'b00000010;
       ovec_exp = 4'b0001;
       #10;
       ivec     = 8'b10000000;
       ovec_exp = 4'b0001;
       #10;
       ivec     = 8'b11111111;
       ovec_exp = 4'b1000;
       #10;
       ivec     = 8'b11111110;
       ovec_exp = 4'b0111;
       #10;
       ivec     = 8'b01010101;
       ovec_exp = 4'b0100;
       #10;
   end

endmodule
