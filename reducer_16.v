module reducer_16 (input [15:0] x, input [15:0] y, input [15:0] z,output [15:0] c,output [15:0] s);

  wire [15:0] ctemp;
  buf(c[0],0);
  fa fai[15:0] (x[15:0],y[15:0],z[15:0],s[15:0],ctemp[15:0]);
  buf bufi[14:0] (c[15:1],ctemp[14:0]);  

endmodule