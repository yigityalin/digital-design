`timescale 1ns / 1ps

module multiplexer4to1structural(
    input logic in[3:0], s[1:0],
    output logic out
    );
    logic o[1:0];
    multiplexer2to1behavioral mux1(in[1:0], s[0], o[0]);
    multiplexer2to1behavioral mux2(in[3:2], s[0], o[1]);
    multiplexer2to1behavioral mux3(o, s[1], out);
endmodule
