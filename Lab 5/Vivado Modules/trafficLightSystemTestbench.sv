`timescale 1ns / 1ps

module trafficLightSystemTestbench();
    logic clk, reset, SA, SB, LA[2:0], LB[2:0];

    trafficLightSystem tls(clk, reset, SA, SB, LA, LB);

    always #1 clk = ~clk;

    initial begin
        reset = 0; clk = 0; SA = 0; SB = 0; 
        LA[2] = 0; LA[1] = 1; LA[0] = 1; LB[2] = 1; LB[1] = 1; LB[0] = 1;

        for (int i = 0; i < 8; i++) #2;

        SB = 1;
        for (int i = 0; i < 8; i++) #2;

        reset = 1; SA = 1; SB = 0; #2;
        reset = 0;
        for (int i = 0; i < 8; i++) #2;

        reset = 1; SB = 1; #2;
        reset = 0;
        for (int i = 0; i < 2; i++) #2;
        SA = 0; #2;
        SA = 1;
        for (int i = 0; i < 6; i++) #2;
        SB = 0; #2;
        SB = 1;
        for (int i = 0; i < 6; i++) #2;

        reset = 1; SA = 0; SB = 0; #2;

        reset = 0; #2; #2;
        SA = 1;
        for (int i = 0; i < 7; i++) #2;

        SA = 0; SB = 1;
        for (int i = 0; i < 4; i++) #2;
        SB = 0; #2;
        SB = 1;
        for (int i = 0; i < 3; i++) #2;
    end
endmodule
