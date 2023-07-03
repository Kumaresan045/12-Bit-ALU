module mux_12_2x1 ( input [11:0] i1,
                   input [11:0] i2,
                   input c,  
                   output [11:0] op);
    
    wire [11:0] t1,t2;
    not(nc,c);

    and12_1 andi1 (i1,nc,t1);
    and12_1 andi2 (i2,c,t2);

    or ori[11:0] (op[11:0],t1[11:0],t2[11:0]);
    

endmodule