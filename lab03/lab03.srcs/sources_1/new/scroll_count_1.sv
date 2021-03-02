`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 02:40:54 PM
// Design Name: 
// Module Name: scroll_count_1
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


module scroll_count_1(input logic enb, start1, col, rst, rstFSM, clk,
    output logic colOff1, done1);
    logic count;
    always_ff @(posedge clk) begin
        if (start1) count++;
        else if (enb) count++;
    end
    assign colOff1 = count + col;
endmodule
