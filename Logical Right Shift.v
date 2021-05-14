`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2019 11:15:59
// Design Name: 
// Module Name: right_shift
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


module right_shift(
    input [31:0] A,
    output [31:0] B
    );
    genvar i;
    generate for(i=0;i<31;i=i+1) begin
        assign B[i]=A[i+1];
    end
    endgenerate
    assign B[31]=0;
endmodule
