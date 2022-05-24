`timescale 1ns / 1ps

module asyncResettableDFlipFlop #(
    parameter WIDTH = 12
) (
    input  logic clk, reset, en,
    input  logic [WIDTH - 1:0] d,
    output logic [WIDTH - 1:0] q
);
    always_ff @(posedge clk, posedge reset) begin
        if      (reset) q <= 0;
        else if (en)    q <= d;
    end
endmodule