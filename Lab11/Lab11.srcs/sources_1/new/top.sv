`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2021 02:35:28 PM
// Design Name: 
// Module Name: top
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


module top(input  logic        clk, reset,
            output logic [31:0] adr, writedata,
            output logic        memwrite,
            output  logic [31:0] readdata);
    mips_multi mips(.clk,.reset,.adr,.writedata,.memwrite,.readdata);
    idmem mem(.clk,.memwrite,.adr,.writedata,.readdata);
endmodule
