`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 02:11:09 PM
// Design Name: 
// Module Name: scroll_count_2
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


module scroll_count_2(input logic enb,clk,rst,
                      input logic [4:0] col,
                      output logic [9:0] col2);
    logic [6:0] wordOffset;
    always_ff @(posedge clk)
        begin
            if(rst)
                begin
                    wordOffset<=0;
                end
            else if(wordOffset>86&&enb)wordOffset<=0;
            else if (enb) wordOffset<=wordOffset+1;
        end
    assign col2 = col+wordOffset;
endmodule
