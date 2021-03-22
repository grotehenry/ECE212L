`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 01:47:59 PM
// Design Name: 
// Module Name: BRAM1
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


module BRAM1(input RST, RDCLK, WRCLK, RDEN, WREN, REGCE,
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
        .INIT_04(256'h10000004_01226640_00000000_10000004_10006004_10006004_10006004_11226644),
        .INIT_05(256'h10006004_10006004_10006004_11226644_00000000_01000040_10000004_10000004),
        .INIT_06(256'h00000000_10000640_10006004_10020004_10200004_11000040_00000000_10000004),
        .INIT_07(256'h10006004_10020004_10200004_11000040_00000000_10000000_11226644_10000040),
        .INIT_08(256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_10000640)
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