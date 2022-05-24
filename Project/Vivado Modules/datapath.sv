`timescale 1ns / 1ps

module datapath(
    input  logic       clk, reset,
    input  logic       PC_load,
    input  logic       PC_sel, 
    input  logic       reg_wr_sel,
    input  logic [3:0] M_rd,
    input  logic       ALU_src_sel, ALU_op,
    input  logic [2:0] RF_add1, RF_add2, RF_wa,
    input  logic       RF_we, 
    input  logic [2:0] constant,
    output logic [2:0] PC, PC_next,
    output logic       EQ,
    output logic [3:0] ALU_src1, ALU_src2,
    output logic [3:0] ALU_out
    );
    logic [2:0] PC_jump, PC_plus_one;
    logic [3:0] RF_d1, RF_d2, RF_wd;

    asyncResettableDFlipFlop #(3) program_counter(clk, reset, PC_load, PC_next, PC);

    // calculate next pc
    assign PC_jump = PC + constant;
    assign PC_plus_one = PC + 1;

    // select next pc
    mux2to1                  #(3) PC_next_select(PC_jump, PC_plus_one, PC_sel, PC_next);

    registerFile                  registerFile(clk, RF_add1, RF_add2, 
                                               RF_wa, RF_we, RF_wd,
                                               RF_d1, RF_d2);
    
    // select which data to write to register file
    mux2to1                  #(4) RF_wr_select(ALU_out, M_rd, reg_wr_sel, RF_wd);

    // select ALU inputs
    mux2to1                  #(4) ALU_input_select(RF_d2, {1'b0, constant}, 
                                                   ALU_src_sel, ALU_src2);
    
    assign ALU_src1 = RF_d1;

    ALU                           ALU(ALU_src1, ALU_src2, ALU_op, ALU_out, EQ);
endmodule
