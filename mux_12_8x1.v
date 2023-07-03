module mux_12_8x1 ( input [11:0] i1,
                   input [11:0] i2,
                   input [11:0] i3,
                   input [11:0] i4,
                   input [11:0] i5,
                   input [11:0] i6,
                   input [11:0] i7,
                   input [11:0] i8,
                   input [2:0] c,  
                   output [11:0] op);
    
    wire [2:0] nc;
    wire [11:0] t1,t2,t3,t4,t5,t6,t7,t8;
    not ni[2:0] (nc,c);

    and(m1,nc[2],nc[1],nc[0]);
    and(m2,nc[2],nc[1],c[0]);
    and(m3,nc[2],c[1],nc[0]);
    and(m4,nc[2],c[1],c[0]);
    and(m5,c[2],nc[1],nc[0]);
    and(m6,c[2],nc[1],c[0]);
    and(m7,c[2],c[1],nc[0]);
    and(m8,c[2],c[1],c[0]);

    and12_1 andi1 (i1,m1,t1);
    and12_1 andi2 (i2,m2,t2);
    and12_1 andi3 (i3,m3,t3);
    and12_1 andi4 (i4,m4,t4);
    and12_1 andi5 (i5,m5,t5);
    and12_1 andi6 (i6,m6,t6);
    and12_1 andi7 (i7,m7,t7);
    and12_1 andi8 (i8,m8,t8);

    or ori[11:0] (op[11:0],t1[11:0],t2[11:0],t3[11:0],t4[11:0],t5[11:0],t6[11:0],t7[11:0],t8[11:0]);

    

endmodule