`timescale 1 ns/10 ps

module bnn_pipe12(clk,rst,vecX,reg2);
   parameter WIDTH0 = 784;
   parameter WIDTH1 = 8;
   parameter WIDTH2 = 10;

   input clk, rst;
   input[WIDTH0-1:0] vecX;

   output reg [WIDTH2-1:0] reg2;
   reg[WIDTH1-1:0] reg1;

   wire[WIDTH2-1:0] pt2;
   wire[WIDTH1-1:0] pt1;

   bdense1 bdense1I(vecX,pt1);
   bdense2 bdense2I(reg1,pt2);

   always @(posedge clk) begin
       if (rst == 1) begin
           reg1 <= {WIDTH1{1'b0}};
           reg2 <= {WIDTH2{1'b0}};
       end
       else begin
           reg1 <= pt1;
           reg2 <= pt2;
       end
   end

endmodule
