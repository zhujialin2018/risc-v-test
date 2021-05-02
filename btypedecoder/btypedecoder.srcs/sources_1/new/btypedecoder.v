`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/01 02:54:24
// Design Name: 
// Module Name: btypedecoder
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


module btypedecoder(
    input [31:0]ins,
    input beforefinish,
    input reset,
    input xuanzhong,
    output reg [4:0]cpurd=0,
    output reg [4:0]rs1,
    output reg [11:0]bimm=0,
    output reg finish,
    output reg [4:0]rs2,
    input clk,
    output reg [12:0]askalu,
    output reg bask,
    output reg fuhao
    );
    
    always @ (posedge clk)
    begin
        if(0==beforefinish || 1==reset || 0==xuanzhong)
        begin
            bask<=0;
            finish<=0;
            rs1<=0;
            bimm<=0;
            askalu<=0;
            rs2<=0;
        end
        else
        begin
        
        end
    end
    
endmodule
