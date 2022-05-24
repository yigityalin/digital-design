`timescale 1ns / 1ps

module buttonDebouncer(
    input  logic clk, button,
    output logic button_out
    );
    logic reg0, reg1, reg2;
    always_ff @( posedge clk ) begin
        reg0 <= button;
        reg1 <= reg0;
        reg2 <= reg1;
    end
    assign button_out = reg1 & (~reg2);
endmodule

