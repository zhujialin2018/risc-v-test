`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/23 15:13:45
// Design Name: 
// Module Name: controller
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


module controller(
    input clk,
    input reset,
    input alufinish,
    input [31:0]askpcoffset,
    input askpc,
    output reg clearpipeline,
    output reg unusualpc,
    output reg [31:0]pcoffset
    );
    
    always @ (posedge clk)
    begin
    if(0==reset)
        case(alufinish)
            1'b0:
            begin
                unusualpc<=0;
                pcoffset<=0;
                clearpipeline<=0;
            end
            default:
            begin
                case(askpc)
                1'b1:
                begin
                    pcoffset<=askpcoffset;
                    unusualpc<=1;
                    clearpipeline<=1;
                end
                default:
                begin
                    pcoffset<=0;
                    unusualpc<=0;
                end
                endcase
            end
        endcase
    else
    begin
        clearpipeline<=0;
        unusualpc<=0;
        pcoffset<=0;
    end
    end
    
endmodule
