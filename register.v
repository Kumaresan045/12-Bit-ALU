module register (input [11:0] din,input we, output [11:0] qout);

    d_ff gts[11:0] (din[11:0], we, qout[11:0]);

endmodule