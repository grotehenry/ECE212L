`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lafayette College
// Engineer: Henry Grote and Zheping Yin
// 
// Create Date: 02/23/2021 01:19:44 PM
// Design Name: LED Matrix Controller
// Module Name: LEDMatrixTopLevel
// Project Name: Lab 02
// Target Devices: Nexys4 DDR
// Tool Versions: XILINX VIVADO 2016.2
// Description: Controlls an Adafruit 16x16 matrix with a static image
// 
// Dependencies: none
// 
// Revision: 1
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module LEDMatrixTopLevel(
    input clk,
    input rst_raw,
    input np_raw,
    input [2:0] NEXTCOLOR,
    output sclk,
    output lat,
    output blank,
    output R1,
    output B1,
    output G1,
    output R2,
    output B2,
    output G2,
    output C,
    output B,
    output A
    );
    
    logic rst_deb, rst, np_deb, NEXTPB;
    logic [4:0] col;
    logic [2:0] row, disp_row;
    debounce d1(.clk(clk), .pb(rst_raw), .pb_debounced(rst_deb));
    single_pulser s1(.clk(clk), .din(rst_deb), .d_pulse(rst));
    
    debounce d2(.clk(clk), .pb(np_raw), .pb_debounced(np_deb));
    single_pulser s2(.clk(clk), .din(np_deb), .d_pulse(NEXTPB));
    
    sequencer sq(.clk(clk), .rst(rst),.SCLK(sclk), .LAT(lat), .BLANK(blank), .row(row), .disp_row(disp_row), .col(col));
    pixel_gen pg(.NEXTPB(NEXTPB),.NEXTCOLOR(NEXTCOLOR),.clk(clk),.rst(rst),.col(col), .row(row), .R1(R1), .G1(G1), .B1(B1), .R2(R2), .G2(G2), .B2(B2));
    
    assign C = disp_row[2];
    assign B = disp_row[1];
    assign A = disp_row[0];
endmodule
