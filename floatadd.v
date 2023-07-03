module floatadd (input [11:0] x,input [11:0] y, output [11:0] z);

    wire [3:0] k,xe1;
    wire [7:0] q1,q2,brl,xm_1;
    wire [8:0] sm;


    buf (z[11],1'b0);

    sub_4 m1 (x[10:7],y[10:7],k[3:0]);
    
    buf bufi1[6:0] (brl[6:0],y[6:0]);
    buf (brl[7],1'b1);

    barrel m2 (brl,k[2:0],q1);
    mux_8_2x1 m3 (q1,8'b00000000,k[3],q2);

    buf bufi2[6:0] (xm_1[6:0],x[6:0]);
    buf (xm_1[7],1'b1);

    add8 m4 (xm_1,q2,sm);

    cla4 m5 (x[10:7],4'b0001,1'b0,xe1,cout);
    mux_4_2x1 m6 (x[10:7],xe1,sm[8],z[10:7]);
    mux_7_2x1 m7 (sm[6:0],sm[7:1],sm[8],z[6:0]);

endmodule