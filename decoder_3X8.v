module decoder_3X8(input [2:0] inp, output [7:0] res); //3x8 decoder

    wire [2:0]inpc;
    not noti[2:0] (inpc[2:0], inp[2:0]); //Array to store the inverted input

    //Minterm0
    and and00 (t1, inpc[0], inpc[1]);
    and and01 (res[0],inpc[2],t1);

    //Minterm1
    and and10 (t2, inp[0], inpc[1]);
    and and11 (res[1],inpc[2],t2);

    //Minterm2
    and and20 (t3, inpc[0], inp[1]);
    and and21 (res[2],inpc[2],t3);

    //Minterm3
    and and30 (t4, inp[0], inp[1]);
    and and31 (res[3],inpc[2],t4);

    //Minterm4
    and and40 (t5, inpc[0], inpc[1]);
    and and41 (res[4],inp[2],t5);

    //Minterm5
    and and50 (t6, inp[0], inpc[1]);
    and and51 (res[5],inp[2],t6);

    //Minterm6
    and and60 (t7, inpc[0], inp[1]);
    and and61 (res[6],inp[2],t7);

    //Minterm7
    and and70 (t8, inp[0], inp[1]);
    and and71 (res[7],inp[2],t8);

endmodule