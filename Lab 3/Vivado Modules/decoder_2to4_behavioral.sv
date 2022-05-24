`timescale 1ns / 1ps

module decoder2to4behavioral(
    input logic in[1:0], enable,
    output logic out[3:0]
    );
    assign out[3] = (in[1] & in[0]) & enable;
    assign out[2] = (in[1] & (~in[0])) & enable;
    assign out[1] = ((~in[1]) & in[0]) & enable;
    assign out[0] = ((~in[1]) & (~in[0])) & enable;
endmodule
