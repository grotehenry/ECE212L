`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2020 11:38:58 PM
// Design Name: 
// Module Name: mipstest
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


module mipstest1();

  logic        clk;
  logic        reset;

  logic [31:0] writedata, adr,readdata;
  logic        memwrite;

  // instantiate device to be tested
  top dut(clk, reset, adr,writedata,memwrite,readdata);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // check results
  always @(negedge clk)
    begin
      if(memwrite) begin
        if(adr === 84 & writedata === 7) begin
          $display("Simulation succeeded");
          $stop;
        end else if (adr !== 80) begin
          $display("Simulation failed");
          $stop;
        end
      end
    end
endmodule