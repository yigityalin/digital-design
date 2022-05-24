`timescale 1ns / 1ps

module implementation_on_fpga(
    input logic tba_a[1:0], tba_b[1:0], tba_c_in,
    output logic tba_s[1:0], tba_c_out,
    input logic lc_a, lc_b, lc_c, lc_d,
    output logic lc_y, lc_z
    );
    
    two_bit_adder tba(tba_a, tba_b, tba_c_in, tba_s, tba_c_out);
    lab_calculator lc(lc_a, lc_b, lc_c, lc_d, lc_y, lc_z);
endmodule
