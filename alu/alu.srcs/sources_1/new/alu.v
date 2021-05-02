`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/23 11:16:35
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0]rs1,
    input [31:0]rs2,
    input [12:0]caltype,
    input clk,
    input reset,
    input [4:0]rd,
    input fuhao,
    input req_clearpipe,
    input [31:0]realpc,
    output reg [31:0]rddata=0,
    output reg [4:0]bramrdaddr=0,
    output reg finish=0,
    output reg clearpipe=0,
    output reg [31:0]pcrequest=0,
    input beforefinish
    );
    
    reg [12:0]in_caltype;

    always @ (posedge clk)
    begin
        case(req_clearpipe)
        1'b1:
        begin
            clearpipe<=1;
            pcrequest<=rs1+rs2;
            bramrdaddr<=rd;
            rddata<=realpc+4;
        end
        default:
        begin
            clearpipe<=0;
            pcrequest<=0;
        
        
        if(1==reset || 0==beforefinish)
        begin
            rddata<=0;
            bramrdaddr<=0;
            finish<=0;
            in_caltype<=0;
            clearpipe<=0;
            pcrequest<=0;
        end
        else
        begin
            in_caltype<=caltype;
        
            bramrdaddr<=rd;
            
            case(fuhao)
            1'b0:
            begin
                case(caltype)
                12'b100000000000:begin rddata<=rs1+rs2;finish<=1;end
                12'b010000000000:begin rddata<=rs1-rs2;finish<=1;end
                12'b001000000000:begin rddata<=rs1*rs2;finish<=1;end
                12'b000100000000:begin rddata<=rs1/rs2;finish<=1;end
                12'b000010000000:begin rddata<=rs1<<rs2;finish<=1;end
                12'b000001000000:begin rddata<=rs1>>rs2;finish<=1;end
                12'b000000100000:begin rddata<=rs1&rs2;finish<=1;end
                12'b000000010000:begin rddata<=rs1|rs2;finish<=1;end
                12'b000000001000:begin rddata<=rs1^rs2;finish<=1;end
                12'b000000000100:begin rddata<=rs1>rs2?1:0;finish<=1;end
                12'b000000000010:begin rddata<=rs1<rs2?1:0;finish<=1;end
                12'b000000000001:begin rddata<=rs1==rs2?1:0;finish<=1;end
                default:finish<=0;
                endcase
            end
            1'b1:
            begin
                case(caltype)
                12'b100000000000:begin rddata<=($signed(rs1))+($signed(rs2));finish<=1;end
                12'b010000000000:begin rddata<=($signed(rs1))-($signed(rs2));finish<=1;end
                12'b001000000000:begin rddata<=($signed(rs1))*($signed(rs2));finish<=1;end
                12'b000100000000:begin rddata<=($signed(rs1))/($signed(rs2));finish<=1;end
                12'b000010000000:begin rddata<=($signed(rs1))<<<($signed(rs2));finish<=1;end
                12'b000001000000:begin rddata<=($signed(rs1))>>>($signed(rs2));finish<=1;end
                12'b000000100000:begin rddata<=($signed(rs1))&($signed(rs2));finish<=1;end
                12'b000000010000:begin rddata<=($signed(rs1))|($signed(rs2));finish<=1;end
                12'b000000001000:begin rddata<=($signed(rs1))^($signed(rs2));finish<=1;end
                12'b000000000100:begin rddata<=($signed(rs1))>($signed(rs2))?1:0;finish<=1;end
                12'b000000000010:begin rddata<=($signed(rs1))<($signed(rs2))?1:0;finish<=1;end
                12'b000000000001:begin rddata<=($signed(rs1))==($signed(rs2))?1:0;finish<=1;end
                default:finish<=0;
                endcase
            end
            default:finish<=0;
            endcase
        end
        end
        endcase
    end
    
endmodule
