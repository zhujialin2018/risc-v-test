`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/27 21:20:37
// Design Name: 
// Module Name: choose_rin
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


module choose_rin(
    input [4:0]rrs1,
    input [4:0]rrs2,
    input [4:0]irs1,
    input [4:0]srs1,
    input [4:0]brs1,
    input [4:0]brs2,
    input r,
    input i,
    input s,
    input b,
    output reg [4:0]rs1_out,
    output reg [4:0]rs2_out,
    output reg enrs1,
    output reg enrs2
    );
    
    always @ *
    begin
        if(1==r)
        begin
            enrs1<=1;
            enrs2<=1;
            rs1_out<=rrs1;
            rs2_out<=rrs2;
        end
        else if(1==i)
        begin
            enrs1<=1;
            enrs2<=0;
            rs1_out<=irs1;
            rs2_out<=0;
        end
        else if(1==s)
        begin
            enrs1<=1;
            enrs2<=1;
            rs1_out<=srs1;
            rs2_out<=0;
        end
        else if(1==b)
        begin
            enrs1<=1;
            enrs2<=1;
            rs1_out<=brs1;
            rs2_out<=brs2;
        end
    end
endmodule
