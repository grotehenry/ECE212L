`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2021 02:29:48 PM
// Design Name: 
// Module Name: ff
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


module ff(input logic enb, clk,
          input logic [31:0] in,
          output logic [31:0] out
    );
    
    always_ff @(posedge clk)
    begin
        if(enb)
        out<=in;
        else
        out<=out;
    end
endmodule
