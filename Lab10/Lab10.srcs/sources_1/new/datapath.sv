// The datapath unit is a structural verilog module.  That is,
// it is composed of instances of its sub-modules.  For example,
// the instruction register is instantiated as a 32-bit flopenr.
// The other submodules are likewise instantiated.

module datapath(input  logic        clk, reset,
                input  logic        pcen, irwrite, regwrite,
                input  logic        alusrca, iord, memtoreg, regdst,
                input  logic [1:0]  alusrcb, pcsrc, 
                input  logic [2:0]  alucontrol,
                output logic [5:0]  op, funct,
                output logic        zero,
                output logic [31:0] adr, writedata, 
                input  logic [31:0] readdata);

    // Below are the internal signals of the datapath module.
    
    logic [4:0]  writereg;
    logic [31:0] pcnext, pc;
    logic [31:0] instr, data, srca, srcb;
    logic [31:0] a;
    logic [31:0] aluresult, aluout;
    logic [31:0] signimm;   // the sign-extended immediate
    logic [31:0] signimmsh;	// the sign-extended immediate shifted left by 2
    logic [31:0] wd3, rd1, rd2;
    logic [31:0] rBo,rAo,rALUo;
    
    // op and funct fields to controller
    assign op = instr[31:26];
    assign funct = instr[5:0];
    assign writedata = rBo;
    // datapath
    floprEn #(32) PC(.clk(clk),.d(pcnext),.reset(reset),.en(pcen),.q(pc));
    mux2  #(32) pcMux(.d0(pc),.d1(rALUo),.s(iord),.y(adr));
    floprEn #(32) IR (.clk(clk),.reset(reset),.en(irwrite),.d(readdata),.q(instr));
    flopr #(32) MDR (.clk(clk),.reset(reset),.d(readdata),.q(data));
    mux2  #(5)  rfMux(.d0(instr[20:16]),.d1(instr[15:11]),.s(regdst),.y(writereg));
    mux2 #(32)  wdMux(.d0(pc),.d1(rALUo),.s(memtoreg),.y(wd3));
    regfile     rf(.clk(clk),.we3(regwrite),.ra1(instr[25:21]), .ra2(instr[20:16]), 
                .wa3(writereg),.wd3(wd3),.rd1(rd1),.rd2(rd2));
    flopr #(32) A (.clk(clk),.reset(reset),.d(rd1),.q(rAo));
    flopr #(32) B (.clk(clk),.reset(reset),.d(rd2),.q(rBo));
    mux2  #(32) aluMuxA (.d0(pc),.d1(rAo),.s(alusrca),.y(srca));
    signext     se(.a(instr[15:0]), .y(signimm));
    sl2         immsh(.a(signimm), .y(signimmsh));
    mux4  #(32) aluMuxB (.d0(rBo),.d1(31'd4),.d2(signimm),.d3(signimmsh),.s(alusrcb),.y(srcb));
    alu         ALU (.a(srca),.b(srcb),.alucontrol(alucontrol),.result(aluresult),.zero(zero));
    flopr #(32) ALUOUT(.clk(clk),.reset(reset),.d(aluresult),.q(rALUo));
    mux3 #(32) pcSrcMux(.d0(aluresult),.d1(rALUo),.d2({pc[31:26],instr[23:0],2'd0}),.s(pcsrc),.y(pcnext));
endmodule