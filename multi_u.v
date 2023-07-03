module multi_u (input [7:0] a, input [7:0] b, output [15:0] sum);

    wire [15:0] pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7,c10,s10,c11,s11,c20,s20,c21,s21,c30,s30,c40,s40;

    buf bufi0[7:0] (pp0[15:8],1'b0);
    buf bufi1[6:0] (pp1[15:9],1'b0);
    buf bufi2[5:0] (pp2[15:10],1'b0);
    buf bufi3[4:0] (pp3[15:11],1'b0);
    buf bufi4[3:0] (pp4[15:12],1'b0);
    buf bufi5[2:0] (pp5[15:13],1'b0);
    buf bufi6[1:0] (pp6[15:14],1'b0);

    buf (pp7[15],1'b0);
    buf (pp1[0],1'b0);
    buf bi1[1:0] (pp2[1:0],1'b0);
    buf bi2[2:0] (pp3[2:0],1'b0);
    buf bi3[3:0] (pp4[3:0],1'b0);
    buf bi4[4:0] (pp5[4:0],1'b0);
    buf bi5[5:0] (pp6[5:0],1'b0);
    buf bi6[6:0] (pp7[6:0],1'b0);

    ppi ppi0 (a,b[0],pp0[7:0]);
    ppi ppi1 (a,b[1],pp1[8:1]);
    ppi ppi2 (a,b[2],pp2[9:2]);
    ppi ppi3 (a,b[3],pp3[10:3]);
    ppi ppi4 (a,b[4],pp4[11:4]);
    ppi ppi5 (a,b[5],pp5[12:5]);
    ppi ppi6 (a,b[6],pp6[13:6]);
    ppi ppi7 (a,b[7],pp7[14:7]);

    reducer_16 r0 (pp0,pp1,pp2,c10,s10);
    reducer_16 r1 (pp3,pp4,pp5,c11,s11);
    reducer_16 r2 (c10,s10,c11,c20,s20);
    reducer_16 r3 (s11,pp6,pp7,c21,s21);
    reducer_16 r4 (c20,s20,c21,c30,s30);
    reducer_16 r5 (c30,s30,s21,c40,s40);

    cla16_high cla16_new0 (c40,s40,1'b0,sum,cout);


endmodule