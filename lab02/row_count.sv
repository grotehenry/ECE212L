`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lafayette College
// Engineer: Henry Grote and Zheping Yin
// 
// Create Date: 02/23/2021 12:29:36 PM
// Design Name: 
// Module Name: fsm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Counts from 0 to 7 when the enb signal is high at the positive edge of the clock
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module row_count(input logic clk, rst, enb,enb_r,
           output logic[2:0] row, disp_row
           );
       always_ff @(posedge clk)
               //reset when rst is high
               if (rst) row <= 0;
               //add one to the output when the enb and enb_r is high
               else if (enb&&enb_r) row <= row + 1;
       assign disp_row = row-1;
endmodule