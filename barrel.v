module barrel (input [7:0] ym,input [2:0] k, output [7:0] q);

    wire [7:0] t1,t2,t3,t4,t5,t6,t7,t8;
    buf bufi1[7:0] (t1[7:0],ym[7:0]);
    buf bufi2[6:0] (t2[6:0],ym[7:1]);
    buf bufi3[5:0] (t3[5:0],ym[7:2]);
    buf bufi4[4:0] (t4[4:0],ym[7:3]);
    buf bufi5[3:0] (t5[3:0],ym[7:4]);
    buf bufi6[2:0] (t6[2:0],ym[7:5]);
    buf bufi7[1:0] (t7[1:0],ym[7:6]);
    buf buf8 (t8[0],ym[7]);

    buf buf9 (t2[7],1'b0);
    buf bufi10[1:0] (t3[7:6],1'b0);
    buf bufi11[2:0] (t4[7:5],1'b0);
    buf bufi12[3:0] (t5[7:4],1'b0);
    buf bufi13[4:0] (t6[7:3],1'b0);
    buf bufi14[5:0] (t7[7:2],1'b0);
    buf bufi15[6:0] (t8[7:1],1'b0);

    mux_8_8x1 muxi1 (t1,t2,t3,t4,t5,t6,t7,t8,k,q);

endmodule