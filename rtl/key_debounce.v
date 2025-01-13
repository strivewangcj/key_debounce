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
// Last modified Date:     2025/01/13 10:55:05
// Last Version:           V1.0
// Descriptions:
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name
// Created date:           2025/01/13 10:55:05
// mail      :             Please Write mail
// Version:                V1.0
// TEXT NAME:              key_debounce.v
// PATH:                   C:\Users\12614\Desktop\prj\key_debounce\rtl\key_debounce.v
// Descriptions:
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module key_debounce(
    input                               clk                        ,
    input                               rst_n                      ,
    input                               key,
    output reg key_flag
  );

  reg [17:0] cnt;
  reg cnt_flag;

      always @(posedge clk or negedge rst_n)           
          begin                                        
              if(!rst_n)                               
                  cnt <= 'd0;                                   
              else if(cnt == 'd250000)                                
                  cnt <= 'd0;                                     
              else if (key == 0)
                cnt <= cnt + 1;                                     
          end                                          

    always @(posedge clk or negedge rst_n)           
        begin                                        
            if(!rst_n)                               
                cnt_flag <= 'd0;                                   
            else if(key == 'b1)
                cnt_flag <= 'd0;                                
            else if(key == 'b0 && cnt == 'd249999)                                     
                cnt_flag <= 'd1;
        end    
        
    always @(posedge clk or negedge rst_n)           
        begin                                        
            if(!rst_n)                               
                key_flag <= 1'b0;                                       
            else if(cnt_flag == 0 && cnt == 'd249999)                                
                key_flag <= 1'b1;                                     
            else  
                key_flag <= 1'b0;                                   
        end                                          
endmodule
