`timescale 1ns / 1ps

module sevenSegmentDisplay(
    input  logic       clk,
    input  logic       reset,
    input  logic [3:0] ALU_src1, ALU_src2,
    input  logic [3:0] ALU_out,
    output logic [6:0] seg,
    output logic [3:0] an
    );
    logic [19:0] refresh;
    logic [1:0]  activate;
    logic [3:0]  binary;

    always_ff @(posedge clk or posedge reset)
    begin 
        if (reset == 1)
            refresh <= 0;
        else
            refresh <= refresh + 1;
    end 

    assign activate = refresh[19:18];

    always_comb begin
        case (activate)
            2'b00: begin
                an = 4'b0111;
                binary = ALU_src1;
            end
            2'b01: begin
                an = 4'b1011; 
                binary = ALU_src2;
            end
            2'b10: begin
                an = 4'b1111;
                binary = 4'b0;
            end
            2'b11: begin
                an = 4'b1110;
                binary = ALU_out;
            end
        endcase
    end
    
    always_comb begin
        case (binary)
            4'b0000: seg = 7'b1000000; 
            4'b0001: seg = 7'b1111001; 
            4'b0010: seg = 7'b0100100; 
            4'b0011: seg = 7'b0110000; 
            4'b0100: seg = 7'b0011001; 
            4'b0101: seg = 7'b0010010; 
            4'b0110: seg = 7'b0000010; 
            4'b0111: seg = 7'b1111000; 
            4'b1000: seg = 7'b0000000;    
            4'b1001: seg = 7'b0010000; 
            4'b1010: seg = 7'b0001000;
            4'b1011: seg = 7'b0000011;
            4'b1100: seg = 7'b1000110;
            4'b1101: seg = 7'b0100001;
            4'b1110: seg = 7'b0000110;
            4'b1111: seg = 7'b0001110;
        endcase
    end
endmodule