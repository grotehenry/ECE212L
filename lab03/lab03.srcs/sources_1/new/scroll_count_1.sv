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


module scroll_count_1(input logic [4:0] col, input logic enb, rst, clk,
    output logic [9:0] colOff1);
    logic[6:0] count;
    always_ff @(posedge clk) begin
        if(rst)
            begin
                count<=0;
            end
        else if(count>64&&enb)count<=0;
        else if (enb) count<=count+1;
    end
    assign colOff1=col+count;
endmodule
