`timescale 1ns / 1ps

module controller(
    input  logic [11:0] instruction, 
    input  logic        left_button, right_button, 
    input  logic        EQ,
    output logic        is_external,
    output logic        PC_load, 
    output logic        PC_sel,
    output logic        reg_wr_sel,
    output logic [3:0]  M_add,
    output logic        M_we, M_re,
    output logic        ALU_src_sel, ALU_op,
    output logic [2:0]  RF_add1, RF_add2, RF_wa,
    output logic        RF_we,
    output logic [2:0]  constant
    );
    logic [2:0] operation;

    initial begin
        is_external = 1;
    end

    assign operation = instruction[11:9];    
    
    always_comb begin
        if (left_button == 1) begin
            is_external <= 0;
        end

        if(right_button == 1) begin
            is_external <= 1;
        end

        PC_load <= (~is_external) & left_button;

        case (operation)   
            3'b000: begin
                PC_sel      <= 1'b0;
                reg_wr_sel  <= 1'b0;
                M_add       <= instruction[3:0];
                M_we        <= 1'b0;
                M_re        <= 1'b1;
                ALU_src_sel <= 1'b0;
                ALU_op      <= 1'b0;
                RF_add1     <= 3'b0;
                RF_add2     <= 3'b0;
                RF_wa       <= instruction[6:4];
                RF_we       <= 1'b1;
                constant    <= 3'b0;
            end  
            3'b001: begin
                PC_sel      <= 1'b0;
                reg_wr_sel  <= 1'b0;
                M_add       <= instruction[3:0];
                M_we        <= 1'b1;
                M_re        <= 1'b0;
                ALU_src_sel <= 1'b0;
                ALU_op      <= 1'b0; 
                RF_add1     <= 3'b0;
                RF_add2     <= instruction[6:4];
                RF_wa       <= 3'b0;
                RF_we       <= 1'b0;
                constant    <= 3'b0;
            end  
            3'b010: begin
                PC_sel      <= 1'b0;
                reg_wr_sel  <= 1'b1;
                M_add       <= 4'b0;
                M_we        <= 1'b0;
                M_re        <= 1'b0;
                ALU_src_sel <= 1'b1;
                ALU_op      <= 1'b0; 
                RF_add1     <= instruction[2:0];
                RF_add2     <= instruction[5:3];
                RF_wa       <= instruction[8:6];
                RF_we       <= 1'b1;
                constant    <= 3'b0; 
            end  
            3'b101: begin
                PC_sel      <= 1'b0; 
                reg_wr_sel  <= 1'b1;
                M_add       <= 4'b0;
                M_we        <= 1'b0;
                M_re        <= 1'b0;
                ALU_src_sel <= 1'b0;  
                ALU_op      <= 1'b1; 
                RF_add1     <= instruction[5:3];
                RF_add2     <= 3'b0;
                RF_wa       <= instruction[8:6];
                RF_we       <= 1'b1;
                constant    <= instruction[2:0];     
            end  
            3'b111: begin
                PC_sel      <= EQ;
                reg_wr_sel  <= 1'b0;
                M_add       <= 4'b0;
                M_we        <= 1'b0;
                M_re        <= 1'b0;
                ALU_src_sel <= 1'b1;
                ALU_op      <= 1'b0; 
                RF_add1     <= instruction[2:0];
                RF_add2     <= instruction[5:3];
                RF_wa       <= 3'b0;
                RF_we       <= 1'b0;
                constant    <= instruction[8:6]; 
            end
            default: begin
                PC_sel      <= 1'b0;
                reg_wr_sel  <= 1'b0;
                M_add       <= 4'b0;
                M_we        <= 1'b0;
                M_re        <= 1'b0; 
                ALU_src_sel <= 1'b0;
                ALU_op      <= 1'b0; 
                RF_add1     <= 3'b0;
                RF_add2     <= 3'b0;
                RF_wa       <= 3'b0;
                RF_we       <= 1'b0;
                constant    <= 3'b0;          
            end  
        endcase         
    end
endmodule
