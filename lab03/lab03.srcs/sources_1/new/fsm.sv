`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lafayette College
// Engineer: Henry Grote and Zheping Yin 
// 
// Create Date: 02/23/2021 12:29:36 PM
// Design Name: 
// Module Name: fsm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Controls the counters and generates the clock signal for the LED panel
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module fsm(input logic clk, rst, enb,
           input logic [4:0] count,
           output logic SCLK, LAT, BLANK, enb_c, enb_r
           );
           
       //initializing state variables
       typedef enum logic [2:0] {
            ct = 0,
            ct1 = 1,
            blk = 2,
            nr = 3,
            lat = 4,
            delay = 5
       }state_t;
           
       state_t state, next;
       
       //state transition    
       always_ff @(posedge clk) 
        begin
            if(rst) state <= ct;
            else if(enb) state <=next;
        end
       
       always_comb
        begin
            //default declaration
            SCLK =0;
            LAT=0;
            BLANK = 0;
            enb_c = 0;
            enb_r = 0;
            next = ct;
            case(state)
            //the two states below generates the rgb value of a row
                ct:
                    begin
                        enb_c = 1;
                        next = ct1;
                    end
                ct1:
                    begin
                        SCLK = 1;
                        if(count==31)
                            next = blk;
                    end
                //clean the panel
                blk:
                    begin
                        BLANK = 1;
                        enb_r = 1;
                        next = nr;
                    end
                //go to the next row
                nr:
                    begin
                        BLANK = 1;
                        next = lat;
                    end
                //store the rgb value of the previous row
                lat:
                    begin
                        LAT = 1;
                        BLANK = 1;
                        next = delay;
                    end
                //wait for the led panel to be settled
                delay:
                    begin
                        next = ct;
                    end
            endcase        
        end         
endmodule