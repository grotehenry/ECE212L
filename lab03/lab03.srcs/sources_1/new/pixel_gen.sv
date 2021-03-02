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


module pixel_gen(input logic [4:0] col, 
                 input logic [2:0] row, 
                 output logic R1, G1, B1, R2,G2, B2);
       always_comb 
         begin
	       R1 = 0; R2 = 0;
	       G1 = 0; G2 = 0;
           B1 = 0; B2 = 0;
           //set the vertical colors
	        if (col <= 15) 
                 begin
                  case (row)
		              3'd0: begin R1 = 1; G1 = 1; B1 = 1; end
                      3'd1: begin R1 = 1; G1 = 0; B1 = 0; end
                      3'd2: begin R1 = 0; G1 = 1; B1 = 0; end
                      3'd3: begin R1 = 0; G1 = 0; B1 = 1; end
	                  3'd4: begin R1 = 0; G1 = 0; B1 = 0; end
		              3'd5: begin R1 = 1; G1 = 1; B1 = 0; end
		              3'd6: begin R1 = 1; G1 = 0; B1 = 1; end
		              3'd7: begin R1 = 0; G1 = 1; B1 = 1; end
		          endcase
                end
            //set the horizontal colors
	       else 
	           begin
                case (col)
                  5'd17: begin R2 = 0; G2 = 1; B2 = 1; end
                  5'd19: begin R2 = 1; G2 = 0; B2 = 1; end
                  5'd21: begin R2 = 1; G2 = 1; B2 = 0; end
                  5'd23: begin R2 = 0; G2 = 0; B2 = 0; end
                  5'd25: begin R2 = 0; G2 = 0; B2 = 1; end
                  5'd27: begin R2 = 0; G2 = 1; B2 = 0; end
                  5'd29: begin R2 = 1; G2 = 0; B2 = 0; end
	              5'd31: begin R2 = 1; G2 = 1; B2 = 1; end
	            endcase
	           end
        end
endmodule