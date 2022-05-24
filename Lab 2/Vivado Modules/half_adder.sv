`timescale 1ns / 1ps

module half_adder(
    input logic a, b,
    output logic d, b_out 
    );
    assign d = a ^ b;
    assign b_out = a & b;
endmodule
