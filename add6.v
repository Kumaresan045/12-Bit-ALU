module add6(input [5:0]a,input [5:0]b, input cin, output [5:0]s);

    wire [6:0] carry;
    buf (carry[0],cin);
    fa fai[5:0] (a[5:0],b[5:0],carry[5:0],s[5:0],carry[6:1]);

endmodule