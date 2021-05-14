`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2019 02:43:18
// Design Name: 
// Module Name: Alu_control
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


module Alu_control(
    input [31:0] A,
    input [31:0] B,
    input [4:0] c,
    output [31:0] final,
    output less,
    output equal,
    output zero,
    output over,
    output carry
    );
    wire [4:0] C;
    /*
    0-arithmetic left a
    1-arithmetic left b
    2-arithmetic right a
    3-arithmetic right b
    4-logical left a
    5-logical left b
    6-logical right a
    7-logical right b
    8- AND
    9- OR
    10- NOT A
    11-NOT B
    12 - XOR
    13 Fast_adder
    14 multiplier
    15 comparision
    16 subtractor
    */
    wire [31:0] z[15:0];
    arithmetic_left a0 (A,z[0]);
    arithmetic_left a1 (B,z[1]);
    arithmetic_right a2 (A,z[2]);
    arithmetic_right a3 (B,z[3]);
    left_shift a4 (A,z[4]);
    left_shift a5 (B,z[5]);
    right_shift a6 (A,z[6]);
    right_shift a7 (B,z[7]);
    AND a8 (A,B,z[8]);
    OR a9 (A,B,z[9]);
    NOT aa10 (A,z[10]);
    NOT ab10(B,z[11]);
    XOR a11 (A,B,z[12]);
    full_adder a12 (A,B,z[13],over);
    multiplier a13 (A,B,z[14]);
    comparator a14 (A,B,equal,less);
    sub1 a15 (A,B,z[15],over);
    genvar i;
    generate for(i=0;i<5;i=i+1) begin
        not b1 (C[i],c[i]);
    end
    endgenerate
    wire [16:0] f;
    and c0 (f[0],C[0],C[1],C[2],C[3],C[4]);
    and c1 (f[1],c[0],C[1],C[2],C[3],C[4]);
    and c2 (f[2],C[0],c[1],C[2],C[3],C[4]);
    and c3 (f[3],c[0],c[1],C[2],C[3],C[4]);
    and c4 (f[4],C[0],C[1],c[2],C[3],C[4]);
    and c5 (f[5],c[0],C[1],c[2],C[3],C[4]);
    and c6 (f[6],C[0],c[1],c[2],C[3],C[4]);
    and c7 (f[7],c[0],c[1],c[2],C[3],C[4]);
    and c8 (f[8],C[0],C[1],C[2],c[3],C[4]);
    and c9 (f[9],c[0],C[1],C[2],c[3],C[4]);
    and c10 (f[10],C[0],c[1],C[2],c[3],C[4]);
    and c11 (f[11],c[0],c[1],C[2],c[3],C[4]);
    and c12 (f[12],C[0],C[1],c[2],c[3],C[4]);
    and c13 (f[13],c[0],C[1],c[2],c[3],C[4]);
    and c14 (f[14],C[0],c[1],c[2],c[3],C[4]);
    and c15 (f[15],c[0],c[1],c[2],c[3],C[4]);
    wire [31:0] out [15:0];
    generate for(i=0;i<16;i=i+1) begin
    one_and o0 (z[i],f[i],out[i]);
    end
    endgenerate
    generate for(i=0;i<32;i=i+1) begin
    or f1 (final[i],out[0][i],out[1][i],out[2][i],out[3][i],out[4][i],out[5][i],out[6][i],out[7][i],out[8][i],out[9][i],out[10][i],out[11][i],out[12][i],out[13][i],out[14][i],out[15][i]);
    end
    endgenerate
    /*wire [31:0] ans[15:0];
    generate for(i=0;i<16;i=i+1) begin
        one_and a12(ans[i],f[i],z[i]);
    end 
    endgenerate
    generate for(i=0;i<32;i=i+1)begin
    or o121(final[i],ans[0][i],ans[1][i],ans[2][i],ans[3][i],ans[4][i],ans[5][i],ans[6][i],ans[7][i],ans[8][i],ans[9][i],ans[10][i],ans[11][i],ans[12][i],ans[13][i],ans[14][i],ans[15][i]);
    end
    endgenerate*/
    endmodule
