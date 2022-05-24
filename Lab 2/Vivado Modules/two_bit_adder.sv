`timescale 1ns / 1ps

module two_bit_adder(
    input logic a[1:0], b[1:0], c_in,
    output logic s[1:0], c_out
    );
    logic c;

    full_adder_structural full_adder_1(a[0], b[0], c_in, s[0], c);
    full_adder_structural full_adder_2(a[1], b[1], c, s[1], c_out);
endmodule
