`timescale 1ns / 1ps

module microprocessor(
    input  logic        clk, reset,
    input  logic        left_button, right_button,
    input  logic [11:0] instruction,
    input  logic [3:0]  M_rd,
    output logic [2:0]  PC, PC_next,
    output logic        is_external,
    output logic [3:0]  M_add,
    output logic        M_we, M_re,
    output logic [3:0]  M_wd, 
    output logic [3:0]  ALU_src1, ALU_src2, ALU_out
    );
    logic       EQ, PC_sel, PC_load;
    logic       reg_wr_sel;
    logic       ALU_src_sel, ALU_op;
    logic [2:0] RF_add1, RF_add2, RF_wa;
    logic       RF_we;
    logic [2:0] constant;

    controller controller(instruction, left_button, right_button,
                          EQ, is_external, PC_load, PC_sel, 
                          reg_wr_sel, M_add, M_we, M_re,
                          ALU_src_sel, ALU_op, 
                          RF_add1, RF_add2, RF_wa, RF_we,
                          constant);
    
    datapath   datapath(clk, reset, PC_load, PC_sel, 
                        reg_wr_sel, M_rd, 
                        ALU_src_sel, ALU_op,
                        RF_add1, RF_add2, RF_wa, RF_we, 
                        constant, PC, PC_next, EQ,
                        ALU_src1, ALU_src2, ALU_out);
endmodule
