`timescale 1ns / 1ps

module instructionMemory(
    input  logic        clk,
    input  logic [2:0]  pc,  
    output logic [11:0] instruction 
    );
    logic [11:0] instructions [7:0]; 

    initial begin  
        instructions[0] = 12'b000_00_011_0101; // load data[5] to rf[3]                                         -> rf[3] = 5
        instructions[1] = 12'b000_01_110_0111; // load data[7] to rf[6]                                         -> rf[6] = 7
        instructions[2] = 12'b010_010_110_011; // substract rf[3] (= 5) - rf[6] (= 7) and load to rf[2]         -> rf[2] = -2 % 16 = 14 = E
        instructions[3] = 12'b001_11_010_0111; // store the value of rf[2] (= 14 = E) to data[7]                -> data[7] = 14 = E
        instructions[4] = 12'b101_100_011_101; // add 5 to value in rf[3] (= 5 + 5 = 10 = A) and load to rf[4]  -> rf[4] = 10 = A
        instructions[5] = 12'b000_10_101_0111; // load the value in data[7] (= 14 = E) to rf[5]                 -> rf[5] = E
        instructions[6] = 12'b101_001_101_111; // add the value of rf[5] (= 14 = E) to 7 and load to rf[1]      -> rf[1] = (14 + 7) % 8 = 5 
        instructions[7] = 12'b111_011_011_011; // jump 3                                                        -> PC = 2      
    end   

    // read the instruction for given pc
    always_ff @( posedge clk ) begin
        instruction <= instructions[pc];
    end
endmodule
