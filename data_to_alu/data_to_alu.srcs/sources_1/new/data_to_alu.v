`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/27 21:57:57
// Design Name: 
// Module Name: data_to_alu
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


module data_to_alu(
    input enrs1,
    input enrs2,
    input [31:0]rs1,
    input [31:0]rs2,
    input [11:0]imm,
    output [31:0]data1,
    output [31:0]data2
    );
    
    wire [31:0]immtemp={imm,20'h00000};
    
    assign data1=enrs1?rs1:data1;
    assign data2=enrs2?rs2:(immtemp>>>20);
    
/*    always @ *
    begin
        data1<=enrs1?rs1:data1;
        data2<=enrs2?rs2:(imm>>20);
    end
*/
endmodule
