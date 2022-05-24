`timescale 1ns / 1ps

module trafficLightSystem(
    input logic clk, reset, SA, SB,
    output logic LA[2:0], LB[2:0]
    );
    logic [2:0] c = 2'b000, n[2:0];

    assign n[2] = (c[2] & (~(c[1] & c[0]))) | ((~c[2]) & c[1] & c[0]);
    assign n[1] = (c[1] ^ c[0]);
    assign n[0] = (~(c[2] | c[1] | c[0] | SA)) | (c[1] & ~(c[0])) | (c[2] & (~c[1]) & (~c[0]) & (~SB));

    syncResetableDFlipFlop dffstate2(clk, reset, n[2], c[2]);
    syncResetableDFlipFlop dffstate1(clk, reset, n[1], c[1]);
    syncResetableDFlipFlop dffstate0(clk, reset, n[0], c[0]);

    assign LA[2] = ((~c[2]) & c[1]) | (c[2] & (~(c[1] & c[0])));
    assign LA[1] = ((~c[2]) & c[1]) | (c[2] & (~(c[1] & c[0]))) | (~(c[2] | c[1] | c[0]));
    assign LA[0] = 1;
    assign LB[2] = (~(c[2] | (c[1] & c[0]))) | (c[2] & c[1]);
    assign LB[1] = (~(c[2] | (c[1] & c[0]))) | (c[2] & c[1]) | (c[2] & (~c[1]) & (~c[0]));
    assign LB[0] = 1;
endmodule
