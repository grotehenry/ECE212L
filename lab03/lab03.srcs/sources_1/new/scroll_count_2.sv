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


module scroll_count_2(input logic enb,start2,clk,rstC2,rst,
                      input logic [4:0] col,
                      output logic done2,
                      output logic [6:0] col2);
    logic [6:0] wordOffset;
    always_ff @(posedge clk)
        begin
            if(rst||rstC2)wordOffset<=0;
            else if(enb&&start2&&!done2)wordOffset<=wordOffset+1;
        end
    always_comb
        begin
            col2=0;
            if(col < 27)col2=wordOffset+col;
            if(wordOffset == 96) done2 = 1;
            else done2 = 0;
        end
endmodule
