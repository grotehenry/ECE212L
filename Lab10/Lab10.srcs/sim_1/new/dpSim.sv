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


module mipstest();
    logic        clk;
    logic        reset;
    logic        pcen, irwrite, regwrite;
    logic        alusrca, iord, memtoreg, regdst;
    logic [1:0]  alusrcb, pcsrc;
    logic [2:0]  alucontrol;
    logic [5:0]  op, funct;
    logic        zero;
    logic [31:0] adr, writedata;
    logic [31:0] readdata;
    
    // instantiate device to be tested
    datapath dut(clk, reset, pcen, irwrite, regwrite,alusrca, iord, memtoreg, regdst,alusrcb, pcsrc,alucontrol,op, funct,zero,adr, writedata,readdata);
    
    
    
    // generate clock to sequence tests
       parameter CLK_PD = 10;
            always begin
            clk = 1'b0; #(CLK_PD/2);
            clk = 1'b1; #(CLK_PD/2);
            end
    
    
    // initialize test
    initial begin
        @(posedge clk);
            reset = 1; 
        @(posedge clk);
            reset = 0;
        //addi $t1, $0, 25
        @(posedge clk);  
            pcen=1;
            irwrite=1;
            regwrite=0;
            alusrca=0;
            iord=0;
            memtoreg=0;
            alusrcb=2'd1;
            pcsrc=2'd0;
            alucontrol=3'b010;
            readdata=32'b00100000000010010000000000100101;
        @(posedge clk); 
            pcen=0;
            irwrite=0;
            regwrite=0;
            alusrca=0;
            iord=0;
            memtoreg=0;
            alusrcb=2'd3;
            pcsrc=2'd0;
            alucontrol=3'b010;
            readdata=32'b00100000000010010000000000100101;
        @(posedge clk); 
            pcen=0;
            irwrite=0;
            regwrite=0;
            alusrca=1;
            iord=0;
            memtoreg=0;
            alusrcb=2'd2;
            pcsrc=2'd1;
            alucontrol=3'b010;
            readdata=32'b00100000000010010000000000100101;
        @(posedge clk); 
            pcen=0;
            irwrite=0;
            regwrite=1;
            alusrca=1;
            iord=0;
            memtoreg=0;
            regdst=0;
            alusrcb=2'd2;
            pcsrc=2'd1;
            alucontrol=3'b010;
            readdata=32'b00100000000010010000000000100101;
         
        //addi $t2, $0, 25
        @(posedge clk);  
            pcen=1;
            irwrite=1;
            regwrite=0;
            alusrca=0;
            iord=0;
            memtoreg=0;
            alusrcb=2'd1;
            pcsrc=2'd0;
            alucontrol=3'b010;
            readdata=32'b00100000000010100000000000100101;
        @(posedge clk); 
            pcen=0;
            irwrite=0;
            regwrite=0;
            alusrca=0;
            iord=0;
            memtoreg=0;
            alusrcb=2'd3;
            pcsrc=2'd0;
            alucontrol=3'b010;
            readdata=32'b00100000000010100000000000100101;
        @(posedge clk); 
            pcen=0;
            irwrite=0;
            regwrite=0;
            alusrca=1;
            iord=0;
            memtoreg=0;
            alusrcb=2'd2;
            pcsrc=2'd1;
            alucontrol=3'b010;
            readdata=32'b00100000000010100000000000100101;
        @(posedge clk); 
            pcen=0;
            irwrite=0;
            regwrite=1;
            alusrca=1;
            iord=0;
            memtoreg=0;
            regdst=0;
            alusrcb=2'd2;
            pcsrc=2'd1;
            alucontrol=3'b010;
            readdata=32'b00100000000010100000000000100101;
            
        //j 25
        @(posedge clk);
            pcen=1;
            irwrite=1;
            regwrite=0;
            alusrca=0;
            iord=0;
            memtoreg=0;
            alusrcb=2'd1;
            pcsrc=2'd0;
            alucontrol=3'b010;
            readdata=32'b00001000000000000000000000100101;
        @(posedge clk); 
            pcen=0;
            irwrite=0;
            regwrite=0;
            alusrca=0;
            iord=0;
            memtoreg=0;
            alusrcb=2'd3;
            pcsrc=2'd0;
            alucontrol=3'b010;
            readdata=32'b00001000000000000000000000100101;
        @(posedge clk); 
            pcen=1;
            irwrite=0;
            regwrite=0;
            alusrca=1;
            iord=0;
            memtoreg=0;
            alusrcb=2'd0;
            pcsrc=2'd2;
            alucontrol=3'b110;
            readdata=32'b00001000000000000000000000100101;
            
        //beq $t1, $t2, 0
        @(posedge clk);  
            pcen=1;
            irwrite=1;
            regwrite=0;
            alusrca=0;
            iord=0;
            memtoreg=0;
            alusrcb=2'd1;
            pcsrc=2'd0;
            alucontrol=3'b010;
            readdata=32'b00010001001010100000000000000000;
        @(posedge clk); 
            pcen=0;
            irwrite=0;
            regwrite=0;
            alusrca=0;
            iord=0;
            memtoreg=0;
            alusrcb=2'd3;
            pcsrc=2'd0;
            alucontrol=3'b010;
            readdata=32'b00010001001010100000000000000000;
        @(posedge clk); 
            pcen=0;
            irwrite=0;
            regwrite=0;
            alusrca=1;
            iord=0;
            memtoreg=0;
            alusrcb=2'd0;
            pcsrc=2'd1;
            alucontrol=3'b110;
            readdata=32'b00010001001010100000000000000000;
        @(posedge clk);        
        $stop;
    end
endmodule