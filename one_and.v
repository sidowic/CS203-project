`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2019 00:47:17
// Design Name: 
// Module Name: one_and
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


module one_and(
    input [31:0] a,
    input b,
    output [31:0] c
    );
    genvar i;
    generate for(i=0;i<32;i=i+1)begin
        and a1(c[i],a[i],b);
    end
    endgenerate
endmodule
