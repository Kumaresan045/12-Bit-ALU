module add8 (input [7:0] op1,input [7:0] op2, output [8:0] ot);

    cla4 a1 (op1[3:0],op2[3:0], 1'b0, ot[3:0], cout);
    cla4 a2 (op1[7:4],op2[7:4], cout, ot[7:4], ot[8]);

endmodule