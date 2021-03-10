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


module scroll_count_1(input logic [4:0] col, input logic enb, start1, rst, rstC1, clk,
    output logic [6:0] colOff1, output logic done1);
    logic[5:0] count;
    always_ff @(posedge clk) begin
        if (rst || rstC1) count <= 0;
        else if (start1 && enb&&!done1) count <= count+1;
    end
    assign colOff1 = count + col;
    assign done1 = count==62;
endmodule
