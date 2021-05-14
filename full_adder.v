`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2019 16:52:26
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input [31:0] A,
    input [31:0] B,
    output [31:0] Sum,
    output overflow
    );
    wire [8:0] cin,cin1;
    genvar i;
    assign cin[0]=0;
    generate for(i=0;i<32;i=i+4)begin
        four_bit f(A[i+3:i],B[i+3:i],cin[i/4],Sum[i+3:i],cin[(i+4)/4],cin1[(i+4)/4]);
    end 
    endgenerate
    xor b1 (overflow,cin[8],cin1[8]);
endmodule
