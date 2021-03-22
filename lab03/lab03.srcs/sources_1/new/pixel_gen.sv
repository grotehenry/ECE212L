`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lafayette College
// Engineer: Henry Grote and Zheping Yin
// 
// Create Date: 02/23/2021 12:27:18 PM
// Design Name: 
// Module Name: pixel_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generates the RGB values according to the row and col values
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pixel_gen(input logic NEXTPB,clk,rst,
                 input logic [2:0] NEXTCOLOR,
                 input logic [4:0] col, 
                 input logic [2:0] row, 
                 output logic R1, G1, B1, R2,G2, B2,
                 output logic [3:0] num);
       //period of delay enable signal generation
       parameter DELAY_MS = 100;
       //initializing internal wires
       logic done1, done2, start1, start2, rstC1, rstC2,enb;
       logic[9:0] colOff1, col2;
       //logic [3:0] num;
       logic [2:0] rgb2, rgb1;
       //connecting blocks
       delay_enb#(.DELAY_MS(DELAY_MS))
       DENB(.clk,.rst,.clr(rst),.enb_out(enb));
       scroll_count_1 SC1(.col(col),.enb(enb),.rst(rst),.clk(clk),.colOff1(colOff1));
       scroll_count_2 SC2(.enb(enb),.clk(clk),.rst(rst),.col(col),.col2(col2));
       number_count NC (.NEXTPB(NEXTPB),.clk(clk),.rst(rst),.num(num));
       digit_generator DG (.num(num),.num_color(NEXTCOLOR),.col(col),.row(row),.rgb(rgb2));
       BRAM1 ram1 (.RST(rst), .DI(1'd0),.WRADDR(1'd0), .WE(3'd0), .WREN(1'd0), .WRCLK(clk),
                            .RDADDR({colOff1, row}), .RDEN(1), .REGCE(1'd0), .RDCLK(clk),
                            .DO({R1,G1,B1}));
       BRAM2 ram2 (.DI(0), .WRADDR(0), .WE(3'd0), .WREN(1'b1), .WRCLK(clk),
                                                 .RDADDR({col2, row}), .RDEN(1'b1), .REGCE(1'b0), .RDCLK(clk),.DO(rgb1));
       chooser CH (.rgb1(rgb1),.rgb2(rgb2),.col(col),.R2(R2),.G2(G2),.B2(B2));
endmodule
