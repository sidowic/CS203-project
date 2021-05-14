`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2019 18:09:12
// Design Name: 
// Module Name: subtractor
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


module sub1(
    input [31:0] A,
    input [31:0] B,
    output [31:0] diff,
    output overflow
    );
    wire [31:0] C;
    wire try,over;
    twos t1(B,C);
    full_adder f1(A,C,diff,overflow);
endmodule
