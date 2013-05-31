//----------------------------------------------------------------------------
// DCR_IF Controller - DCR Bus Interface
//-----------------------------------------------------------------------------
//
//     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
//     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR
//     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION
//     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION
//     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS
//     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
//     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
//     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
//     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
//     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
//     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
//     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
//     FOR A PARTICULAR PURPOSE.
//     
//     (c) Copyright 2004 Xilinx, Inc.
//     All rights reserved.
// 
//----------------------------------------------------------------------------
// Filename:     dcr_if.v
// 
// Description:    
//
//
// Design Notes:
//   
//-----------------------------------------------------------------------------
// Structure:   
// 
//              -- dcr_if.v
//
//-----------------------------------------------------------------------------
// Author:    CJN
// History:
//            CJN
//-----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

///////////////////////////////////////////////////////////////////////////////
// Module Declaration
///////////////////////////////////////////////////////////////////////////////

module dcr_if(
  // DCR BUS
  clk,           // I
  rst,           // I
  DCR_ABus,      // I [0:9]
  DCR_DBusIn,    // I [0:31]
  DCR_Read,      // I
  DCR_Write,     // I
  DCR_Ack,       // O
  DCR_DBusOut,   // O [0:31]
  // Registers
  tft_base_addr, // O [0:10]    
  tft_dps_reg,   // O
  tft_on_reg,    // O
  dcr_iic_sda_i, // I
  dcr_iic_sda_o, // O
  dcr_iic_sda_t, // O
  dcr_iic_scl_i, // I
  dcr_iic_scl_o, // O
  dcr_iic_scl_t  // O
  );

///////////////////////////////////////////////////////////////////////////////
// Port Declarations
/////////////////////////////////////////////////////////////////////////////// 

  input         clk;
  input         rst;
  input  [0:9]  DCR_ABus;
  input  [0:31] DCR_DBusIn;
  input         DCR_Read;
  input         DCR_Write;
  output        DCR_Ack;
  output [0:31] DCR_DBusOut;
  output [0:10] tft_base_addr;
  output        tft_dps_reg;
  output        tft_on_reg;
  input         dcr_iic_sda_i;
  output        dcr_iic_sda_o;
  output        dcr_iic_sda_t;
  input         dcr_iic_scl_i;
  output        dcr_iic_scl_o;
  output        dcr_iic_scl_t;

  wire   [0:31] DCR_DBusOut;
  reg           DCR_Ack;

///////////////////////////////////////////////////////////////////////////////
// Parameter Declarations
///////////////////////////////////////////////////////////////////////////////

  parameter C_DCR_BASEADDR = 10'b0010000000;
  parameter C_DEFAULT_TFT_BASE_ADDR = 11'b11110000000;
  parameter C_DPS_INIT = 1;
  parameter C_ON_INIT = 1;

///////////////////////////////////////////////////////////////////////////////
// Signal Declaration
///////////////////////////////////////////////////////////////////////////////

  wire        dcr_addr_hit;
  wire [0:9]  dcr_base_addr;
  reg         dcr_read_access;
  reg  [0:31] read_data;
  reg  [0:10] tft_base_addr;
  reg         tft_dps_reg;
  reg         tft_on_reg;
  reg         dcr_iic_scl_t;
  reg         dcr_iic_sda_t;

///////////////////////////////////////////////////////////////////////////////
// DCR Register Interface 
///////////////////////////////////////////////////////////////////////////////

  assign dcr_base_addr = C_DCR_BASEADDR;
  assign dcr_addr_hit  = (DCR_ABus[0:7] == dcr_base_addr[0:7]);

  always @(posedge clk)
  begin
    dcr_read_access <=  DCR_Read              & dcr_addr_hit;
    DCR_Ack         <= (DCR_Read | DCR_Write) & dcr_addr_hit;
  end

  always @(posedge clk)
    if (rst)
      tft_base_addr <= C_DEFAULT_TFT_BASE_ADDR;
   else if (DCR_Write & ~DCR_Ack & dcr_addr_hit & (DCR_ABus[8:9] == 2'b00))
      tft_base_addr <= DCR_DBusIn[0:10];

  always @(posedge clk)
    if (rst) begin
      tft_dps_reg <= C_DPS_INIT;
      tft_on_reg  <= C_ON_INIT;
    end
    else if (DCR_Write & ~DCR_Ack & dcr_addr_hit & (DCR_ABus[8:9] == 2'b01)) begin
      tft_dps_reg <= DCR_DBusIn[30];
      tft_on_reg  <= DCR_DBusIn[31];
    end

  always @(posedge clk)
    if (rst) begin
      dcr_iic_sda_t <= 1'b1;
      dcr_iic_scl_t <= 1'b1;
    end
    else if (DCR_Write & ~DCR_Ack & dcr_addr_hit & (DCR_ABus[8:9] == 2'b11)) begin
      dcr_iic_sda_t <= DCR_DBusIn[30];
      dcr_iic_scl_t <= DCR_DBusIn[31];
    end

  always @(posedge clk)
    if (DCR_Read & dcr_addr_hit & ~DCR_Ack)
      read_data <= (DCR_ABus[8:9] == 2'b00)? {tft_base_addr, 21'b0} :
                   (DCR_ABus[8:9] == 2'b01)? {30'b0, tft_dps_reg, tft_on_reg} :
                   (DCR_ABus[8:9] == 2'b10)? {30'b0, dcr_iic_sda_i, dcr_iic_scl_i}  :
                                             {30'b0, dcr_iic_sda_t, dcr_iic_scl_t} ;

  assign DCR_DBusOut = (dcr_read_access)? read_data : DCR_DBusIn;

endmodule
