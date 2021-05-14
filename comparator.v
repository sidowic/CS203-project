`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2019 22:20:14
// Design Name: 
// Module Name: comparator
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


module comparator(
    input [31:0] A,
    input [31:0] B,
    output out,
    output less
    );
    wire [31:0] t;
    wire [31:0] temp;
    wire over;
    sub1 r1 (A,B,t,over);
     or r5 (temp[0],t[0],0);
     or r6(temp[1],t[1],0);
    genvar i;
    generate for(i=2;i<32;i=i+1) begin
        or r2 (temp[i],temp[i-1],t[i]);
    end
    endgenerate
    not p3 (out,temp[31]);
    assign less=over;
    /*wire ad,af;
    and aa1(ad,temp[0],1);
    or aa2(af,temp[31],ad);
    xor x1(out,1,af);
    wire a,b;
   and a1(a,temp[0],1);
   and a2(b,temp[31],1);
   wire o1,o2;
   and a3(o1,a,1);
   and a4(o2,b,0);
   or(less,o1,o2);*/
endmodule
