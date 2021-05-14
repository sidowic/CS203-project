`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2019 22:11:12
// Design Name: 
// Module Name: multiplier
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
module multiplier(
    input [31:0] A,
    input [31:0] B,
    input [31:0] out
    );
    wire [31:0] ans;
    wire [31:0] temp;
    wire [31:0] prevsum [31:0];
    wire [31:0] shifted [31:0];
    wire [31:0] oi[31:0];
    genvar i;
    one_and a1(A,B[0],prevsum[0]);
    assign shifted[0]=A;
    wire [31:0] c[31:0];
    wire [31:0] test;
    generate for(i=1;i<32;i=i+1) begin
        assign shifted[i]=shifted[i-1]<<1;
        one_and a2(shifted[i],B[i],oi[i]);
        full_adder r1 (oi[i],prevsum[i-1],prevsum[i],test[i]);
    end
    endgenerate
    assign out=prevsum[31];
endmodule
