module mux_7_2x1 ( input [6:0] i1,
                   input [6:0] i2,
                   input c,  
                   output [6:0] op);
    
    wire [6:0] t1,t2;
    not(nc,c);

    and71 andi1 (i1,nc,t1);
    and71 andi2 (i2,c,t2);

    or ori[6:0] (op[6:0],t1[6:0],t2[6:0]);
    

endmodule