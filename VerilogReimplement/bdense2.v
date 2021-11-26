`timescale 1 ns/10 ps

module bdense2(vecX,vecO);
  `include "weight_biaises2.v"

  input[IWIDTH2-1:0] vecX;
  output[OWIDTH2-1:0] vecO;

  genvar i;
  generate
  for(i=0; i < OWIDTH2; i = i+1) begin
      bneuron2 #(IWIDTH2,CWIDTH2,VECWS2[(i+1)*IWIDTH2-1:i*IWIDTH2],BIASES2[(i+1)*CWIDTH2-1:i*CWIDTH2]) bneuron2I(vecX,vecO[i]);
  end
  endgenerate
  
endmodule
