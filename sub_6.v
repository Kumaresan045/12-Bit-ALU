module sub_6 (input [5:0] xe,input [5:0] ye, output [5:0] dif);

    wire [5:0] nye;
    not noti[5:0] (nye[5:0],ye[5:0]);
    add6 add (xe[5:0],nye[5:0],1'b1,dif[5:0]);
    
endmodule