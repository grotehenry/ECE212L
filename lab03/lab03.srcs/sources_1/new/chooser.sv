`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 02:14:59 PM
// Design Name: 
// Module Name: chooser
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


module chooser(input logic [2:0] rgb1, rgb2,
               input logic [4:0] col,
               output logic R2, G2, B2);
       always_comb
       if(col>26){R2,G2,B2} = rgb2;
       else {R2,G2,B2} = rgb1;
endmodule
