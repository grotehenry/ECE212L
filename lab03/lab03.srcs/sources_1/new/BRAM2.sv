`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2020 04:32:37 PM
// Design Name: 
// Module Name: RAM_Top
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


module BRAM2(input RST, RDCLK, WRCLK, RDEN, WREN, REGCE,
    input logic [3:0] WE,
    input logic [12:0] RDADDR,
    input logic [9:0] WRADDR,
    input logic [31:0] DI,
    output logic [3:0] DO);
    BRAM_SDP_MACRO #(
        .BRAM_SIZE("36Kb"), // Target BRAM, "18Kb" or "36Kb"
        .DEVICE("7SERIES"), // Target device: "7SERIES"
        .WRITE_WIDTH(32),   // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb"),
        .READ_WIDTH(4),     // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
        .DO_REG(0),         // Optional output register (0 or 1)
        .INIT_FILE ("NONE"),
        .SIM_COLLISION_CHECK ("ALL"), // Collision check enable "ALL", "WARNING_ONLY",
        //"GENERATE_X_ONLY" or "NONE"
        .SRVAL(72'h000000000000000000), // Set/Reset value for port output
        .INIT(72'h000000000000000000), // Initial values on output port
        .WRITE_MODE("WRITE_FIRST"), // Specify "READ_FIRST" for same clock or synchronous clocks
         // Specify "WRITE_FIRST for asynchronous clocks on ports
        .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000), //each init is 256 bits long, 8 columns long
        .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_04(256'h10006000_01220000_00000000_11226644_00200000_00026000_00000600_11226644),
        .INIT_05(256'h10000000_01220000_10000000_01226000_00000000_01220000_10006000_10006000),
        .INIT_06(256'h10020004_10020004_10006640_00000000_00000000_00000000_00000000_01226000),
        .INIT_07(256'h00220000_10206000_10206000_10206000_01220000_00000000_01200004_10020004),
        .INIT_08(256'h00226000_00000000_00020000_00006000_00006000_00020000_11226000_00000000),
        .INIT_09(256'h11226000_00000000_11226040_00000000_00226000_01000000_10000000_01000000),
        .INIT_0A(256'h10020040_10020040_00006600_00000000_11226000_00000600_00000600_00006000),
        .INIT_0B(256'h00000000_00000000_00000000_00000000_00000000_00000000_01226600_10020040),//end of "Now Serving"
        .INIT_OC(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),//Start of Numbers 0-9, starts column 96, starts w/ 0
        .INIT_OD(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
        .INIT_OE(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
        .INIT_OF(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000), //4
        .INIT_10(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
        .INIT_11(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000),
        .INIT_12(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000), //8
        .INIT_13(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000)
        
        ) BRAM_SDP_MACRO_inst (
            .DO(DO),  // Output read data port, width defined by READ_WIDTH parameter
            .DI(DI), // Input write data port, width defined by WRITE_WIDTH parameter
            .RDADDR(RDADDR), // Input read address, width defined by read port depth
            .RDCLK(RDCLK), // 1-bit input read clock
            .RDEN(RDEN),   // 1-bit input read port enable
            .REGCE(REGCE),  // 1-bit input read output register enable
            .RST(RST),     // 1-bit input reset
            .WE(WE),       // Input write enable, width defined by write port depth
            .WRADDR(WRADDR), // Input write address, width defined by write port depth
            .WRCLK(WRCLK),          // 1-bit input write clock
            .WREN(WREN)            // 1-bit input write port enable
         );
    // End of BRAM_SDP_MACRO_inst instantiation

endmodule