`timescale 1ns / 1ps

module full_adder_structural(
    input logic a, b, c_in,
    output logic s, c_out
    );
    logic p, g, q;
    
    xor xor_1(p, a, b);
    and and_1(g, a, b);
    and and_2(q, p, c_in);
    xor xor_2(s, p, c_in);
    or or_1(c_out, g, q);

endmodule
