`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2019 16:35:51
// Design Name: 
// Module Name: four_bit
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


module four_bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout,
    output cout1
    );
    wire [3:0] g,p,c;
    genvar i;
    generate for(i=0;i<4;i=i+1)begin
        and a1(g[i],a[i],b[i]);
        xor x1(p[i],a[i],b[i]);
    end
    endgenerate
    wire [9:0]l;
    and a2(l[0],p[3],g[2]);
    and a3(l[1],p[3],p[2],g[1]);
    and a4(l[2],p[3],p[2],p[1],g[0]);
    and a5(l[3],p[3],p[2],p[1],p[0],cin);
    or o1(cout,g[3],l[0],l[1],l[2],l[3]);
    and a6(l[4],p[2],g[1]);
    and a7(l[5],p[2],p[1],g[0]);
    and a8(l[6],p[2],p[1],p[0],cin);
    or o2(c[3],g[2],l[4],l[5],l[6]);
    and a9(l[7],p[1],g[0]);
    and a10(l[8],p[1],p[0],cin);
    or o3(c[2],g[1],l[7],l[8]);
    and a11(l[9],p[0],cin);
    or o4(c[1],g[0],l[9]);
    assign c[0]=cin;
    generate for(i=0;i<4;i=i+1)begin
        xor x2(sum[i],p[i],c[i]);
    end 
    endgenerate
    assign cout1=c[3];
endmodule
