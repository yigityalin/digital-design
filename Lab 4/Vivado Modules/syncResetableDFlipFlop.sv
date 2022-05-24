`timescale 1ns / 1ps

module syncResetableDFlipFlop(
    input logic clk, reset, d,
    output logic q
    );
    always_ff @( posedge clk ) begin
        if   (reset) q <= 0;
        else         q <= d;
    end
endmodule
