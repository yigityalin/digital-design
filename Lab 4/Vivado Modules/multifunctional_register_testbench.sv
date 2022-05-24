`timescale 1ns / 1ps

module multifunctional_register_testbench();
    logic clk, d[3:0], shr_in, shl_in, s[1:0], reset, q[3:0];

    multifunctional_register register(clk, d[3:0], shr_in, shl_in, s[1:0], reset, q[3:0]);

    always #5 clk = ~clk;

    initial begin
        reset = 0; clk = 0; shr_in = 0; shl_in = 0; q[3] = 0; q[2] = 0; q[1] = 0; q[0] = 0;
        d[3] = 0; d[2] = 0; d[1] = 0; d[0] = 0; s[1] = 0; s[0] = 0; #10;

        s[0] = 1;
        for (int i = 0; i < 16; i++) begin
            {d[3], d[2], d[1], d[0]} = i; #10;
        end

        s[1] = 1; s[0] = 0; shr_in = 0; #10; #10;
        shr_in = 1; #10; #10;
        shr_in = 0; #10; #10;
        shr_in = 1; #10; #10; #10; #10;

        s[1] = 1; s[0] = 1; shl_in = 0; #10; #10;
        shl_in = 1; #10; #10; #10; #10;

        #2;
        reset = 1;
    end
endmodule