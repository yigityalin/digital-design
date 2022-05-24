`timescale 1ns / 1ps

module full_adder_behavioral_testbench();
    logic a, b, c_in, s, c_out;

    full_adder_behavioral full_adder(a, b, c_in, s, c_out);
    initial begin
        a = 0; b = 0; c_in = 0; #10;
        c_in = 1;               #10;
        b = 1; c_in = 0;        #10;
        c_in = 1;               #10;
        a = 1; b = 0; c_in = 0; #10;
        c_in = 1;               #10;
        b = 1; c_in = 0;        #10;
        c_in = 1;               #10;
    end
endmodule
