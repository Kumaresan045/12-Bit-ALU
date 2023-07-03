module registerfile (input [2:0] readAddr1, output [11:0] readOut1 , 
                     input [2:0] readAddr2, output [11:0] readOut2 , 
                     input [2:0] writeAddr, input [11:0] writeIn, input we );

    wire [11:0] q0,q1,q2,q3,q4,q5,q6,q7;
    wire [7:0] decodeout,we_in;
    decoder_3X8 dec (writeAddr, decodeout);
    and andi[7:0] (we_in[7:0], decodeout[7:0], we);

    register r0 (writeIn, we_in[0], q0);
    register r1 (writeIn, we_in[1], q1);
    register r2 (writeIn, we_in[2], q2);
    register r3 (writeIn, we_in[3], q3);
    register r4 (writeIn, we_in[4], q4);
    register r5 (writeIn, we_in[5], q5);
    register r6 (writeIn, we_in[6], q6);
    register r7 (writeIn, we_in[7], q7);

    mux_12_8x1 mux1(q0,q1,q2,q3,q4,q5,q6,q7,readAddr1,readOut1);
    mux_12_8x1 mux2(q0,q1,q2,q3,q4,q5,q6,q7,readAddr2,readOut2);    

endmodule
