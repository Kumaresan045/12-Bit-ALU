module ppi (input [7:0] p, input pi, output [7:0] ppi);

    and andi[7:0] (ppi[7:0], pi, p[7:0]);

endmodule