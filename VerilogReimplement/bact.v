`timescale 1 ns/10 ps

module bact(x,b,z);
   parameter WIDTH = 0;
   input[WIDTH-1:0] x,b;
   output z;

   wire[WIDTH:0] y;

   assign y = {1'b0,x} + {b[WIDTH-1],b};
   assign z = ~y[WIDTH];
endmodule
