module mux_4_2x1 ( input [3:0] i1,
                   input [3:0] i2,
                   input c,  
                   output [3:0] op);
    
    wire [3:0] t1,t2;
    not(nc,c);

    and41 andi1 (i1,nc,t1);
    and41 andi2 (i2,c,t2);

    or ori[3:0] (op[3:0],t1[3:0],t2[3:0]);
    

endmodule