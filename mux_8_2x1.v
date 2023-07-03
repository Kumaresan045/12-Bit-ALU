module mux_8_2x1 ( input [7:0] i1,
                   input [7:0] i2,
                   input c,  
                   output [7:0] op);
    
    wire [7:0] t1,t2;
    not(nc,c);

    and81 andi1 (i1,nc,t1);
    and81 andi2 (i2,c,t2);

    or ori[7:0] (op[7:0],t1[7:0],t2[7:0]);
    

endmodule