`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Zheping Yin and Henry Grote
// 
// Create Date: 05/09/2021 06:28:26 PM
// Design Name: 
// Module Name: floprEn
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// A flip-flop with enable
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module floprEn#(parameter WIDTH = 8)
              (input  logic             clk, reset,en,
               input  logic [WIDTH-1:0] d, 
               output logic [WIDTH-1:0] q);

  always_ff @(posedge clk, posedge reset)
    if (reset) q <= 0;
    else if(en)       q <= d;
endmodule
