`timescale 1ns / 1ps
//****************************************VSCODE PLUG-IN**********************************//
//----------------------------------------------------------------------------------------
// IDE :                   VSCODE
// VSCODE plug-in version: Verilog-Hdl-Format-2.8.20240817
// VSCODE plug-in author :
//----------------------------------------------------------------------------------------
//****************************************Copyright (c)***********************************//
// Copyright(C)            Please Write Company name
// All rights reserved
// File name:
// Last modified Date:     2025/01/13 13:50:28
// Last Version:           V1.0
// Descriptions:
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name
// Created date:           2025/01/13 13:50:28
// mail      :             Please Write mail
// Version:                V1.0
// TEXT NAME:              keyshiftled.v
// PATH:                   C:\Users\12614\Desktop\prj\key_debounce\rtl\keyshiftled.v
// Descriptions:
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module keyshiftled(
    input                               clk                        ,
    input                               rst_n      ,
    input       key,
    output [3:0] led
  );

  reg [3:0]    shift_led;
  reg key_reg;

  wire key_flag;

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      key_reg <= 1'b1;
    else
      key_reg <= key_flag;
  end

  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      shift_led <= 4'b0001;
    else if(key_flag == 1'b0 && key_reg == 1'b1)
      shift_led <= {shift_led[2:0],shift_led[3]};
  end

  assign led = shift_led;


  key_debounce  key_debounce_inst (
    .clk(clk),
    .rst_n(rst_n),
    .key(key),
    .key_flag(key_flag)
  );


endmodule
