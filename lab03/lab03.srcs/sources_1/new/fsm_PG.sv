`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 03:22:47 PM
// Design Name: 
// Module Name: fsm_PG
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


module fsm_PG(
        input logic done1, done2, clk, enb,rst,
        output logic start1, start2,rstC1,rstC2
    );
       //initializing state variables
    typedef enum logic [2:0] {
         start = 0,
         startC = 1,
         stop1 = 2,
         startC2 = 3,
         stop2 = 4
    }state_t;
        
    state_t state, next;
    
    //state transition    
    always_ff @(posedge clk) 
     begin
         if(rst) state <= start;
         else if(enb) state <=next;
     end
    
    always_comb
     begin
         //default declaration
         start1=0;
         start2=0;
         rstC1=0;
         rstC2=0;
         next = start;
         case(state)
         //the two states below generates the rgb value of a row
             start:
                 begin
                     next = startC;
                 end
             startC:
                 begin
                     start1=1;
                     start2=1;
                     if(done1)
                     next=stop1;
                     else
                     next=startC;
                 end
             //clean the panel
             stop1:
                 begin
                     start1=0;
                     rstC1=1;
                     start2=1;
                     next=startC2;
                 end
             //go to the next row
             startC2:
                 begin
                     start1=1;
                     start2=1;
                     if(done2)
                     next=stop2;
                     else
                     next=startC2;
                 end
             //store the rgb value of the previous row
             stop2:
                begin
                    start1=1;
                    start2=0;
                    next=startC;
                    rstC2=1;
                end
         endcase        
     end         
endmodule