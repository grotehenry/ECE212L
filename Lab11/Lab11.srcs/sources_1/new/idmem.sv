`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2021 02:21:21 PM
// Design Name: 
// Module Name: idmem
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


module idmem(input logic clk, memwrite,
             input logic [31:0] adr, writedata,
             output logic [31:0] readdata);
    logic [31:0] RAM [63:0];
    initial
        $readmemh("memfile.dat",RAM);
    always_ff @(posedge clk)
    if(memwrite) RAM[adr[31:2]] <= writedata;
    assign readdata = RAM[adr[31:2]];
endmodule
