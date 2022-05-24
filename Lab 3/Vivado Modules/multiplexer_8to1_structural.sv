`timescale 1ns / 1ps

module multiplexer8to1structural(
    input logic in[7:0], s[2:0],
    output logic out
    );
    logic o[1:0], s2_inv, p, g;

    multiplexer4to1structural mux1(in[3:0], s[1:0], o[0]);
    multiplexer4to1structural mux2(in[7:4], s[1:0], o[1]);

    not not1(s2_inv, s[2]);
    and and1(p, o[0], s2_inv);
    and and2(g, o[1], s[2]);
    or or1(out, p, g);
endmodule
