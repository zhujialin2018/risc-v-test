`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 03:06:30
// Design Name: 
// Module Name: itypedecoder
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

module itypedecoder(
    input [31:0]ins,
    input beforefinish,
    input reset,
    input xuanzhong,
    output reg [11:0]imm,
    output reg [4:0]rs1,
    output reg [4:0]rd,
    output reg finish,
    output reg loadenable,
    input clk,
    output reg [12:0]askalu,
    output reg req_clearpipe=0,
    output reg iask,
    output reg [4:0]leixing,
    output reg fuhao
    );
    
    always @ (posedge clk)
    begin
        if(0==beforefinish || 1==reset || 0==xuanzhong)
        begin
            req_clearpipe<=0;
            fuhao<=0;
            iask<=0;
            finish<=0;
            rs1<=0;
            imm<=0;
            rd<=0;
            askalu<=0;
            leixing<=0;
            loadenable<=0;
        end
        else
        begin
            iask<=1;
            finish<=1;
            rs1<=ins[19:15];
            imm<=ins[31:20];
            rd<=ins[11:7];
            
            case(ins[6:0])
            7'b0000111:
            begin
                //对地址做加法
                fuhao<=1;
                askalu<=12'b100000000000;
                loadenable<=1;
                
                case(ins[14:12])
                    //lb
                    3'b000:
                    begin
                        leixing<=5'b10000;
                    end
                    //lh
                    3'b001:
                    begin
                        leixing<=5'b01000;
                    end
                    //lw
                    3'b010:
                    begin
                        leixing<=5'b00100;
                    end
                    //lbu
                    3'b100:
                    begin
                        leixing<=5'b00010;
                    end
                    //lhu
                    3'b101:
                    begin
                        leixing<=5'b00001;
                    end
                    default:
                    begin
                        leixing<=5'b00000;
                    end
                endcase
            end
            //jalr
            7'b1100111:
            begin
            loadenable<=0;
            leixing<=0;
                case(ins[14:12])
                    3'b000:
                    begin 
                        req_clearpipe<=1;
                        fuhao<=1;
                    end
                    default:
                    begin
                        req_clearpipe<=0;
                        fuhao<=0;
                    end
                endcase
            end
            7'b0010011:
            begin
            loadenable<=0;
            leixing<=0;
                case(ins[14:12])
                //addi
                3'b000:
                begin
                    fuhao<=1;
                    askalu<=12'b100000000000;
                end
                //slti
                3'b010:
                begin
                    askalu<=12'b000000000010;
                    fuhao<=1;
                end
                //sltiu
                3'b011:
                begin
                    askalu<=12'b000000000010;
                    fuhao<=0;
                end
                //xori
                3'b100:
                begin
                    askalu<=12'b000000001000;
                    fuhao<=0;
                end
                //ori
                3'b110:
                begin
                    askalu<=12'b000000010000;
                    fuhao<=0;
                end
                //andi
                3'b111:
                begin
                    askalu<=12'b000000100000;
                    fuhao<=0;
                end
                //slli
                3'b001:
                begin
                    askalu<=12'b000010000000;
                    fuhao<=0;
                end
                //srli srai
                3'b101:
                begin
                    case(ins[31:25])
                    7'b0000000:
                    begin
                        askalu<=12'b000001000000;
                        fuhao<=0;
                    end
                    default:
                    begin
                        askalu<=12'b000001000000;
                        fuhao<=1;
                    end
                    endcase
                end
                default:
                begin
                    askalu<=12'b000000000000;
                end
                endcase
            end
            endcase
        end
    end
    
    
    
endmodule
