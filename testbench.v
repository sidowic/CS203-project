`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2019 00:18:22
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg [31:0] A,B;
    reg [4:0] control;
    wire [31:0] final;
    wire less,equal,zero,over,carry;
    //control=0;
    Alu_control a1 (A,B,control,final,less,equal,zero,over,carry);
    initial begin
    A=0;
    B=0;
    control=0;
    end
    always begin
    #10 A=A+1;
    #20 B=B+1;
    #25 control=control+1;
    end
endmodule
