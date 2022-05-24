`timescale 1ns / 1ps

module trafficLightSystemFPGA(
    input logic clk, reset, SA, SB,
    output logic LA[2:0], LB[2:0], clk_out
    );
    logic c[2:0], n[2:0];
    reg [28:0] counter;

    always_ff @( posedge clk ) begin
        counter <= counter + 1;
        if (counter == 150_000_000) begin
            counter <= 0;
            clk_out = ~clk_out;
        end
    end

    assign n[2] = (c[2] & (~(c[1] & c[0]))) | ((~c[2]) & c[1] & c[0]);
    assign n[1] = (c[1] ^ c[0]);
    assign n[0] = (~(c[2] | c[1] | c[0] | SA)) | (c[1] & ~(c[0])) | (c[2] & (~c[1]) & (~c[0]) & (~SB));

    syncResetableDFlipFlop dffstate2(clk_out, reset, n[2], c[2]);
    syncResetableDFlipFlop dffstate1(clk_out, reset, n[1], c[1]);
    syncResetableDFlipFlop dffstate0(clk_out, reset, n[0], c[0]);

    assign LA[2] = ((~c[2]) & c[1]) | (c[2] & (~(c[1] & c[0])));
    assign LA[1] = ((~c[2]) & c[1]) | (c[2] & (~(c[1] & c[0]))) | (~(c[2] | c[1] | c[0]));
    assign LA[0] = 1;
    assign LB[2] = (~(c[2] | (c[1] & c[0]))) | (c[2] & c[1]);
    assign LB[1] = (~(c[2] | (c[1] & c[0]))) | (c[2] & c[1]) | (c[2] & (~c[1]) & (~c[0]));
    assign LB[0] = 1;
endmodule
