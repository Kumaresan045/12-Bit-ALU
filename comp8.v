module comp8 (input [7:0] op1,input [7:0] op2, output out);

    wire [7:0] xori;
    xor xorii[7:0] (xori[7:0],op1[7:0],op2[7:0]);
    or (out,xori[7],xori[6],xori[5],xori[4],xori[3],xori[2],xori[1],xori[0]);

endmodule