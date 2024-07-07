//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Sun Jul  7 18:18:49 2024
//Host        : DESKTOP-EJ18JGA running 64-bit major release  (build 9200)
//Command     : generate_target system_design_wrapper.bd
//Design      : system_design_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_design_wrapper
   (dip_switches_16bits_0_tri_o,
    dip_switches_16bits_tri_o,
    led_16bits_tri_i,
    reset,
    seven_seg_led_disp_tri_o,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  output [3:0]dip_switches_16bits_0_tri_o;
  output [15:0]dip_switches_16bits_tri_o;
  input [15:0]led_16bits_tri_i;
  input reset;
  output [7:0]seven_seg_led_disp_tri_o;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire [3:0]dip_switches_16bits_0_tri_o;
  wire [15:0]dip_switches_16bits_tri_o;
  wire [15:0]led_16bits_tri_i;
  wire reset;
  wire [7:0]seven_seg_led_disp_tri_o;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  system_design system_design_i
       (.dip_switches_16bits_0_tri_o(dip_switches_16bits_0_tri_o),
        .dip_switches_16bits_tri_o(dip_switches_16bits_tri_o),
        .led_16bits_tri_i(led_16bits_tri_i),
        .reset(reset),
        .seven_seg_led_disp_tri_o(seven_seg_led_disp_tri_o),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
