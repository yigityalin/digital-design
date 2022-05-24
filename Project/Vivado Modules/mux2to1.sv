`timescale 1ns / 1ps

module mux2to1 #(
    parameter WIDTH = 12
) (
    input  logic [WIDTH - 1:0] data1, data0,
    input  logic               sel,
    output logic [WIDTH - 1:0] y
);
    assign y = sel ? data1 : data0;
endmodule