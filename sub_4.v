module sub_4 (input [3:0] xe,input [3:0] ye, output [3:0] dif);

    wire [3:0] nye;
    not noti[3:0] (nye[3:0],ye[3:0]);
    cla4 cla4i (xe[3:0],nye[3:0],1'b1,dif[3:0],ov);
    
endmodule