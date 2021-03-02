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
// Description: Counts from 0 to 31 when the enb signal is high at the positive edge of the clock
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module col_count(input logic clk, rst, enb,enb_c,
           output logic[4:0] col
           );
       always_ff @(posedge clk)
               //reset when rst is high
               if (rst) col <= 0;
               //add one to the output when the enb and enb_c is high
               else if (enb&&enb_c) col <= col + 1;
endmodule