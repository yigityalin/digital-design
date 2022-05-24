`timescale 1ns / 1ps

module decoder2to4behavioral_testbench();
    logic in[1:0], enable, out[3:0];

    decoder2to4behavioral decoder(in, enable, out);

    initial begin
        enable = 0; in[1] = 0; in[0] = 0; #10;
        in[0] = 1;                        #10;
        in[1] = 1; in[0] = 0;             #10;
        in[0] = 1;                        #10;
        enable = 1; in[1] = 0; in[0] = 0; #10;
        in[0] = 1;                        #10;
        in[1] = 1; in[0] = 0;             #10;
        in[0] = 1;                        #10;
    end
endmodule
