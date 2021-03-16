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
                 output logic R1, G1, B1, R2,G2, B2);
       //period of delay enable signal generation
       parameter DELAY_MS = 1000;
       //initializing internal wires
       logic done1, done2, start1, start2, rstC1, rstC2,enb;
       logic[6:0] colOff1, col2;
       logic [3:0] num;
       logic [2:0] rgb2, rgb1;
       //connecting blocks
       fsm_PG FSM(.done1(done1),.done2(done2),.clk(clk),.rst(rst),.enb(enb),.start1(start1),.start2(start2),.rstC1(rstC1),.rstC2(rstC2));
       delay_enb#(.DELAY_MS(DELAY_MS))
       DENB(.clk,.rst,.clr(rst),.enb_out(enb));
       scroll_count_1 SC1(.col(col),.enb(enb),.start1(start1),.rst(rst),.rstC1(rstC1),.clk(clk),.colOff1(colOff1),.done1(done1));
       scroll_count_2 SC2(.enb(enb),.start2(start2),.clk(clk),.rstC2(rstC2),.rst(rst),.col(col),.done2(done2),.col2(col2));
       number_count NC (.NEXTPB(NEXTPB),.clk(clk),.rst(rst),.num(num));
       digit_generator DG (.num(num),.num_color(NEXTCOLOR),.col(col),.row(row),.rgb(rgb2));
       BRAM1 ram1 (.RST(rst),.RDCLK(clk),.WRCLK(clk), .RDEN(1'b1), .WREN(1'b0), .REGCE(1'b0), .WE(1'b0),.RDADDR({colOff1,row}),
       .WRADDR(10'd0), .DI(32'd0),.DO({R1,G1,B1}));
       BRAM2 ram2 (.RST(rst),.RDCLK(clk),.WRCLK(clk), .RDEN(1'b1), .WREN(1'b0), .REGCE(1'b0), .WE(1'b0), .RDADDR({col2,row}),
       .WRADDR(10'd0), .DI(32'd0),.DO(rgb1));
       chooser CH (.rgb1(rgb1),.rgb2(rgb2),.col(col),.R2(R2),.G2(G2),.B2(B2));
endmodule
