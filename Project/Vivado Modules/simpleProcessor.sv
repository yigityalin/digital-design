`timescale 1ns / 1ps

module simpleProcessor(
    input  logic        clk, reset,
    input  logic        btnL, btnR,
    input  logic [11:0] SWs,
    output logic [6:0]  seg,
    output logic [3:0]  an,
    output logic [2:0]  PC, PC_next
    );
    logic        left_button, right_button;
    logic        is_external;
    logic [11:0] instruction, instruction_next, instruction_memory;
    logic [11:0] SWs_reg;
    logic [3:0]  M_add;
    logic        M_we, M_re;
    logic [3:0]  M_rd, M_wd;
    logic [3:0]  ALU_src1, ALU_src2, ALU_out;

    // stabilize button inputs
    buttonDebouncer                 left_button_debouncer(clk, btnL, left_button);
    buttonDebouncer                 right_button_debouncer(clk, btnR, right_button);

    microprocessor                  microprocessor(clk, reset, left_button, right_button,
                                                   instruction, M_rd, PC, PC_next, is_external,
                                                   M_add, M_we, M_re, M_wd,
                                                   ALU_src1, ALU_src2, ALU_out);
    
    asyncResettableDFlipFlop #(12)  switch_register(clk, reset, right_button, SWs, SWs_reg);

    instructionMemory               instructionMemory(clk, PC, instruction_memory);

    mux2to1                  #(12)  is_external_select(SWs_reg, instruction_memory, 
                                                       is_external, instruction_next);

    asyncResettableDFlipFlop #(12)  instruction_register(clk, reset, 1'b1, 
                                                         instruction_next, instruction);
    
    dataMemory                      dataMemory(clk, M_add, M_wd, M_we, M_re, M_rd);

    sevenSegmentDisplay             seven_segment_display(clk, reset, 
                                                          ALU_src1, ALU_src2, ALU_out,
                                                          seg, an);
endmodule
