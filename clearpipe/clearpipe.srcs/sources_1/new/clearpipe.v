`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/23 03:40:11
// Design Name: 
// Module Name: clearpipe
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


module clearpipe(
    input reset,
    input clearpipe,
    output clear
    );
    
    assign clear=clearpipe||reset;
    
endmodule
