module cla16_high (input [15:0] a, input [15:0] b, input cin, output [15:0] s, output cout);

    wire [3:0] carry,pi,gi;
    wire [15:0] p,g;

    //pi,gi's
    xor xori[15:0] (p[15:0],a[15:0],b[15:0]);
    and andi[15:0] (g[15:0],a[15:0],b[15:0]);

    //higher order pIi's
    and (pi[0],p[3],p[2],p[1],p[0]);
    and (pi[1],p[7],p[6],p[5],p[4]);
    and (pi[2],p[11],p[10],p[9],p[8]);

    //higher order gIi's
    and (p3p2p1g0,p[3],p[2],p[1],g[0]);
    and (p7p6p5g4,p[7],p[6],p[5],g[4]);
    and (p11p10p9g8,p[11],p[10],p[9],g[8]);

    and (p3p2g1,p[3],p[2],g[1]);
    and (p7p6g5,p[7],p[6],g[5]);
    and (p11p10g9,p[11],p[10],g[9]);

    and (p3g2,p[3],g[2]);
    and (p7g6,p[7],g[6]);
    and (p11g10,p[11],g[10]);

    or (gi[0],p3p2p1g0,p3p2g1,p3g2,g[3]);
    or (gi[1],p7p6p5g4,p7p6g5,p7g6,g[7]);
    or (gi[2],p11p10p9g8,p11p10g9,p11g10,g[11]);

    //c4
    and (pi0c0,pi[0],cin);
    or (c4,pi0c0,gi[0]);

    //c8
    and (pi1pi0c0,pi[1],pi[0],cin);
    and (pi1gi0,pi[1],gi[0]);
    or (c8,pi1pi0c0,pi1gi0,gi[1]);

    //c12
    and (pi2pi1pi0c0,pi[2],pi[1],pi[0],cin);
    and (pi2pi1gi0,pi[2],pi[1],gi[0]);
    and (pi2gi1,pi[2],gi[1]);
    or (c12,pi2pi1pi0c0,pi2pi1gi0,pi2gi1,gi[2]);

    //using cla4
    cla4 m1 (a[3:0],b[3:0], cin, s[3:0], carry[0]);
    cla4 m2 (a[7:4],b[7:4], c4, s[7:4], carry[1]);
    cla4 m3 (a[11:8],b[11:8], c8, s[11:8], carry[2]);
    cla4 m4 (a[15:12],b[15:12], c12, s[15:12], carry[3]);
    buf(cout,carry[3]);
   
endmodule

   