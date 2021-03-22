`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2021 09:41:33 AM
// Design Name: 
// Module Name: DC
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


module delay_count(input logic clk, rst, enb,enb_d,
           output logic[7:0] d
           );
    always_ff @ (posedge clk)
        if(rst)d<=0;
        else if (enb&&enb_d)d<=d+1;
endmodule
