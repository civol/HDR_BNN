module nbits2(val,count);
   input[1:0] val;
   output reg[2:0] count;

   always @(val) case(val)
       4'b00: count = 3'b000;
       4'b01: count = 3'b001;
       4'b10: count = 3'b001;
       4'b11: count = 3'b010;
   endcase
endmodule


module nbits3(val,count);
   input[2:0] val;
   output reg[2:0] count;

   always @(val) case(val)
       4'b000: count = 3'b000;
       4'b001: count = 3'b001;
       4'b010: count = 3'b001;
       4'b011: count = 3'b010;
       4'b100: count = 3'b001;
       4'b101: count = 3'b010;
       4'b110: count = 3'b010;
       4'b111: count = 3'b011;
   endcase
endmodule


module nbits4(val,count);
   input[3:0] val;
   output reg[2:0] count;

   always @(val) case(val)
       4'b0000: count = 3'b000;
       4'b0001: count = 3'b001;
       4'b0010: count = 3'b001;
       4'b0011: count = 3'b010;
       4'b0100: count = 3'b001;
       4'b0101: count = 3'b010;
       4'b0110: count = 3'b010;
       4'b0111: count = 3'b011;
       4'b1000: count = 3'b001;
       4'b1001: count = 3'b010;
       4'b1010: count = 3'b010;
       4'b1011: count = 3'b011;
       4'b1100: count = 3'b010;
       4'b1101: count = 3'b011;
       4'b1110: count = 3'b011;
       4'b1111: count = 3'b100;
   endcase
endmodule


module nbits5(val,count);
   input[4:0] val;
   output reg[2:0] count;

   always @(val) case(val)
       5'b00000: count = 3'b000;
       5'b00001: count = 3'b001;
       5'b00010: count = 3'b001;
       5'b00011: count = 3'b010;
       5'b00100: count = 3'b001;
       5'b00101: count = 3'b010;
       5'b00110: count = 3'b010;
       5'b00111: count = 3'b011;
       5'b01000: count = 3'b001;
       5'b01001: count = 3'b010;
       5'b01010: count = 3'b010;
       5'b01011: count = 3'b011;
       5'b01100: count = 3'b010;
       5'b01101: count = 3'b011;
       5'b01110: count = 3'b011;
       5'b01111: count = 3'b100;
       5'b10000: count = 3'b001;
       5'b10001: count = 3'b010;
       5'b10010: count = 3'b010;
       5'b10011: count = 3'b011;
       5'b10100: count = 3'b010;
       5'b10101: count = 3'b011;
       5'b10110: count = 3'b011;
       5'b10111: count = 3'b100;
       5'b11000: count = 3'b010;
       5'b11001: count = 3'b011;
       5'b11010: count = 3'b011;
       5'b11011: count = 3'b100;
       5'b11100: count = 3'b011;
       5'b11101: count = 3'b100;
       5'b11110: count = 3'b100;
       5'b11111: count = 3'b101;
   endcase
endmodule


module nbits6(val,count);
   input[5:0] val;
   output reg[2:0] count;

   always @(val) case(val)
       6'b000000: count = 3'b000;
       6'b000001: count = 3'b001;
       6'b000010: count = 3'b001;
       6'b000011: count = 3'b010;
       6'b000100: count = 3'b001;
       6'b000101: count = 3'b010;
       6'b000110: count = 3'b010;
       6'b000111: count = 3'b011;
       6'b001000: count = 3'b001;
       6'b001001: count = 3'b010;
       6'b001010: count = 3'b010;
       6'b001011: count = 3'b011;
       6'b001100: count = 3'b010;
       6'b001101: count = 3'b011;
       6'b001110: count = 3'b011;
       6'b001111: count = 3'b100;
       6'b010000: count = 3'b001;
       6'b010001: count = 3'b010;
       6'b010010: count = 3'b010;
       6'b010011: count = 3'b011;
       6'b010100: count = 3'b010;
       6'b010101: count = 3'b011;
       6'b010110: count = 3'b011;
       6'b010111: count = 3'b100;
       6'b011000: count = 3'b010;
       6'b011001: count = 3'b011;
       6'b011010: count = 3'b011;
       6'b011011: count = 3'b100;
       6'b011100: count = 3'b011;
       6'b011101: count = 3'b100;
       6'b011110: count = 3'b100;
       6'b011111: count = 3'b101;
       6'b100000: count = 3'b001;
       6'b100001: count = 3'b010;
       6'b100010: count = 3'b010;
       6'b100011: count = 3'b011;
       6'b100100: count = 3'b010;
       6'b100101: count = 3'b011;
       6'b100110: count = 3'b011;
       6'b100111: count = 3'b100;
       6'b101000: count = 3'b010;
       6'b101001: count = 3'b011;
       6'b101010: count = 3'b011;
       6'b101011: count = 3'b100;
       6'b101100: count = 3'b011;
       6'b101101: count = 3'b100;
       6'b101110: count = 3'b100;
       6'b101111: count = 3'b101;
       6'b110000: count = 3'b010;
       6'b110001: count = 3'b011;
       6'b110010: count = 3'b011;
       6'b110011: count = 3'b100;
       6'b110100: count = 3'b011;
       6'b110101: count = 3'b100;
       6'b110110: count = 3'b100;
       6'b110111: count = 3'b101;
       6'b111000: count = 3'b011;
       6'b111001: count = 3'b100;
       6'b111010: count = 3'b100;
       6'b111011: count = 3'b101;
       6'b111100: count = 3'b100;
       6'b111101: count = 3'b101;
       6'b111110: count = 3'b101;
       6'b111111: count = 3'b110;
   endcase
endmodule


module popcount4(ivec,ovec);
   parameter VWIDTH = 0;
   parameter CWIDTH = 0;

   input[VWIDTH-1:0] ivec;
   output[CWIDTH-1:0] ovec;

   wire[2:0] reds[0:VWIDTH/4];

   genvar i;

   generate
   for(i=0; i<VWIDTH/4; i=i+1) begin
      nbits4 nbits4I(ivec[(i*4) +: 4],reds[i]);
   end

   if(VWIDTH%4 == 3) begin
      nbits3 nbits3I(ivec[VWIDTH-1:VWIDTH-3],reds[VWIDTH/4]);
   end

   if(VWIDTH%4 == 2) begin
      nbits2 nbits2I(ivec[VWIDTH-1:VWIDTH-2],reds[VWIDTH/4]);
   end

   if(VWIDTH%4 == 1) begin
      assign reds[VWIDTH/4] = ivec[VWIDTH-1];
   end

   if(VWIDTH%4 == 0) begin
      assign reds[VWIDTH/4] = 0;
   end
   endgenerate

   reg[CWIDTH-1:0] sum[0:VWIDTH/4];
   
   integer j;

   always @* begin
      for(j=0; j<=VWIDTH/4; j=j+1) begin
         if(j == 0)
            sum[j] = reds[j];
         else
            sum[j] = sum[j-1] + reds[j];
      end
   end
   
   assign ovec = sum[VWIDTH/4];
endmodule



module popcount5(ivec,ovec);
   parameter VWIDTH = 0;
   parameter CWIDTH = 0;

   input[VWIDTH-1:0] ivec;
   output[CWIDTH-1:0] ovec;

   wire[2:0] reds[0:VWIDTH/5];

   genvar i;

   generate
   for(i=0; i<VWIDTH/5; i=i+1) begin
      nbits5 nbits5I(ivec[(i*5) +: 5],reds[i]);
   end

   if(VWIDTH%5 == 4) begin
      nbits3 nbits4I(ivec[VWIDTH-1:VWIDTH-4],reds[VWIDTH/5]);
   end

   if(VWIDTH%5 == 3) begin
      nbits3 nbits3I(ivec[VWIDTH-1:VWIDTH-3],reds[VWIDTH/5]);
   end

   if(VWIDTH%5 == 2) begin
      nbits2 nbits2I(ivec[VWIDTH-1:VWIDTH-2],reds[VWIDTH/5]);
   end

   if(VWIDTH%5 == 1) begin
      assign reds[VWIDTH/5] = ivec[VWIDTH-1];
   end

   if(VWIDTH%5 == 0) begin
      assign reds[VWIDTH/5] = 0;
   end
   endgenerate

   reg[CWIDTH-1:0] sum[0:VWIDTH/5];
   
   integer j;

   always @* begin
      for(j=0; j<=VWIDTH/5; j=j+1) begin
         if(j == 0)
            sum[j] = reds[j];
         else
            sum[j] = sum[j-1] + reds[j];
      end
   end
   
   assign ovec = sum[VWIDTH/5];
endmodule


module popcount6(ivec,ovec);
   parameter VWIDTH = 0;
   parameter CWIDTH = 0;

   input[VWIDTH-1:0] ivec;
   output[CWIDTH-1:0] ovec;

   wire[2:0] reds[0:VWIDTH/6];

   genvar i;

   generate
   for(i=0; i<VWIDTH/6; i=i+1) begin
      nbits5 nbits5I(ivec[(i*6) +: 6],reds[i]);
   end

   if(VWIDTH%6 == 5) begin
      nbits3 nbits4I(ivec[VWIDTH-1:VWIDTH-5],reds[VWIDTH/6]);
   end

   if(VWIDTH%6 == 4) begin
      nbits3 nbits4I(ivec[VWIDTH-1:VWIDTH-4],reds[VWIDTH/6]);
   end

   if(VWIDTH%6 == 3) begin
      nbits3 nbits3I(ivec[VWIDTH-1:VWIDTH-3],reds[VWIDTH/6]);
   end

   if(VWIDTH%6 == 2) begin
      nbits2 nbits2I(ivec[VWIDTH-1:VWIDTH-2],reds[VWIDTH/6]);
   end

   if(VWIDTH%6 == 1) begin
      assign reds[VWIDTH/6] = ivec[VWIDTH-1];
   end

   if(VWIDTH%5 == 0) begin
      assign reds[VWIDTH/6] = 0;
   end
   endgenerate

   reg[CWIDTH-1:0] sum[0:VWIDTH/6];
   
   integer j;

   always @* begin
      for(j=0; j<=VWIDTH/6; j=j+1) begin
         if(j == 0)
            sum[j] = reds[j];
         else
            sum[j] = sum[j-1] + reds[j];
      end
   end
   
   assign ovec = sum[VWIDTH/6];
endmodule
