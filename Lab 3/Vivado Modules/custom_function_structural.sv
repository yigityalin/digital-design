`timescale 1ns / 1ps

module customfunctionstructural(
    input logic a, b, c, d,
    output logic y
    );
    logic in[7:0], s[2:0], d_inv;

    not not1(d_inv, d);

    assign in[0] = 0;
    assign in[1] = d_inv;
    assign in[2] = d;
    assign in[3] = 1;
    assign in[4] = 0;
    assign in[5] = d_inv;
    assign in[6] = 1;
    assign in[7] = d;

    assign s[0] = c;
    assign s[1] = b;
    assign s[2] = a;
    
    multiplexer8to1structural mux(in, s, y);
endmodule
