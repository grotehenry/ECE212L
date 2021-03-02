`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 02:53:47 PM
// Design Name: 
// Module Name: color_detect
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


module color_detect(input logic [3:0]RGB2, 
                    input logic [2:0] NextColor, 
                    input logic [5:0] col,
    output logic R2,G2,B2);
always_comb 
    begin
    if(!RGB2&&col>=27){R2,G2,B2}=NextColor;
    end
endmodule
