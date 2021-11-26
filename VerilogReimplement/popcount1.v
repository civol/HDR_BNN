`timescale 1 ns/10 ps

module popcount1(ivec,ovec);
   parameter VWIDTH = 0;
   parameter CWIDTH = 0;
   integer i;

   input[VWIDTH-1:0] ivec;
   output[CWIDTH-1:0] ovec;

   reg[CWIDTH-1:0] sum[0:VWIDTH-1];

   assign ovec = sum[VWIDTH-1];

   always @* begin
      for(i=0; i<VWIDTH; i=i+1) begin
         if (i == 0)
            sum[i] = ivec[i];
         else
            sum[i] = sum[i-1] + ivec[i];
      end
   end
endmodule
