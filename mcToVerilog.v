    // ADD R2,R0,R1;
    opcode = 3'b001; readAddr1 = 3'b000; readAddr2 = 3'b001; writeAddr = 3'b010; #8;
    we=1'b1; #8; we=1'b0;
    readAddr1 = 3'b010; #8;

    // SUB R3,R0,R1;
    opcode = 3'b010; readAddr1 = 3'b000; readAddr2 = 3'b001; writeAddr = 3'b011; #8;
    we=1'b1; #8; we=1'b0;
    readAddr1 = 3'b011; #8;

    // MUL R4,R0,R1;
    opcode = 3'b011; readAddr1 = 3'b000; readAddr2 = 3'b001; writeAddr = 3'b100; #8;
    we=1'b1; #8; we=1'b0;
    readAddr1 = 3'b100; #8;

    // IMUL R4,R0,R1;
    opcode = 3'b100; readAddr1 = 3'b000; readAddr2 = 3'b001; writeAddr = 3'b101; #8;
    we=1'b1; #8; we=1'b0;
    readAddr1 = 3'b101; #8;

    // FADD R7,R5,R6;
    opcode = 3'b101; readAddr1 = 3'b101; readAddr2 = 3'b110; writeAddr = 3'b111; #8;
    we=1'b1; #8; we=1'b0;
    readAddr1 = 3'b111; #8;

    // FMUL R7,R5,R6;
    opcode = 3'b110; readAddr1 = 3'b101; readAddr2 = 3'b110; writeAddr = 3'b111; #8;
    we=1'b1; #8; we=1'b0;
    readAddr1 = 3'b111; #8;

    // CMP R2,R0,R1;
    opcode = 3'b111; readAddr1 = 3'b000; readAddr2 = 3'b001; writeAddr = 3'b010; #8;
    we=1'b1; #8; we=1'b0;
    readAddr1 = 3'b010; #8;