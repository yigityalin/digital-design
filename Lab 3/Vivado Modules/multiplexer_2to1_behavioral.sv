`timescale 1ns / 1ps

module multiplexer2to1behavioral(
    input logic in[1:0], s,
    output logic out
    );
    assign out = (in[0] & (~s)) | (in[1] & s);
endmodule
