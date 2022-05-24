`timescale 1ns / 1ps

module mux_4_to_1(
    input logic a, b, c, d, s[1:0],
    output logic y
    );
    assign y = s[1] ? ( s[0] ? d : c)
                    : ( s[0] ? b : a);
endmodule
