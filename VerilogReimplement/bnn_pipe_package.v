`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2021 10:35:34 AM
// Design Name: 
// Module Name: bnn_pipe_package
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bnn_pipe_package(
    input sysclk_p,
    input sysclk_n,
    input rst,
    output[7:0] led
    );
    
    wire clk;
    wire bnn_rst;
    wire locked;
    wire[9:0] y;
    wire[9:0] t;
    
    assign led = y[7:0];
    assign bnn_rst = rst & locked;
    
    clk_wiz_0 my_clk(.clk_in1_p(sysclk_p),.clk_in1_n(sysclk_n),.reset(rst),.clk_out1(clk),.locked(locked));
    
    _v10_3252 my_bnn_chip(._v11_clk(clk),._v12_rst(bnn_rst),._v13_vecY(y),._v5_vecT(t));
    
endmodule
