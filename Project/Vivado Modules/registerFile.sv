`timescale 1ns / 1ps

module registerFile(
    input logic        clk,
    input logic  [2:0] RF_add1, RF_add2, RF_wa,
    input logic        RF_we,
    input logic  [3:0] RF_wd,
    output logic [3:0] RF_d1, RF_d2  
    );
    logic [3:0] data [7:0];

    initial begin
        data[0] = 4'b0;
        data[1] = 4'b0;
        data[2] = 4'b0;
        data[3] = 4'b0;
        data[4] = 4'b0;
        data[5] = 4'b0;
        data[6] = 4'b0;
        data[7] = 4'b0;
    end

    // write data to given address if enabled
    always_ff @(posedge clk) begin    
        if(RF_we) begin
            data[RF_wa] = RF_wd; 
        end
    end   

    // read data from given addresses
    assign RF_d1 = data[RF_add1];  
    assign RF_d2 = data[RF_add2]; 
endmodule
