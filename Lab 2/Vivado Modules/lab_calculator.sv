`timescale 1ns / 1ps

module lab_calculator(
    input logic a, b, c, d,
    output logic y, z
    );
    
    logic sum, c_out, diff, b_out;
    
    half_adder adder(a, b, sum, c_out);
    half_substractor substractor(a, b, diff, b_out);
    
    mux_4_to_1 mux1(a & b, ~(a | b), sum, diff, c, d, y);
    mux_4_to_1 mux2('x, 'x, c_out, b_out, c, d, z);
endmodule
