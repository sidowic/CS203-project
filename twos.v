`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2019 17:02:48
// Design Name: 
// Module Name: twos
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


module twos(
    input [31:0] A,
    output [31:0] B
    );
    wire [31:0] C,D;
    genvar i;
    generate for(i=0;i<32;i=i+1)begin
        assign C[i]=~A[i];
    end endgenerate
    assign D=1;
    full_adder f1(C,D,B);
endmodule
