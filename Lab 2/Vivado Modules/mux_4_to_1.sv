`timescale 1ns / 1ps

module mux_4_to_1(
    input logic a, b, c, d,
    input logic cond_1, cond_2,
    output y
    );
    assign y = cond_1 ? (cond_2 ? d : c)
                      : (cond_2 ? b : a);
endmodule
