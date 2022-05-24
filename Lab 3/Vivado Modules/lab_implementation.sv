`timescale 1ns / 1ps

module lab_implementation(
    input logic a, b, c, d,
    output logic y,
    input logic in[1:0], enable,
    output logic out[3:0]
    );
    
    customfunctionstructural func(a, b, c, d, y);
    decoder2to4behavioral decoder(in, enable, out);
endmodule
