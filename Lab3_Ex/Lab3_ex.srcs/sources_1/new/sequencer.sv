`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lafayette College
// Engineer: Henry Grote and Zheping Yin
// 
// Create Date: 02/23/2021 01:06:09 PM
// Design Name: 
// Module Name: sequencer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Controlls the RGB output and the behaviors of the LED panel
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sequencer(
        input logic clk, rst,
        output logic SCLK, LAT, BLANK,
        output logic [2:0] row, disp_row,
        output logic [4:0] col
    );
    //period of delay enable signal generation
    parameter DELAY_NS = 1000;
    //initializing internal wires
    logic enb_c, enb_r, enb_d,rst_d,rst_c,doneC;
    logic [5:0] d;
    //connecting blocks
    fsm FSM(.clk,.rst,.enb,.doneC,.d,.SCLK,.LAT,.BLANK,.enb_c,.enb_r,.enb_d,.rst_c,.rst_d);
    delay_enb#(.DELAY_NS(DELAY_NS))
    DENB(.clk,.rst,.clr(rst),.enb_out(enb));
    row_count RC(.clk,.rst,.enb,.enb_r,.row,.disp_row);
    col_count CC(.clk,.rst(rst||rst_c),.enb,.enb_c,.col,.doneC);
    delay_count DC(.clk,.rst(rst||rst_d),.enb,.enb_d,.d);
endmodule
