`timescale 1ns / 1ps

module dataMemory(
    input logic        clk,  
    input logic  [3:0] M_add,
    input logic  [3:0] M_wd,  
    input logic        M_we,  
    input logic        M_re,
    output logic [3:0] M_rd
    );
    logic [3:0] data [15:0];
      
    initial begin
        data[0]  <= 4'b0000;
        data[1]  <= 4'b0001;
        data[2]  <= 4'b0010;
        data[3]  <= 4'b0011;
        data[4]  <= 4'b0100;
        data[5]  <= 4'b0101;
        data[6]  <= 4'b0110;
        data[7]  <= 4'b0111;
        data[8]  <= 4'b1000;
        data[9]  <= 4'b1001;
        data[10] <= 4'b1010;
        data[11] <= 4'b1011;
        data[12] <= 4'b1100;
        data[13] <= 4'b1101;
        data[14] <= 4'b1110;
        data[15] <= 4'b1111;
    end
    
    // write data to the given address
    always_ff @(posedge clk) begin  
        if (M_we) begin
            data[M_add] <= M_wd;
        end
    end
    
    // read the data from given address if enabled
    assign M_rd = (M_re) ? data[M_add] : 4'b0;
endmodule
