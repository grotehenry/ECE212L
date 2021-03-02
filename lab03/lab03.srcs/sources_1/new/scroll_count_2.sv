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


module scroll_count_2(input logic enb,start2,numOffset,clk,rstFSM,rst,col,
                      output logic done2,
                      output logic [7:0] col2);
    logic [6:0] wordOffset;
    always_ff @(posedge clk)
        begin
            if(rst||rstFSM)wordOffset<=0;
            else if(enb&&start2&&!done2)wordOffset<=wordOffset+1;
        end
    always_comb
        begin
            if(col>=27)col2=32+59+5+32+col-27+numOffset*6;
            else if(col<27)col2=wordOffset+col;
            if(wordOffset==90) done2 = 1;
            else done2 =0;
        end
endmodule
