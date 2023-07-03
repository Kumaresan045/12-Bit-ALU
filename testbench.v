`timescale 1ns/1ns
module test;

    reg  [2:0] readAddr1,readAddr2,writeAddr,opcode;
    reg we,init;
    wire [11:0] writeIn;
    reg  [11:0] initData;
    wire [11:0] readOut1,readOut2;
    wire [26:0] instruction;
    wire [11:0] out,inp1,inp2;

    registerfile regfile (readAddr1,readOut1,readAddr2,readOut2,writeAddr,writeIn,we);
    ALU alu (instruction,out);

    //Interface of ALU and regfile
    buf bufi[2:0]  (instruction[26:24],opcode);
    buf bufj[11:0] (instruction[23:12],inp1);
    buf bufk[11:0] (instruction[11:0],inp2);
    buf bufl[11:0] (inp1,readOut1);
    buf bufm[11:0] (inp2,readOut2);
    mux_12_2x1 mux1 (out,initData,init,writeIn);

    initial begin

    $dumpfile("test.vcd");
    $dumpvars(0,test);
    // Initializing the register file
    we=1'b1; init = 1'b1;
    initData=12'b000000011111; writeAddr=3'b000; #1;
    initData=12'b000000000010; writeAddr=3'b001; #1;
    initData=12'b000000000010; writeAddr=3'b010; #1;
    initData=12'b000000000011; writeAddr=3'b011; #1;
    initData=12'b000000000100; writeAddr=3'b100; #1;
    initData=12'b000000000101; writeAddr=3'b101; #1;
    initData=12'b000000000110; writeAddr=3'b110; #1;
    initData=12'b000000000111; writeAddr=3'b111; #1;
    we=1'b0; init = 1'b0;
    
   // MUL R4,R0,R1;
    opcode = 3'b011; readAddr1 = 3'b000; readAddr2 = 3'b001; writeAddr = 3'b100; #8;
    we=1'b1; #8; we=1'b0;
    readAddr1 = 3'b100; #8;
               
    $finish;
    end

endmodule