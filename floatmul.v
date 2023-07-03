module floatmul (input [11:0] x,input [11:0] y, output [11:0] z);

    wire [7:0] x1,y1;
    wire [15:0] pm;
    wire [5:0] addout,o1,o2;

    buf(x1[7],1'b1);
    buf(y1[7],1'b1);

    buf bufi1[6:0] (x1[6:0],x[6:0]);
    buf bufi2[6:0] (y1[6:0],y[6:0]);

    multi_u g1 (x1[7:0],y1[7:0],pm[15:0]);

    mux_7_2x1 g2 (pm[13:7],pm[14:8],pm[15],z[6:0]);

    cla4 g3 (x[10:7],y[10:7],1'b0,addout[3:0],addout[4]);

    buf(addout[5],addout[4]);

    sub_6 g4 (addout[5:0],6'b000111,o1);
    sub_6 g5 (addout[5:0],6'b000110,o2);

    mux_4_2x1 g6 (o1[3:0],o2[3:0],pm[15],z[10:7]);

    xor (z[11],x[11],y[11]);

endmodule