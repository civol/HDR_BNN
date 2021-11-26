`timescale 1 ns/10 ps

module bdense1(vecX,vecO);
  `include "weight_biaises1.v"

  input[IWIDTH1-1:0] vecX;
  output[OWIDTH1-1:0] vecO;

  genvar i;
  generate
  for(i=0; i < OWIDTH1; i = i+1) begin
      bneuron #(IWIDTH1,CWIDTH1,VECWS1[(i+1)*IWIDTH1-1:i*IWIDTH1],BIASES1[(i+1)*CWIDTH1-1:i*CWIDTH1]) bneuronI(vecX,vecO[i]);
  end
  endgenerate
  
endmodule
