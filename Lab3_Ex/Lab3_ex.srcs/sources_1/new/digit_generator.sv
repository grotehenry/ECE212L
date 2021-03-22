`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 01:54:09 PM
// Design Name: 
// Module Name: digit_generator
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


module digit_generator (input logic [3:0] num,
			input logic [2:0]  num_color,
			input logic [4:0] col,
			input logic [2:0] row,
			output logic [2:0] rgb);

   logic [31:0] col_out_white, col_out;
   logic [3:0] numcol_index;
   
   
   always_comb
   begin
    rgb =7;
	if(col>26)
	begin
	numcol_index=col-27;
      case (num)      // column data L-R = bottom-top
        4'd0: begin
           case (numcol_index)
             3'd0 : col_out_white = 32'h0ffffff0;
             3'd1 : col_out_white = 32'hf000000f;
             3'd2 : col_out_white = 32'hf000000f;	     
             3'd3 : col_out_white = 32'hf000000f;
             3'd4 : col_out_white = 32'h0ffffff0;	     
             //3'd5 : col_out_white = 32'h00000000;
             default : col_out_white = 32'h10100101; // error in blue!
           endcase // case (numcol_index)
        end
        4'd1: begin
           case (numcol_index)
             3'd0 : col_out_white = 32'h00000000;
             3'd1 : col_out_white = 32'hf00000f0;
             3'd2 : col_out_white = 32'hffffffff;	     
             3'd3 : col_out_white = 32'hf0000000;
             3'd4 : col_out_white = 32'h00000000;
             //3'd5 : col_out_white = 32'h00000000;
             default : col_out_white = 32'h10100101; // error in blue!
           endcase // case (numcol_index)
        end
        4'd2: begin
           case (numcol_index)
             3'd0 : col_out_white = 32'hff0000f0;
             3'd1 : col_out_white = 32'hf0f0000f;
             3'd2 : col_out_white = 32'hf00f000f;
             3'd3 : col_out_white = 32'hf000f00f;
             3'd4 : col_out_white = 32'hf0000ff0;
             //3'd5 : col_out_white = 32'h00000000;
             default : col_out_white = 32'h10100101; // error in blue!
           endcase // case (numcol_index)
        end
        4'd3: begin
           case (numcol_index)
             3'd0 : col_out_white = 32'h0f0000f0;
             3'd1 : col_out_white = 32'hf000000f;
             3'd2 : col_out_white = 32'hf000f00f;	     
             3'd3 : col_out_white = 32'hf000f00f;
             3'd4 : col_out_white = 32'h0fff0ff0;
             //3'd5 : col_out_white = 32'h00000000;
             default : col_out_white = 32'h10100101; // error in blue!
           endcase // case (numcol_index)
        end
        4'd4: begin
           case (numcol_index)
             3'd0 : col_out_white = 32'h0000ffff;
             3'd1 : col_out_white = 32'h0000f000;
             3'd2 : col_out_white = 32'h0000f000;	     
             3'd3 : col_out_white = 32'h0000f000;
             3'd4 : col_out_white = 32'hffffffff;
             //3'd5 : col_out_white = 32'h00000000;
             default : col_out_white = 32'h10100101; // error in blue!
           endcase // case (numcol_index)
        end
        default: begin
           case (numcol_index)      // display an error condition
             3'd0 : col_out_white = 32'h40404040;
             3'd1 : col_out_white = 32'hf0202020;
             3'd2 : col_out_white = 32'h40404040;
             3'd3 : col_out_white = 32'h02020202;
             3'd4 : col_out_white = 32'h40404040;
             3'd5 : col_out_white = 32'h02020202;
             default : col_out_white = 32'h10100101; // error in blue!
           endcase // case (numcol_index)
        end
      endcase // case (num)
      col_out = col_out_white & { 8 {{1'b0, num_color}} };
      
      case (row)
        3'd0 : rgb = col_out[2:0];
        3'd1 : rgb = col_out[6:4];
        3'd2 : rgb = col_out[10:8];
        3'd3 : rgb = col_out[14:12];
        3'd4 : rgb = col_out[18:16];
        3'd5 : rgb = col_out[22:20];
        3'd6 : rgb = col_out[26:24];
        3'd7 : rgb = col_out[30:28];
      endcase
	end
	end
endmodule // digit_generator
