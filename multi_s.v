module multi_s (input [7:0] a, input [7:0] b, output [7:0] c);

    wire [15:0] pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7,notpp7,c10,s10,c11,s11,c20,s20,c21,s21,c30,s30,c40,s40,c41,s41,sum;
    wire [7:0] sgnext;
    wire [8:0] notsum;
  
    
    and andi[7:0] (sgnext[7:0],b[7:0],a[7]);
    
    buf bi[7:0] (pp0[15:8],sgnext[0]);
    buf bj[6:0] (pp1[15:9],sgnext[1]);
    buf bk[5:0] (pp2[15:10],sgnext[2]);
    buf bl[4:0] (pp3[15:11],sgnext[3]);
    buf bn[3:0] (pp4[15:12],sgnext[4]);
    buf bp[2:0] (pp5[15:13],sgnext[5]);
    buf bo[1:0] (pp6[15:14],sgnext[6]);
    buf (pp7[15],sgnext[7]);

    buf(pp1[0],0);
    buf bufi1[1:0] (pp2[1:0],1'b0);
    buf bufi2[2:0] (pp3[2:0],1'b0);
    buf bufi3[3:0] (pp4[3:0],1'b0);
    buf bufi4[4:0] (pp5[4:0],1'b0);
    buf bufi5[5:0] (pp6[5:0],1'b0);
    buf bufi6[6:0] (pp7[6:0],1'b0);

    ppi ppi0 (a,b[0],pp0[7:0]);
    ppi ppi1 (a,b[1],pp1[8:1]);
    ppi ppi2 (a,b[2],pp2[9:2]);
    ppi ppi3 (a,b[3],pp3[10:3]);
    ppi ppi4 (a,b[4],pp4[11:4]);
    ppi ppi5 (a,b[5],pp5[12:5]);
    ppi ppi6 (a,b[6],pp6[13:6]);
    ppi ppi7 (a,b[7],pp7[14:7]);

    not notiii[15:0] (notpp7[15:0],pp7[15:0]);

    reducer_16 r0 (pp0,pp1,pp2,c10,s10);
    reducer_16 r1 (pp3,pp4,pp5,c11,s11);
    reducer_16 r2 (c10,s10,c11,c20,s20);
    reducer_16 r3 (s11,pp6,notpp7,c21,s21);
    reducer_16 r4 (c20,s20,c21,c30,s30);
    reducer_16 r5 (c30,s30,s21,c40,s40);
    reducer_16 r6 (s40,16'b0000000000000001,c40,s41,c41);

    cla16_high cla16_new0 (c41,s41,1'b0,sum,cout);
    not noti[8:0] (notsum[8:0],sum[15:7]);
    
    buf bufi[7:0] (c[7:0],sum[7:0]);

endmodule