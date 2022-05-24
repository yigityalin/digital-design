`timescale 1ns / 1ps

module multiplexer4to1structural_testbench();
    logic in[3:0], s[1:0], out;

    multiplexer4to1structural mux(in, s, out);

    initial begin
        s[1] = 0; s[0] = 0; in[3] = 0; in[2] = 0; in[1] = 0; in[0] = 0; #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[2] = 1; in[1] = 0; in[0] = 0;                                #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[3] = 1; in[2] = 0; in[1] = 0; in[0] = 0;                     #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[2] = 1; in[1] = 0; in[0] = 0;                                #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        s[0] = 1; in[3] = 0; in[2] = 0; in[1] = 0; in[0] = 0;           #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[2] = 1; in[1] = 0; in[0] = 0;                                #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[3] = 1; in[2] = 0; in[1] = 0; in[0] = 0;                     #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[2] = 1; in[1] = 0; in[0] = 0;                                #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        s[1] = 1; s[0] = 0; in[3] = 0; in[2] = 0; in[1] = 0; in[0] = 0; #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[2] = 1; in[1] = 0; in[0] = 0;                                #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[3] = 1; in[2] = 0; in[1] = 0; in[0] = 0;                     #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[2] = 1; in[1] = 0; in[0] = 0;                                #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        s[0] = 1; in[3] = 0; in[2] = 0; in[1] = 0; in[0] = 0;           #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[2] = 1; in[1] = 0; in[0] = 0;                                #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[3] = 1; in[2] = 0; in[1] = 0; in[0] = 0;                     #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
        in[2] = 1; in[1] = 0; in[0] = 0;                                #10;
        in[0] = 1;                                                      #10;
        in[1] = 1; in[0] = 0;                                           #10;
        in[0] = 1;                                                      #10;
    end
endmodule