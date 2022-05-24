`timescale 1ns / 1ps

module full_adder_behavioral(
    input logic a, b, c_in,
    output logic s, c_out
    );
    logic xor_a_b, and_a_b;
    
    assign xor_a_b = a ^ b;
    assign and_a_b = a & b;
    
    assign s = xor_a_b ^c_in;
    assign c_out = and_a_b | (xor_a_b & c_in);
endmodule
