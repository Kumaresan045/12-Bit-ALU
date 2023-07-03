module ALU (input [26:0] instruction, output [11:0] out);

    wire [2:0] opcode;
    wire [7:0] decode;
    wire [11:0] res0,res1,res2,res3,res4,res5,res6,res7,tempres0,tempres1,tempres2,tempres3,tempres4,tempres5,tempres6,tempres7;
    wire [15:0] mulout;
    buf bufiii[2:0] (opcode[2:0],instruction[26:24]);
    wire [11:0] op1,op2;
    buf bufi3[11:0] (op1[11:0],instruction[23:12]);
    buf bufi4[11:0] (op2[11:0],instruction[11:0]);

    decoder_3X8 dec (opcode[2:0],decode[7:0]);
    buf bufi[11:0] (res0[11:0],1'b0);
    addsub8 add0 (op1[7:0],op2[7:0],1'b0,res1[7:0]);
    addsub8 add1 (op1[7:0],op2[7:0],1'b1,res2[7:0]);
    multi_u mul0 (op1[7:0],op2[7:0],mulout);
    multi_s mul1 (op1[7:0],op2[7:0],res4[7:0]);
    floatadd flt0 (op1,op2,res5);
    floatmul flt1 (op1,op2,res6);
    comp8 cmp0 (op1[7:0],op2[7:0],res7[0]);

    buf bufki[7:0] (res3[7:0],mulout[7:0]);

    buf bufi0[3:0] (res1[11:8],1'b0);
    buf bufi1[3:0] (res2[11:8],1'b0);
    buf bufi2[3:0] (res3[11:8],1'b0);
    buf bufj3[3:0] (res4[11:8],1'b0);
    buf bufj4[10:0] (res7[11:1],1'b0);

    buf bufk[11:0] (tempres0[11:0],res0[11:0]);

    and12_1 g1 (res1,decode[1],tempres1);
    and12_1 g2 (res2,decode[2],tempres2);
    and12_1 g3 (res3,decode[3],tempres3);
    and12_1 g4 (res4,decode[4],tempres4);
    and12_1 g5 (res5,decode[5],tempres5);
    and12_1 g6 (res6,decode[6],tempres6);
    and12_1 g7 (res7,decode[7],tempres7);

    or ori[11:0] (out[11:0],tempres0[11:0],tempres1[11:0],tempres2[11:0],tempres3[11:0],tempres4[11:0],tempres5[11:0],tempres6[11:0],tempres7[11:0]);

endmodule