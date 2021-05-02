`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/30 03:02:32
// Design Name: 
// Module Name: immchoose
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


module immchoose(
    input i,
    input s,
    input [11:0]iimm,
    input [11:0]simm,
    output reg [11:0]imm
    );
    
    always @ *
    begin
        if(1==i && 0==s)
        begin
            imm<=iimm;
        end
        else if(1==s && 0==i)
        begin
            imm<=simm;
        end
        else
        begin
            imm<=imm;
        end
    end
    
endmodule
