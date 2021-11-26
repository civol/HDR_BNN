`timescale 1 ns/10 ps

module popcount4_bench;
   parameter VWIDTH0 = 8;
   parameter CWIDTH0 = 4;

   reg[VWIDTH0-1:0] ivec0;
   wire[CWIDTH0-1:0] ovec0;
   reg[CWIDTH0-1:0] ovec_exp0;

   popcount4 #(VWIDTH0,CWIDTH0) popcountI0(ivec0,ovec0);

   parameter VWIDTH1 = 9;
   parameter CWIDTH1 = 4;

   reg[VWIDTH1-1:0] ivec1;
   wire[CWIDTH1-1:0] ovec1;
   reg[CWIDTH1-1:0] ovec_exp1;

   popcount4 #(VWIDTH1,CWIDTH1) popcountI1(ivec1,ovec1);

   parameter VWIDTH2 = 10;
   parameter CWIDTH2 = 4;

   reg[VWIDTH2-1:0] ivec2;
   wire[CWIDTH2-1:0] ovec2;
   reg[CWIDTH2-1:0] ovec_exp2;

   popcount4 #(VWIDTH2,CWIDTH2) popcountI2(ivec2,ovec2);

   parameter VWIDTH3 = 11;
   parameter CWIDTH3 = 4;

   reg[VWIDTH3-1:0] ivec3;
   wire[CWIDTH3-1:0] ovec3;
   reg[CWIDTH3-1:0] ovec_exp3;

   popcount4 #(VWIDTH3,CWIDTH3) popcountI3(ivec3,ovec3);

   initial begin
       ivec0     = 8'b00000000;
       ovec_exp0 = 4'b0000;
       ivec1     = 9'b000000000;
       ovec_exp1 = 4'b0000;
       ivec2     = 10'b0000000000;
       ovec_exp2 = 4'b0000;
       ivec3     = 11'b00000000000;
       ovec_exp3 = 4'b0000;
       #10;
       ivec0     = 8'b00000001;
       ovec_exp0 = 4'b0001;
       ivec1     = 9'b000000001;
       ovec_exp1 = 4'b0001;
       ivec2     = 10'b0000000001;
       ovec_exp2 = 4'b0001;
       ivec3     = 11'b00000000001;
       ovec_exp3 = 4'b0001;
       #10;
       ivec0     = 8'b00000010;
       ovec_exp0 = 4'b0001;
       ivec1     = 9'b000000010;
       ovec_exp1 = 4'b0001;
       ivec2     = 10'b0000000010;
       ovec_exp2 = 4'b0001;
       ivec3     = 11'b00000000010;
       ovec_exp3 = 4'b0001;
       #10;
       ivec0     = 8'b10000000;
       ovec_exp0 = 4'b0001;
       ivec1     = 9'b100000000;
       ovec_exp1 = 4'b0001;
       ivec2     = 10'b1000000000;
       ovec_exp2 = 4'b0001;
       ivec3     = 11'b10000000000;
       ovec_exp3 = 4'b0001;
       #10;
       ivec0     = 8'b11111111;
       ovec_exp0 = 4'b1000;
       ivec1     = 9'b111111111;
       ovec_exp1 = 4'b1001;
       ivec2     = 10'b1111111111;
       ovec_exp2 = 4'b1010;
       ivec3     = 11'b11111111111;
       ovec_exp3 = 4'b1011;
       #10;
       ivec0     = 8'b11111110;
       ovec_exp0 = 4'b0111;
       ivec1     = 9'b111111110;
       ovec_exp1 = 4'b1000;
       ivec2     = 10'b1111111110;
       ovec_exp2 = 4'b1001;
       ivec3     = 11'b11111111110;
       ovec_exp3 = 4'b1010;
       #10;
       ivec0     = 8'b01010101;
       ovec_exp0 = 4'b0100;
       ivec1     = 9'b010101010;
       ovec_exp1 = 4'b0100;
       ivec2     = 10'b0101010101;
       ovec_exp2 = 4'b0101;
       ivec3     = 11'b01010101010;
       ovec_exp3 = 4'b0101;
       #10;
   end

endmodule
