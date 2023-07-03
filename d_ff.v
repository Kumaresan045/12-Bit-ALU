// module D_FF with synchronous reset
module d_ff(input d, input clk, output q);
reg q;
always @(posedge clk)
q <= d;
endmodule