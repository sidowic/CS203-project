`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2019 11:15:59
// Design Name: 
// Module Name: left_shift
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


module left_shift(
    input [31:0] A,
    output [31:0] B
    );
    assign B[0]=0;
    genvar i;
    generate for(i=1;i<32;i=i+1) begin
        assign B[i]=A[i-1];
    end
    endgenerate
endmodule
