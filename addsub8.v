module addsub8 (input [7:0] op1 ,input [7:0] op2 ,input ais ,output [7:0] out);

wire [7:0] fop2;
xor xori[7:0] (fop2[7:0],op2[7:0],ais);
cla4 a1 (op1[3:0],fop2[3:0], ais, out[3:0], cout);
cla4 a2 (op1[7:4],fop2[7:4], cout, out[7:4], ot);  

endmodule