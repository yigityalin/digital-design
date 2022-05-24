`timescale 1ns / 1ps

module multifunctional_register_for_fpga(
    input logic clk, d[3:0], shr_in, shl_in, s[1:0], reset,
    output logic q[3:0], clk_out
    );
    logic out[3:0];
    reg [27:0] counter;

    always_ff @( posedge clk ) begin
        counter <= counter + 1;
        if (counter == 100_000_000) begin
            counter <= 0;
            clk_out = ~clk_out;
        end
    end

    mux_4_to_1 mux3(q[3], d[3], shr_in,   q[2], s, out[3]);
    mux_4_to_1 mux2(q[2], d[2],   q[3],   q[1], s, out[2]);
    mux_4_to_1 mux1(q[1], d[1],   q[2],   q[0], s, out[1]);
    mux_4_to_1 mux0(q[0], d[0],   q[1], shl_in, s, out[0]);

    syncResetableDFlipFlop dff3(clk_out, reset, out[3], q[3]);
    syncResetableDFlipFlop dff2(clk_out, reset, out[2], q[2]);
    syncResetableDFlipFlop dff1(clk_out, reset, out[1], q[1]);
    syncResetableDFlipFlop dff0(clk_out, reset, out[0], q[0]);
endmodule
