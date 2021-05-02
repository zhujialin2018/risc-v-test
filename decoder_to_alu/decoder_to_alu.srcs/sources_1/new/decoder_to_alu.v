`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/27 22:48:39
// Design Name: 
// Module Name: decoder_to_alu
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

module decoder_to_alu(
    input clk,
    input [12:0]raskalu,
    input [12:0]iaskalu,
    input [12:0]saskalu,
    input [12:0]baskalu,
    input [12:0]uaskalu,
    input [12:0]jaskalu,
    input rinfuhao,
    input iinfuhao,
    input sinfuhao,
    input binfuhao,
    input uinfuhao,
    input jinfuhao,
    input rinfinish,
    input iinfinish,
    input sinfinish,
    input binfinish,
    input uinfinish,
    input jinfinish,
    output reg [12:0]askalu,
    output reg outfinish,
    output reg outfuhao,
    output reg [4:0]rd,
    input r,
    input i,
    input s,
    input b,
    input u,
    input j,
    input [4:0]rrd,
    input [4:0]ird,
    input [4:0]srd,
    input [4:0]brd,
    input [4:0]urd,
    input [4:0]jrd
    );
    
    wire [5:0]lalala={r,i,s,b,u,j};
    
    always @(negedge clk)
    begin
        case(lalala)
            6'b100000:
            begin
                askalu<=raskalu;
                rd<=rrd;
                outfinish<=rinfinish;
                outfuhao<=rinfuhao;
            end
            6'b010000:
            begin
                askalu<=iaskalu;
                rd<=ird;
                outfinish<=iinfinish;
                outfuhao<=iinfuhao;
            end
            6'b001000:
            begin
                askalu<=saskalu;
                rd<=srd;
                outfinish<=sinfinish;
                outfuhao<=sinfuhao;
                
            end
            6'b000100:
            begin
                askalu<=baskalu;
                rd<=brd;
                outfinish<=binfinish;
                outfuhao<=binfuhao;
            end
            6'b000010:
            begin
                askalu<=uaskalu;
                rd<=urd;
                outfinish<=uinfinish;
                outfuhao<=uinfuhao;
            end
            6'b000001:
            begin
                askalu<=jaskalu;
                rd<=jrd;
                outfinish<=jinfinish;
                outfuhao<=jinfuhao;
            end
            default:
            begin
                askalu<=0;
                rd<=0;
                outfinish<=0;
                outfuhao<=0;
            end
        endcase
    end
    
endmodule
