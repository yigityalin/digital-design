`timescale 1ns / 1ps

module lab_calculator_testbench();
    logic a, b, c, d, y, z;

    lab_calculator lab_calc(a, b, c, d, y, z);
    initial begin
        a = 0; b = 0; c = 0; d = 0; #10;
        d = 1;                      #10;
        c = 1; d = 0;               #10;
        d = 1;                      #10;
        b = 1; c = 0; d = 0;        #10;
        d = 1;                      #10;
        c = 1; d = 0;               #10;
        d = 1;                      #10;
        a = 1; b = 0; c = 0; d = 0; #10;
        d = 1;                      #10;
        c = 1; d = 0;               #10;
        d = 1;                      #10;
        b = 1; c = 0; d = 0;        #10;
        d = 1;                      #10;
        c = 1; d = 0;               #10;
        d = 1;                      #10;
    end
endmodule
