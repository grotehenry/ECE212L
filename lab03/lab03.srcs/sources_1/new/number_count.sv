`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 02:56:52 PM
// Design Name: 
// Module Name: number_count
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


module number_count(input logic NEXTPB, clk, rst,
    output logic [5:0] offset = 0);
always_ff @(posedge clk) begin
    if (NEXTPB) offset += 6;
end
endmodule
