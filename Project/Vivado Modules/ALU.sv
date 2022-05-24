`timescale 1ns / 1ps

module ALU (     
    input  logic [3:0] ALU_src1, ALU_src2,
    input  logic       ALU_op,
    output logic [3:0] ALU_out,     
    output logic       EQ  
    );  
    always_comb begin   
        case (ALU_op)  
            1'b0:    ALU_out = ALU_src1 - ALU_src2; // substract
            1'b1:    ALU_out = ALU_src1 + ALU_src2; // add
            default: ALU_out = 1'b0;                // default
        endcase 
        EQ = ALU_src1 == ALU_src2;                  // equality check for jump
    end
endmodule  