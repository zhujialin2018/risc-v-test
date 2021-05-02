`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/23 02:06:13
// Design Name: 
// Module Name: fetcher
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


module fetcher(
    input clk,
    input reset,
    input [31:0]instruction,
    input unusualpc,
    input [31:0]pcrequest,
    input alufinish,
    output reg [31:0]outins=0,
    output reg clearpipe=0,
    output reg [31:0]bramaddr=0,
    output reg [31:0]realpc=32'h00000000,
    output reg finish=0
    );
    
    reg temp_askpc=0;
    reg [31:0]temp_pcrequest=0;

    always @ (negedge clk)
    begin
        temp_askpc<=unusualpc;
        temp_pcrequest<=pcrequest;
    
        case(unusualpc)
        default:
        begin
            if(alufinish)
            begin
                 realpc<=realpc+4;
            end
            else
            begin
                realpc<=realpc;
            end
            //realpc<=alufinish?realpc+4:realpc;
        end
        1'b1:
        begin
            realpc<=temp_pcrequest;
        end
        endcase
    end
    
    always @ (posedge clk)
    begin
        if(0==reset)
        begin
            if(1==temp_askpc)
            begin
                clearpipe<=1;
                bramaddr<=((temp_pcrequest>>1)<<1)>>2;
                outins<=32'h00000000;
                finish<=0;
            end
            else
            begin
                clearpipe<=0;
                outins<=instruction;
                bramaddr<=bramaddr+1;
                finish<=1;
            end
            end
            else if(0==instruction)
            begin
                bramaddr<=bramaddr+1;
                outins<=32'h00000000;
                finish<=0;
            end
            else
            begin
                outins<=32'h00000000;
                finish<=0;
            end
        end
    
endmodule
