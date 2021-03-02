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


module color_detect(input logic R2B, G2B, B2B, R, G, B, clk,
    output logic R2 = 0, G2 = 0, B2 = 0);
always_comb begin
    if (R2B != 1'b0 || G2B != 1'b0 || B2B != 1'b0) R2 = R;
    if (R2B != 1'b0 || G2B != 1'b0 || B2B != 1'b0) G2 = G;
    if (R2B != 1'b0 || G2B != 1'b0 || B2B != 1'b0) B2 = B;
end
endmodule
