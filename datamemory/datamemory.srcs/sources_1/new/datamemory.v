`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/30 00:06:01
// Design Name: 
// Module Name: datamemory
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


module datamemory(
    input writeable,
    input [31:0]inputdata,
    input [31:0]addr,
    input [2:0]writelength,
    output [31:0]outdata
    );
    
    reg [7:0]data[255:0];
    
    assign outdata={data[addr+3],data[addr+2],data[addr+1],data[addr]};
    
    always @ (writeable)
    begin
        if(1'b1==writelength[0])
        begin
            data[addr]<=inputdata[7:0];
        end
        if(1'b1==writelength[1])
        begin
            data[addr+1]<=inputdata[15:8];
        end
        if(1'b1==writelength[2])
        begin
            data[addr+2]=inputdata[23:16];
            data[addr+3]=inputdata[31:24];
        end
    end
    
endmodule
