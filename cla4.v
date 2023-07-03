module cla4 (input [3:0] a, input [3:0] b, input cin, output [3:0] s, output cout);

    wire [3:0] p,c,g;
    buf(c[0],cin);

    xor xori[3:0] (p[3:0],a[3:0],b[3:0]);
    and andi[3:0] (g[3:0],a[3:0],b[3:0]);

    //c1
    and (p0c0,p[0],c[0]);
    or  (c[1],p0c0,g[0]);

    //c2
    and  (p1p0c0,p0c0,p[1]);
    and  (p1g0,p[1],g[0]);
    or   (c[2],p1p0c0,p1g0,g[1]);

    //c3
    and  (p2p1p0c0,p1p0c0,p[2]);
    and  (p2p1g0,p1g0,p[2]);
    and  (p2g1,p[2],g[1]);
    or   (c[3],p2p1p0c0,p2p1g0,g[2],p2g1);

    //cout
     and  (p3p2p1p0c0,p2p1p0c0,p[3]);
     and  (p3p2p1g0,p2p1g0,p[3]);
     and  (p3p2g1,p2g1,p[3]);
     and  (p3g2,p[3],g[2]);
     or   (cout,p3p2p1p0c0,p3p2p1g0,p3p2g1,p3g2,g[3]);


    xor xorii[3:0] (s[3:0],p[3:0],c[3:0]);

endmodule

   