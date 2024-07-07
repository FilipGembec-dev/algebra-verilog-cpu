//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Sun Jul  7 18:18:48 2024
//Host        : DESKTOP-EJ18JGA running 64-bit major release  (build 9200)
//Command     : generate_target system_design.bd
//Design      : system_design
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module m00_couplers_imp_1I1UWVY
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [0:0]m00_couplers_to_m00_couplers_ARREADY;
  wire [0:0]m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [0:0]m00_couplers_to_m00_couplers_AWREADY;
  wire [0:0]m00_couplers_to_m00_couplers_AWVALID;
  wire [0:0]m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire [0:0]m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [0:0]m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire [0:0]m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire [0:0]m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire [0:0]m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready[0] = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready[0] = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready[0] = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready[0] = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid[0] = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid[0] = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready[0] = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready[0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid[0];
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready[0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid[0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready[0];
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid[0];
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready[0];
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid[0];
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready[0];
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m01_couplers_imp_OWEHII
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [0:0]m01_couplers_to_m01_couplers_ARREADY;
  wire [0:0]m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [0:0]m01_couplers_to_m01_couplers_AWREADY;
  wire [0:0]m01_couplers_to_m01_couplers_AWVALID;
  wire [0:0]m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire [0:0]m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire [0:0]m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire [0:0]m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire [0:0]m01_couplers_to_m01_couplers_WREADY;
  wire [3:0]m01_couplers_to_m01_couplers_WSTRB;
  wire [0:0]m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready[0] = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready[0] = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_couplers_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready[0] = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready[0] = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid[0] = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid[0] = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready[0] = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready[0];
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid[0];
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready[0];
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid[0];
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready[0];
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid[0];
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready[0];
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid[0];
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready[0];
  assign m01_couplers_to_m01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m02_couplers_imp_D4XT07
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [3:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [3:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m02_couplers_to_m02_data_fifo_ARADDR;
  wire [2:0]m02_couplers_to_m02_data_fifo_ARPROT;
  wire m02_couplers_to_m02_data_fifo_ARREADY;
  wire m02_couplers_to_m02_data_fifo_ARVALID;
  wire [31:0]m02_couplers_to_m02_data_fifo_AWADDR;
  wire [2:0]m02_couplers_to_m02_data_fifo_AWPROT;
  wire m02_couplers_to_m02_data_fifo_AWREADY;
  wire m02_couplers_to_m02_data_fifo_AWVALID;
  wire m02_couplers_to_m02_data_fifo_BREADY;
  wire [1:0]m02_couplers_to_m02_data_fifo_BRESP;
  wire m02_couplers_to_m02_data_fifo_BVALID;
  wire [31:0]m02_couplers_to_m02_data_fifo_RDATA;
  wire m02_couplers_to_m02_data_fifo_RREADY;
  wire [1:0]m02_couplers_to_m02_data_fifo_RRESP;
  wire m02_couplers_to_m02_data_fifo_RVALID;
  wire [31:0]m02_couplers_to_m02_data_fifo_WDATA;
  wire m02_couplers_to_m02_data_fifo_WREADY;
  wire [3:0]m02_couplers_to_m02_data_fifo_WSTRB;
  wire m02_couplers_to_m02_data_fifo_WVALID;
  wire [3:0]m02_data_fifo_to_m02_regslice_ARADDR;
  wire [2:0]m02_data_fifo_to_m02_regslice_ARPROT;
  wire m02_data_fifo_to_m02_regslice_ARREADY;
  wire m02_data_fifo_to_m02_regslice_ARVALID;
  wire [3:0]m02_data_fifo_to_m02_regslice_AWADDR;
  wire [2:0]m02_data_fifo_to_m02_regslice_AWPROT;
  wire m02_data_fifo_to_m02_regslice_AWREADY;
  wire m02_data_fifo_to_m02_regslice_AWVALID;
  wire m02_data_fifo_to_m02_regslice_BREADY;
  wire [1:0]m02_data_fifo_to_m02_regslice_BRESP;
  wire m02_data_fifo_to_m02_regslice_BVALID;
  wire [31:0]m02_data_fifo_to_m02_regslice_RDATA;
  wire m02_data_fifo_to_m02_regslice_RREADY;
  wire [1:0]m02_data_fifo_to_m02_regslice_RRESP;
  wire m02_data_fifo_to_m02_regslice_RVALID;
  wire [31:0]m02_data_fifo_to_m02_regslice_WDATA;
  wire m02_data_fifo_to_m02_regslice_WREADY;
  wire [3:0]m02_data_fifo_to_m02_regslice_WSTRB;
  wire m02_data_fifo_to_m02_regslice_WVALID;
  wire [3:0]m02_regslice_to_m02_couplers_ARADDR;
  wire m02_regslice_to_m02_couplers_ARREADY;
  wire m02_regslice_to_m02_couplers_ARVALID;
  wire [3:0]m02_regslice_to_m02_couplers_AWADDR;
  wire m02_regslice_to_m02_couplers_AWREADY;
  wire m02_regslice_to_m02_couplers_AWVALID;
  wire m02_regslice_to_m02_couplers_BREADY;
  wire [1:0]m02_regslice_to_m02_couplers_BRESP;
  wire m02_regslice_to_m02_couplers_BVALID;
  wire [31:0]m02_regslice_to_m02_couplers_RDATA;
  wire m02_regslice_to_m02_couplers_RREADY;
  wire [1:0]m02_regslice_to_m02_couplers_RRESP;
  wire m02_regslice_to_m02_couplers_RVALID;
  wire [31:0]m02_regslice_to_m02_couplers_WDATA;
  wire m02_regslice_to_m02_couplers_WREADY;
  wire [3:0]m02_regslice_to_m02_couplers_WSTRB;
  wire m02_regslice_to_m02_couplers_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[3:0] = m02_regslice_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid = m02_regslice_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[3:0] = m02_regslice_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid = m02_regslice_to_m02_couplers_AWVALID;
  assign M_AXI_bready = m02_regslice_to_m02_couplers_BREADY;
  assign M_AXI_rready = m02_regslice_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_regslice_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m02_regslice_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid = m02_regslice_to_m02_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m02_couplers_to_m02_data_fifo_ARREADY;
  assign S_AXI_awready = m02_couplers_to_m02_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_data_fifo_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_m02_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_data_fifo_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_m02_data_fifo_RVALID;
  assign S_AXI_wready = m02_couplers_to_m02_data_fifo_WREADY;
  assign m02_couplers_to_m02_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_m02_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m02_couplers_to_m02_data_fifo_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_m02_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_m02_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m02_couplers_to_m02_data_fifo_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_m02_data_fifo_BREADY = S_AXI_bready;
  assign m02_couplers_to_m02_data_fifo_RREADY = S_AXI_rready;
  assign m02_couplers_to_m02_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_m02_data_fifo_WVALID = S_AXI_wvalid;
  assign m02_regslice_to_m02_couplers_ARREADY = M_AXI_arready;
  assign m02_regslice_to_m02_couplers_AWREADY = M_AXI_awready;
  assign m02_regslice_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_regslice_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign m02_regslice_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_regslice_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_regslice_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign m02_regslice_to_m02_couplers_WREADY = M_AXI_wready;
  system_design_m02_data_fifo_0 m02_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m02_data_fifo_to_m02_regslice_ARADDR),
        .m_axi_arprot(m02_data_fifo_to_m02_regslice_ARPROT),
        .m_axi_arready(m02_data_fifo_to_m02_regslice_ARREADY),
        .m_axi_arvalid(m02_data_fifo_to_m02_regslice_ARVALID),
        .m_axi_awaddr(m02_data_fifo_to_m02_regslice_AWADDR),
        .m_axi_awprot(m02_data_fifo_to_m02_regslice_AWPROT),
        .m_axi_awready(m02_data_fifo_to_m02_regslice_AWREADY),
        .m_axi_awvalid(m02_data_fifo_to_m02_regslice_AWVALID),
        .m_axi_bready(m02_data_fifo_to_m02_regslice_BREADY),
        .m_axi_bresp(m02_data_fifo_to_m02_regslice_BRESP),
        .m_axi_bvalid(m02_data_fifo_to_m02_regslice_BVALID),
        .m_axi_rdata(m02_data_fifo_to_m02_regslice_RDATA),
        .m_axi_rready(m02_data_fifo_to_m02_regslice_RREADY),
        .m_axi_rresp(m02_data_fifo_to_m02_regslice_RRESP),
        .m_axi_rvalid(m02_data_fifo_to_m02_regslice_RVALID),
        .m_axi_wdata(m02_data_fifo_to_m02_regslice_WDATA),
        .m_axi_wready(m02_data_fifo_to_m02_regslice_WREADY),
        .m_axi_wstrb(m02_data_fifo_to_m02_regslice_WSTRB),
        .m_axi_wvalid(m02_data_fifo_to_m02_regslice_WVALID),
        .s_axi_araddr(m02_couplers_to_m02_data_fifo_ARADDR[3:0]),
        .s_axi_arprot(m02_couplers_to_m02_data_fifo_ARPROT),
        .s_axi_arready(m02_couplers_to_m02_data_fifo_ARREADY),
        .s_axi_arvalid(m02_couplers_to_m02_data_fifo_ARVALID),
        .s_axi_awaddr(m02_couplers_to_m02_data_fifo_AWADDR[3:0]),
        .s_axi_awprot(m02_couplers_to_m02_data_fifo_AWPROT),
        .s_axi_awready(m02_couplers_to_m02_data_fifo_AWREADY),
        .s_axi_awvalid(m02_couplers_to_m02_data_fifo_AWVALID),
        .s_axi_bready(m02_couplers_to_m02_data_fifo_BREADY),
        .s_axi_bresp(m02_couplers_to_m02_data_fifo_BRESP),
        .s_axi_bvalid(m02_couplers_to_m02_data_fifo_BVALID),
        .s_axi_rdata(m02_couplers_to_m02_data_fifo_RDATA),
        .s_axi_rready(m02_couplers_to_m02_data_fifo_RREADY),
        .s_axi_rresp(m02_couplers_to_m02_data_fifo_RRESP),
        .s_axi_rvalid(m02_couplers_to_m02_data_fifo_RVALID),
        .s_axi_wdata(m02_couplers_to_m02_data_fifo_WDATA),
        .s_axi_wready(m02_couplers_to_m02_data_fifo_WREADY),
        .s_axi_wstrb(m02_couplers_to_m02_data_fifo_WSTRB),
        .s_axi_wvalid(m02_couplers_to_m02_data_fifo_WVALID));
  system_design_m02_regslice_0 m02_regslice
       (.aclk(M_ACLK_1),
        .aresetn(M_ARESETN_1),
        .m_axi_araddr(m02_regslice_to_m02_couplers_ARADDR),
        .m_axi_arready(m02_regslice_to_m02_couplers_ARREADY),
        .m_axi_arvalid(m02_regslice_to_m02_couplers_ARVALID),
        .m_axi_awaddr(m02_regslice_to_m02_couplers_AWADDR),
        .m_axi_awready(m02_regslice_to_m02_couplers_AWREADY),
        .m_axi_awvalid(m02_regslice_to_m02_couplers_AWVALID),
        .m_axi_bready(m02_regslice_to_m02_couplers_BREADY),
        .m_axi_bresp(m02_regslice_to_m02_couplers_BRESP),
        .m_axi_bvalid(m02_regslice_to_m02_couplers_BVALID),
        .m_axi_rdata(m02_regslice_to_m02_couplers_RDATA),
        .m_axi_rready(m02_regslice_to_m02_couplers_RREADY),
        .m_axi_rresp(m02_regslice_to_m02_couplers_RRESP),
        .m_axi_rvalid(m02_regslice_to_m02_couplers_RVALID),
        .m_axi_wdata(m02_regslice_to_m02_couplers_WDATA),
        .m_axi_wready(m02_regslice_to_m02_couplers_WREADY),
        .m_axi_wstrb(m02_regslice_to_m02_couplers_WSTRB),
        .m_axi_wvalid(m02_regslice_to_m02_couplers_WVALID),
        .s_axi_araddr(m02_data_fifo_to_m02_regslice_ARADDR),
        .s_axi_arprot(m02_data_fifo_to_m02_regslice_ARPROT),
        .s_axi_arready(m02_data_fifo_to_m02_regslice_ARREADY),
        .s_axi_arvalid(m02_data_fifo_to_m02_regslice_ARVALID),
        .s_axi_awaddr(m02_data_fifo_to_m02_regslice_AWADDR),
        .s_axi_awprot(m02_data_fifo_to_m02_regslice_AWPROT),
        .s_axi_awready(m02_data_fifo_to_m02_regslice_AWREADY),
        .s_axi_awvalid(m02_data_fifo_to_m02_regslice_AWVALID),
        .s_axi_bready(m02_data_fifo_to_m02_regslice_BREADY),
        .s_axi_bresp(m02_data_fifo_to_m02_regslice_BRESP),
        .s_axi_bvalid(m02_data_fifo_to_m02_regslice_BVALID),
        .s_axi_rdata(m02_data_fifo_to_m02_regslice_RDATA),
        .s_axi_rready(m02_data_fifo_to_m02_regslice_RREADY),
        .s_axi_rresp(m02_data_fifo_to_m02_regslice_RRESP),
        .s_axi_rvalid(m02_data_fifo_to_m02_regslice_RVALID),
        .s_axi_wdata(m02_data_fifo_to_m02_regslice_WDATA),
        .s_axi_wready(m02_data_fifo_to_m02_regslice_WREADY),
        .s_axi_wstrb(m02_data_fifo_to_m02_regslice_WSTRB),
        .s_axi_wvalid(m02_data_fifo_to_m02_regslice_WVALID));
endmodule

module s00_couplers_imp_1PBW5FL
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]s00_couplers_to_s00_regslice_ARADDR;
  wire s00_couplers_to_s00_regslice_ARREADY;
  wire s00_couplers_to_s00_regslice_ARVALID;
  wire [31:0]s00_couplers_to_s00_regslice_AWADDR;
  wire s00_couplers_to_s00_regslice_AWREADY;
  wire s00_couplers_to_s00_regslice_AWVALID;
  wire s00_couplers_to_s00_regslice_BREADY;
  wire [1:0]s00_couplers_to_s00_regslice_BRESP;
  wire s00_couplers_to_s00_regslice_BVALID;
  wire [31:0]s00_couplers_to_s00_regslice_RDATA;
  wire s00_couplers_to_s00_regslice_RREADY;
  wire s00_couplers_to_s00_regslice_RVALID;
  wire [31:0]s00_couplers_to_s00_regslice_WDATA;
  wire s00_couplers_to_s00_regslice_WREADY;
  wire [3:0]s00_couplers_to_s00_regslice_WSTRB;
  wire s00_couplers_to_s00_regslice_WVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_ARADDR;
  wire [2:0]s00_data_fifo_to_s00_couplers_ARPROT;
  wire s00_data_fifo_to_s00_couplers_ARREADY;
  wire s00_data_fifo_to_s00_couplers_ARVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_AWADDR;
  wire [2:0]s00_data_fifo_to_s00_couplers_AWPROT;
  wire s00_data_fifo_to_s00_couplers_AWREADY;
  wire s00_data_fifo_to_s00_couplers_AWVALID;
  wire s00_data_fifo_to_s00_couplers_BREADY;
  wire [1:0]s00_data_fifo_to_s00_couplers_BRESP;
  wire s00_data_fifo_to_s00_couplers_BVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_RDATA;
  wire s00_data_fifo_to_s00_couplers_RREADY;
  wire [1:0]s00_data_fifo_to_s00_couplers_RRESP;
  wire s00_data_fifo_to_s00_couplers_RVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_WDATA;
  wire s00_data_fifo_to_s00_couplers_WREADY;
  wire [3:0]s00_data_fifo_to_s00_couplers_WSTRB;
  wire s00_data_fifo_to_s00_couplers_WVALID;
  wire [31:0]s00_regslice_to_s00_data_fifo_ARADDR;
  wire [2:0]s00_regslice_to_s00_data_fifo_ARPROT;
  wire s00_regslice_to_s00_data_fifo_ARREADY;
  wire s00_regslice_to_s00_data_fifo_ARVALID;
  wire [31:0]s00_regslice_to_s00_data_fifo_AWADDR;
  wire [2:0]s00_regslice_to_s00_data_fifo_AWPROT;
  wire s00_regslice_to_s00_data_fifo_AWREADY;
  wire s00_regslice_to_s00_data_fifo_AWVALID;
  wire s00_regslice_to_s00_data_fifo_BREADY;
  wire [1:0]s00_regslice_to_s00_data_fifo_BRESP;
  wire s00_regslice_to_s00_data_fifo_BVALID;
  wire [31:0]s00_regslice_to_s00_data_fifo_RDATA;
  wire s00_regslice_to_s00_data_fifo_RREADY;
  wire [1:0]s00_regslice_to_s00_data_fifo_RRESP;
  wire s00_regslice_to_s00_data_fifo_RVALID;
  wire [31:0]s00_regslice_to_s00_data_fifo_WDATA;
  wire s00_regslice_to_s00_data_fifo_WREADY;
  wire [3:0]s00_regslice_to_s00_data_fifo_WSTRB;
  wire s00_regslice_to_s00_data_fifo_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[31:0] = s00_data_fifo_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = s00_data_fifo_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = s00_data_fifo_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_data_fifo_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = s00_data_fifo_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = s00_data_fifo_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_data_fifo_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_data_fifo_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_data_fifo_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = s00_data_fifo_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_data_fifo_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_s00_regslice_ARREADY;
  assign S_AXI_awready = s00_couplers_to_s00_regslice_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_regslice_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_s00_regslice_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_regslice_RDATA;
  assign S_AXI_rvalid = s00_couplers_to_s00_regslice_RVALID;
  assign S_AXI_wready = s00_couplers_to_s00_regslice_WREADY;
  assign s00_couplers_to_s00_regslice_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_regslice_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_regslice_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_regslice_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_regslice_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_regslice_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_regslice_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_regslice_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_regslice_WVALID = S_AXI_wvalid;
  assign s00_data_fifo_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_data_fifo_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_data_fifo_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_data_fifo_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_data_fifo_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_data_fifo_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_data_fifo_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_data_fifo_to_s00_couplers_WREADY = M_AXI_wready;
  system_design_s00_data_fifo_0 s00_data_fifo
       (.aclk(M_ACLK_1),
        .aresetn(M_ARESETN_1),
        .m_axi_araddr(s00_data_fifo_to_s00_couplers_ARADDR),
        .m_axi_arprot(s00_data_fifo_to_s00_couplers_ARPROT),
        .m_axi_arready(s00_data_fifo_to_s00_couplers_ARREADY),
        .m_axi_arvalid(s00_data_fifo_to_s00_couplers_ARVALID),
        .m_axi_awaddr(s00_data_fifo_to_s00_couplers_AWADDR),
        .m_axi_awprot(s00_data_fifo_to_s00_couplers_AWPROT),
        .m_axi_awready(s00_data_fifo_to_s00_couplers_AWREADY),
        .m_axi_awvalid(s00_data_fifo_to_s00_couplers_AWVALID),
        .m_axi_bready(s00_data_fifo_to_s00_couplers_BREADY),
        .m_axi_bresp(s00_data_fifo_to_s00_couplers_BRESP),
        .m_axi_bvalid(s00_data_fifo_to_s00_couplers_BVALID),
        .m_axi_rdata(s00_data_fifo_to_s00_couplers_RDATA),
        .m_axi_rready(s00_data_fifo_to_s00_couplers_RREADY),
        .m_axi_rresp(s00_data_fifo_to_s00_couplers_RRESP),
        .m_axi_rvalid(s00_data_fifo_to_s00_couplers_RVALID),
        .m_axi_wdata(s00_data_fifo_to_s00_couplers_WDATA),
        .m_axi_wready(s00_data_fifo_to_s00_couplers_WREADY),
        .m_axi_wstrb(s00_data_fifo_to_s00_couplers_WSTRB),
        .m_axi_wvalid(s00_data_fifo_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_regslice_to_s00_data_fifo_ARADDR),
        .s_axi_arprot(s00_regslice_to_s00_data_fifo_ARPROT),
        .s_axi_arready(s00_regslice_to_s00_data_fifo_ARREADY),
        .s_axi_arvalid(s00_regslice_to_s00_data_fifo_ARVALID),
        .s_axi_awaddr(s00_regslice_to_s00_data_fifo_AWADDR),
        .s_axi_awprot(s00_regslice_to_s00_data_fifo_AWPROT),
        .s_axi_awready(s00_regslice_to_s00_data_fifo_AWREADY),
        .s_axi_awvalid(s00_regslice_to_s00_data_fifo_AWVALID),
        .s_axi_bready(s00_regslice_to_s00_data_fifo_BREADY),
        .s_axi_bresp(s00_regslice_to_s00_data_fifo_BRESP),
        .s_axi_bvalid(s00_regslice_to_s00_data_fifo_BVALID),
        .s_axi_rdata(s00_regslice_to_s00_data_fifo_RDATA),
        .s_axi_rready(s00_regslice_to_s00_data_fifo_RREADY),
        .s_axi_rresp(s00_regslice_to_s00_data_fifo_RRESP),
        .s_axi_rvalid(s00_regslice_to_s00_data_fifo_RVALID),
        .s_axi_wdata(s00_regslice_to_s00_data_fifo_WDATA),
        .s_axi_wready(s00_regslice_to_s00_data_fifo_WREADY),
        .s_axi_wstrb(s00_regslice_to_s00_data_fifo_WSTRB),
        .s_axi_wvalid(s00_regslice_to_s00_data_fifo_WVALID));
  system_design_s00_regslice_0 s00_regslice
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(s00_regslice_to_s00_data_fifo_ARADDR),
        .m_axi_arprot(s00_regslice_to_s00_data_fifo_ARPROT),
        .m_axi_arready(s00_regslice_to_s00_data_fifo_ARREADY),
        .m_axi_arvalid(s00_regslice_to_s00_data_fifo_ARVALID),
        .m_axi_awaddr(s00_regslice_to_s00_data_fifo_AWADDR),
        .m_axi_awprot(s00_regslice_to_s00_data_fifo_AWPROT),
        .m_axi_awready(s00_regslice_to_s00_data_fifo_AWREADY),
        .m_axi_awvalid(s00_regslice_to_s00_data_fifo_AWVALID),
        .m_axi_bready(s00_regslice_to_s00_data_fifo_BREADY),
        .m_axi_bresp(s00_regslice_to_s00_data_fifo_BRESP),
        .m_axi_bvalid(s00_regslice_to_s00_data_fifo_BVALID),
        .m_axi_rdata(s00_regslice_to_s00_data_fifo_RDATA),
        .m_axi_rready(s00_regslice_to_s00_data_fifo_RREADY),
        .m_axi_rresp(s00_regslice_to_s00_data_fifo_RRESP),
        .m_axi_rvalid(s00_regslice_to_s00_data_fifo_RVALID),
        .m_axi_wdata(s00_regslice_to_s00_data_fifo_WDATA),
        .m_axi_wready(s00_regslice_to_s00_data_fifo_WREADY),
        .m_axi_wstrb(s00_regslice_to_s00_data_fifo_WSTRB),
        .m_axi_wvalid(s00_regslice_to_s00_data_fifo_WVALID),
        .s_axi_araddr(s00_couplers_to_s00_regslice_ARADDR),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arready(s00_couplers_to_s00_regslice_ARREADY),
        .s_axi_arvalid(s00_couplers_to_s00_regslice_ARVALID),
        .s_axi_awaddr(s00_couplers_to_s00_regslice_AWADDR),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awready(s00_couplers_to_s00_regslice_AWREADY),
        .s_axi_awvalid(s00_couplers_to_s00_regslice_AWVALID),
        .s_axi_bready(s00_couplers_to_s00_regslice_BREADY),
        .s_axi_bresp(s00_couplers_to_s00_regslice_BRESP),
        .s_axi_bvalid(s00_couplers_to_s00_regslice_BVALID),
        .s_axi_rdata(s00_couplers_to_s00_regslice_RDATA),
        .s_axi_rready(s00_couplers_to_s00_regslice_RREADY),
        .s_axi_rvalid(s00_couplers_to_s00_regslice_RVALID),
        .s_axi_wdata(s00_couplers_to_s00_regslice_WDATA),
        .s_axi_wready(s00_couplers_to_s00_regslice_WREADY),
        .s_axi_wstrb(s00_couplers_to_s00_regslice_WSTRB),
        .s_axi_wvalid(s00_couplers_to_s00_regslice_WVALID));
endmodule

(* CORE_GENERATION_INFO = "system_design,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system_design,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=17,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=5,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=7,da_board_cnt=8,synth_mode=None}" *) (* HW_HANDOFF = "system_design.hwdef" *) 
module system_design
   (dip_switches_16bits_0_tri_o,
    dip_switches_16bits_tri_o,
    led_16bits_tri_i,
    reset,
    seven_seg_led_disp_tri_o,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 dip_switches_16bits_0 TRI_O" *) output [3:0]dip_switches_16bits_0_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 dip_switches_16bits TRI_O" *) output [15:0]dip_switches_16bits_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 led_16bits TRI_I" *) input [15:0]led_16bits_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 seven_seg_led_disp TRI_O" *) output [7:0]seven_seg_led_disp_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN system_design_sys_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart RxD" *) input usb_uart_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart TxD" *) output usb_uart_txd;

  wire [15:0]axi_gpio_0_GPIO2_TRI_I;
  wire [15:0]axi_gpio_0_GPIO_TRI_O;
  wire [7:0]axi_gpio_1_GPIO2_TRI_O;
  wire [3:0]axi_gpio_1_GPIO_TRI_O;
  wire axi_uartlite_0_UART_RxD;
  wire axi_uartlite_0_UART_TxD;
  wire [31:0]blk_mem_gen_0_douta;
  wire [31:0]blk_mem_gen_0_doutb;
  wire clk_wiz_clk_out1;
  wire clk_wiz_locked;
  wire [31:0]cpu_wrapper_0_addr_data;
  wire [31:0]cpu_wrapper_0_addr_inst;
  wire [31:0]cpu_wrapper_0_axi_periph_M00_AXI_ARADDR;
  wire cpu_wrapper_0_axi_periph_M00_AXI_ARREADY;
  wire [0:0]cpu_wrapper_0_axi_periph_M00_AXI_ARVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_M00_AXI_AWADDR;
  wire cpu_wrapper_0_axi_periph_M00_AXI_AWREADY;
  wire [0:0]cpu_wrapper_0_axi_periph_M00_AXI_AWVALID;
  wire [0:0]cpu_wrapper_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]cpu_wrapper_0_axi_periph_M00_AXI_BRESP;
  wire cpu_wrapper_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_M00_AXI_RDATA;
  wire [0:0]cpu_wrapper_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]cpu_wrapper_0_axi_periph_M00_AXI_RRESP;
  wire cpu_wrapper_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_M00_AXI_WDATA;
  wire cpu_wrapper_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]cpu_wrapper_0_axi_periph_M00_AXI_WSTRB;
  wire [0:0]cpu_wrapper_0_axi_periph_M00_AXI_WVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_M01_AXI_ARADDR;
  wire cpu_wrapper_0_axi_periph_M01_AXI_ARREADY;
  wire [0:0]cpu_wrapper_0_axi_periph_M01_AXI_ARVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_M01_AXI_AWADDR;
  wire cpu_wrapper_0_axi_periph_M01_AXI_AWREADY;
  wire [0:0]cpu_wrapper_0_axi_periph_M01_AXI_AWVALID;
  wire [0:0]cpu_wrapper_0_axi_periph_M01_AXI_BREADY;
  wire [1:0]cpu_wrapper_0_axi_periph_M01_AXI_BRESP;
  wire cpu_wrapper_0_axi_periph_M01_AXI_BVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_M01_AXI_RDATA;
  wire [0:0]cpu_wrapper_0_axi_periph_M01_AXI_RREADY;
  wire [1:0]cpu_wrapper_0_axi_periph_M01_AXI_RRESP;
  wire cpu_wrapper_0_axi_periph_M01_AXI_RVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_M01_AXI_WDATA;
  wire cpu_wrapper_0_axi_periph_M01_AXI_WREADY;
  wire [3:0]cpu_wrapper_0_axi_periph_M01_AXI_WSTRB;
  wire [0:0]cpu_wrapper_0_axi_periph_M01_AXI_WVALID;
  wire [3:0]cpu_wrapper_0_axi_periph_M02_AXI_ARADDR;
  wire cpu_wrapper_0_axi_periph_M02_AXI_ARREADY;
  wire cpu_wrapper_0_axi_periph_M02_AXI_ARVALID;
  wire [3:0]cpu_wrapper_0_axi_periph_M02_AXI_AWADDR;
  wire cpu_wrapper_0_axi_periph_M02_AXI_AWREADY;
  wire cpu_wrapper_0_axi_periph_M02_AXI_AWVALID;
  wire cpu_wrapper_0_axi_periph_M02_AXI_BREADY;
  wire [1:0]cpu_wrapper_0_axi_periph_M02_AXI_BRESP;
  wire cpu_wrapper_0_axi_periph_M02_AXI_BVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_M02_AXI_RDATA;
  wire cpu_wrapper_0_axi_periph_M02_AXI_RREADY;
  wire [1:0]cpu_wrapper_0_axi_periph_M02_AXI_RRESP;
  wire cpu_wrapper_0_axi_periph_M02_AXI_RVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_M02_AXI_WDATA;
  wire cpu_wrapper_0_axi_periph_M02_AXI_WREADY;
  wire [3:0]cpu_wrapper_0_axi_periph_M02_AXI_WSTRB;
  wire cpu_wrapper_0_axi_periph_M02_AXI_WVALID;
  wire [31:0]cpu_wrapper_0_data_out_data;
  wire [31:0]cpu_wrapper_0_data_out_inst;
  wire cpu_wrapper_0_en_data;
  wire [31:0]cpu_wrapper_0_m_axi_ARADDR;
  wire cpu_wrapper_0_m_axi_ARREADY;
  wire cpu_wrapper_0_m_axi_ARVALID;
  wire [31:0]cpu_wrapper_0_m_axi_AWADDR;
  wire cpu_wrapper_0_m_axi_AWREADY;
  wire cpu_wrapper_0_m_axi_AWVALID;
  wire cpu_wrapper_0_m_axi_BREADY;
  wire [1:0]cpu_wrapper_0_m_axi_BRESP;
  wire cpu_wrapper_0_m_axi_BVALID;
  wire [31:0]cpu_wrapper_0_m_axi_RDATA;
  wire cpu_wrapper_0_m_axi_RREADY;
  wire cpu_wrapper_0_m_axi_RVALID;
  wire [31:0]cpu_wrapper_0_m_axi_WDATA;
  wire cpu_wrapper_0_m_axi_WREADY;
  wire [3:0]cpu_wrapper_0_m_axi_WSTRB;
  wire cpu_wrapper_0_m_axi_WVALID;
  wire [3:0]cpu_wrapper_0_we_data;
  wire [3:0]cpu_wrapper_0_we_inst;
  wire reset_1;
  wire [0:0]rst_clk_wiz_100M_peripheral_aresetn;
  wire [0:0]rst_clk_wiz_100M_peripheral_reset;
  wire sys_clock_1;

  assign axi_gpio_0_GPIO2_TRI_I = led_16bits_tri_i[15:0];
  assign axi_uartlite_0_UART_RxD = usb_uart_rxd;
  assign dip_switches_16bits_0_tri_o[3:0] = axi_gpio_1_GPIO_TRI_O;
  assign dip_switches_16bits_tri_o[15:0] = axi_gpio_0_GPIO_TRI_O;
  assign reset_1 = reset;
  assign seven_seg_led_disp_tri_o[7:0] = axi_gpio_1_GPIO2_TRI_O;
  assign sys_clock_1 = sys_clock;
  assign usb_uart_txd = axi_uartlite_0_UART_TxD;
  system_design_axi_gpio_0_0 axi_gpio_0
       (.gpio2_io_i(axi_gpio_0_GPIO2_TRI_I),
        .gpio_io_o(axi_gpio_0_GPIO_TRI_O),
        .s_axi_aclk(clk_wiz_clk_out1),
        .s_axi_araddr(cpu_wrapper_0_axi_periph_M00_AXI_ARADDR[8:0]),
        .s_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axi_arready(cpu_wrapper_0_axi_periph_M00_AXI_ARREADY),
        .s_axi_arvalid(cpu_wrapper_0_axi_periph_M00_AXI_ARVALID),
        .s_axi_awaddr(cpu_wrapper_0_axi_periph_M00_AXI_AWADDR[8:0]),
        .s_axi_awready(cpu_wrapper_0_axi_periph_M00_AXI_AWREADY),
        .s_axi_awvalid(cpu_wrapper_0_axi_periph_M00_AXI_AWVALID),
        .s_axi_bready(cpu_wrapper_0_axi_periph_M00_AXI_BREADY),
        .s_axi_bresp(cpu_wrapper_0_axi_periph_M00_AXI_BRESP),
        .s_axi_bvalid(cpu_wrapper_0_axi_periph_M00_AXI_BVALID),
        .s_axi_rdata(cpu_wrapper_0_axi_periph_M00_AXI_RDATA),
        .s_axi_rready(cpu_wrapper_0_axi_periph_M00_AXI_RREADY),
        .s_axi_rresp(cpu_wrapper_0_axi_periph_M00_AXI_RRESP),
        .s_axi_rvalid(cpu_wrapper_0_axi_periph_M00_AXI_RVALID),
        .s_axi_wdata(cpu_wrapper_0_axi_periph_M00_AXI_WDATA),
        .s_axi_wready(cpu_wrapper_0_axi_periph_M00_AXI_WREADY),
        .s_axi_wstrb(cpu_wrapper_0_axi_periph_M00_AXI_WSTRB),
        .s_axi_wvalid(cpu_wrapper_0_axi_periph_M00_AXI_WVALID));
  system_design_axi_gpio_1_0 axi_gpio_1
       (.gpio2_io_o(axi_gpio_1_GPIO2_TRI_O),
        .gpio_io_o(axi_gpio_1_GPIO_TRI_O),
        .s_axi_aclk(clk_wiz_clk_out1),
        .s_axi_araddr(cpu_wrapper_0_axi_periph_M01_AXI_ARADDR[8:0]),
        .s_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axi_arready(cpu_wrapper_0_axi_periph_M01_AXI_ARREADY),
        .s_axi_arvalid(cpu_wrapper_0_axi_periph_M01_AXI_ARVALID),
        .s_axi_awaddr(cpu_wrapper_0_axi_periph_M01_AXI_AWADDR[8:0]),
        .s_axi_awready(cpu_wrapper_0_axi_periph_M01_AXI_AWREADY),
        .s_axi_awvalid(cpu_wrapper_0_axi_periph_M01_AXI_AWVALID),
        .s_axi_bready(cpu_wrapper_0_axi_periph_M01_AXI_BREADY),
        .s_axi_bresp(cpu_wrapper_0_axi_periph_M01_AXI_BRESP),
        .s_axi_bvalid(cpu_wrapper_0_axi_periph_M01_AXI_BVALID),
        .s_axi_rdata(cpu_wrapper_0_axi_periph_M01_AXI_RDATA),
        .s_axi_rready(cpu_wrapper_0_axi_periph_M01_AXI_RREADY),
        .s_axi_rresp(cpu_wrapper_0_axi_periph_M01_AXI_RRESP),
        .s_axi_rvalid(cpu_wrapper_0_axi_periph_M01_AXI_RVALID),
        .s_axi_wdata(cpu_wrapper_0_axi_periph_M01_AXI_WDATA),
        .s_axi_wready(cpu_wrapper_0_axi_periph_M01_AXI_WREADY),
        .s_axi_wstrb(cpu_wrapper_0_axi_periph_M01_AXI_WSTRB),
        .s_axi_wvalid(cpu_wrapper_0_axi_periph_M01_AXI_WVALID));
  system_design_axi_uartlite_0_0 axi_uartlite_0
       (.rx(axi_uartlite_0_UART_RxD),
        .s_axi_aclk(clk_wiz_clk_out1),
        .s_axi_araddr(cpu_wrapper_0_axi_periph_M02_AXI_ARADDR),
        .s_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axi_arready(cpu_wrapper_0_axi_periph_M02_AXI_ARREADY),
        .s_axi_arvalid(cpu_wrapper_0_axi_periph_M02_AXI_ARVALID),
        .s_axi_awaddr(cpu_wrapper_0_axi_periph_M02_AXI_AWADDR),
        .s_axi_awready(cpu_wrapper_0_axi_periph_M02_AXI_AWREADY),
        .s_axi_awvalid(cpu_wrapper_0_axi_periph_M02_AXI_AWVALID),
        .s_axi_bready(cpu_wrapper_0_axi_periph_M02_AXI_BREADY),
        .s_axi_bresp(cpu_wrapper_0_axi_periph_M02_AXI_BRESP),
        .s_axi_bvalid(cpu_wrapper_0_axi_periph_M02_AXI_BVALID),
        .s_axi_rdata(cpu_wrapper_0_axi_periph_M02_AXI_RDATA),
        .s_axi_rready(cpu_wrapper_0_axi_periph_M02_AXI_RREADY),
        .s_axi_rresp(cpu_wrapper_0_axi_periph_M02_AXI_RRESP),
        .s_axi_rvalid(cpu_wrapper_0_axi_periph_M02_AXI_RVALID),
        .s_axi_wdata(cpu_wrapper_0_axi_periph_M02_AXI_WDATA),
        .s_axi_wready(cpu_wrapper_0_axi_periph_M02_AXI_WREADY),
        .s_axi_wstrb(cpu_wrapper_0_axi_periph_M02_AXI_WSTRB),
        .s_axi_wvalid(cpu_wrapper_0_axi_periph_M02_AXI_WVALID),
        .tx(axi_uartlite_0_UART_TxD));
  system_design_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(cpu_wrapper_0_addr_inst),
        .addrb(cpu_wrapper_0_addr_data),
        .clka(clk_wiz_clk_out1),
        .clkb(clk_wiz_clk_out1),
        .dina(cpu_wrapper_0_data_out_inst),
        .dinb(cpu_wrapper_0_data_out_data),
        .douta(blk_mem_gen_0_douta),
        .doutb(blk_mem_gen_0_doutb),
        .enb(cpu_wrapper_0_en_data),
        .rsta(rst_clk_wiz_100M_peripheral_reset),
        .rstb(rst_clk_wiz_100M_peripheral_reset),
        .wea(cpu_wrapper_0_we_inst),
        .web(cpu_wrapper_0_we_data));
  system_design_clk_wiz_0 clk_wiz
       (.clk_in1(sys_clock_1),
        .clk_out1(clk_wiz_clk_out1),
        .locked(clk_wiz_locked),
        .reset(reset_1));
  system_design_cpu_wrapper_0_1 cpu_wrapper_0
       (.aclk(clk_wiz_clk_out1),
        .addr_data(cpu_wrapper_0_addr_data),
        .addr_inst(cpu_wrapper_0_addr_inst),
        .aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .data_in_data(blk_mem_gen_0_doutb),
        .data_in_inst(blk_mem_gen_0_douta),
        .data_out_data(cpu_wrapper_0_data_out_data),
        .data_out_inst(cpu_wrapper_0_data_out_inst),
        .en_data(cpu_wrapper_0_en_data),
        .m_axi_araddr(cpu_wrapper_0_m_axi_ARADDR),
        .m_axi_arready(cpu_wrapper_0_m_axi_ARREADY),
        .m_axi_arvalid(cpu_wrapper_0_m_axi_ARVALID),
        .m_axi_awaddr(cpu_wrapper_0_m_axi_AWADDR),
        .m_axi_awready(cpu_wrapper_0_m_axi_AWREADY),
        .m_axi_awvalid(cpu_wrapper_0_m_axi_AWVALID),
        .m_axi_bready(cpu_wrapper_0_m_axi_BREADY),
        .m_axi_bresp(cpu_wrapper_0_m_axi_BRESP[0]),
        .m_axi_bvalid(cpu_wrapper_0_m_axi_BVALID),
        .m_axi_rdata(cpu_wrapper_0_m_axi_RDATA),
        .m_axi_rready(cpu_wrapper_0_m_axi_RREADY),
        .m_axi_rvalid(cpu_wrapper_0_m_axi_RVALID),
        .m_axi_wdata(cpu_wrapper_0_m_axi_WDATA),
        .m_axi_wready(cpu_wrapper_0_m_axi_WREADY),
        .m_axi_wstrb(cpu_wrapper_0_m_axi_WSTRB),
        .m_axi_wvalid(cpu_wrapper_0_m_axi_WVALID),
        .we_data(cpu_wrapper_0_we_data),
        .we_inst(cpu_wrapper_0_we_inst));
  system_design_cpu_wrapper_0_axi_periph_1 cpu_wrapper_0_axi_periph
       (.ACLK(clk_wiz_clk_out1),
        .ARESETN(rst_clk_wiz_100M_peripheral_aresetn),
        .M00_ACLK(clk_wiz_clk_out1),
        .M00_ARESETN(rst_clk_wiz_100M_peripheral_aresetn),
        .M00_AXI_araddr(cpu_wrapper_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(cpu_wrapper_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(cpu_wrapper_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(cpu_wrapper_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(cpu_wrapper_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(cpu_wrapper_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(cpu_wrapper_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(cpu_wrapper_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(cpu_wrapper_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(cpu_wrapper_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(cpu_wrapper_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(cpu_wrapper_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(cpu_wrapper_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(cpu_wrapper_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(cpu_wrapper_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(cpu_wrapper_0_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(cpu_wrapper_0_axi_periph_M00_AXI_WVALID),
        .M01_ACLK(clk_wiz_clk_out1),
        .M01_ARESETN(rst_clk_wiz_100M_peripheral_aresetn),
        .M01_AXI_araddr(cpu_wrapper_0_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(cpu_wrapper_0_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(cpu_wrapper_0_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(cpu_wrapper_0_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(cpu_wrapper_0_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(cpu_wrapper_0_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(cpu_wrapper_0_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(cpu_wrapper_0_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(cpu_wrapper_0_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(cpu_wrapper_0_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(cpu_wrapper_0_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(cpu_wrapper_0_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(cpu_wrapper_0_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(cpu_wrapper_0_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(cpu_wrapper_0_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wstrb(cpu_wrapper_0_axi_periph_M01_AXI_WSTRB),
        .M01_AXI_wvalid(cpu_wrapper_0_axi_periph_M01_AXI_WVALID),
        .M02_ACLK(clk_wiz_clk_out1),
        .M02_ARESETN(rst_clk_wiz_100M_peripheral_aresetn),
        .M02_AXI_araddr(cpu_wrapper_0_axi_periph_M02_AXI_ARADDR),
        .M02_AXI_arready(cpu_wrapper_0_axi_periph_M02_AXI_ARREADY),
        .M02_AXI_arvalid(cpu_wrapper_0_axi_periph_M02_AXI_ARVALID),
        .M02_AXI_awaddr(cpu_wrapper_0_axi_periph_M02_AXI_AWADDR),
        .M02_AXI_awready(cpu_wrapper_0_axi_periph_M02_AXI_AWREADY),
        .M02_AXI_awvalid(cpu_wrapper_0_axi_periph_M02_AXI_AWVALID),
        .M02_AXI_bready(cpu_wrapper_0_axi_periph_M02_AXI_BREADY),
        .M02_AXI_bresp(cpu_wrapper_0_axi_periph_M02_AXI_BRESP),
        .M02_AXI_bvalid(cpu_wrapper_0_axi_periph_M02_AXI_BVALID),
        .M02_AXI_rdata(cpu_wrapper_0_axi_periph_M02_AXI_RDATA),
        .M02_AXI_rready(cpu_wrapper_0_axi_periph_M02_AXI_RREADY),
        .M02_AXI_rresp(cpu_wrapper_0_axi_periph_M02_AXI_RRESP),
        .M02_AXI_rvalid(cpu_wrapper_0_axi_periph_M02_AXI_RVALID),
        .M02_AXI_wdata(cpu_wrapper_0_axi_periph_M02_AXI_WDATA),
        .M02_AXI_wready(cpu_wrapper_0_axi_periph_M02_AXI_WREADY),
        .M02_AXI_wstrb(cpu_wrapper_0_axi_periph_M02_AXI_WSTRB),
        .M02_AXI_wvalid(cpu_wrapper_0_axi_periph_M02_AXI_WVALID),
        .S00_ACLK(clk_wiz_clk_out1),
        .S00_ARESETN(rst_clk_wiz_100M_peripheral_aresetn),
        .S00_AXI_araddr(cpu_wrapper_0_m_axi_ARADDR),
        .S00_AXI_arready(cpu_wrapper_0_m_axi_ARREADY),
        .S00_AXI_arvalid(cpu_wrapper_0_m_axi_ARVALID),
        .S00_AXI_awaddr(cpu_wrapper_0_m_axi_AWADDR),
        .S00_AXI_awready(cpu_wrapper_0_m_axi_AWREADY),
        .S00_AXI_awvalid(cpu_wrapper_0_m_axi_AWVALID),
        .S00_AXI_bready(cpu_wrapper_0_m_axi_BREADY),
        .S00_AXI_bresp(cpu_wrapper_0_m_axi_BRESP),
        .S00_AXI_bvalid(cpu_wrapper_0_m_axi_BVALID),
        .S00_AXI_rdata(cpu_wrapper_0_m_axi_RDATA),
        .S00_AXI_rready(cpu_wrapper_0_m_axi_RREADY),
        .S00_AXI_rvalid(cpu_wrapper_0_m_axi_RVALID),
        .S00_AXI_wdata(cpu_wrapper_0_m_axi_WDATA),
        .S00_AXI_wready(cpu_wrapper_0_m_axi_WREADY),
        .S00_AXI_wstrb(cpu_wrapper_0_m_axi_WSTRB),
        .S00_AXI_wvalid(cpu_wrapper_0_m_axi_WVALID));
  system_design_rst_clk_wiz_100M_0 rst_clk_wiz_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_locked),
        .ext_reset_in(reset_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .peripheral_reset(rst_clk_wiz_100M_peripheral_reset),
        .slowest_sync_clk(clk_wiz_clk_out1));
endmodule

module system_design_cpu_wrapper_0_axi_periph_1
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output [0:0]M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [3:0]M02_AXI_araddr;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [3:0]M02_AXI_awaddr;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  output S00_AXI_arready;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  output S00_AXI_awready;
  input S00_AXI_awvalid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input S00_AXI_rready;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire cpu_wrapper_0_axi_periph_ACLK_net;
  wire cpu_wrapper_0_axi_periph_ARESETN_net;
  wire [31:0]cpu_wrapper_0_axi_periph_to_s00_couplers_ARADDR;
  wire cpu_wrapper_0_axi_periph_to_s00_couplers_ARREADY;
  wire cpu_wrapper_0_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_to_s00_couplers_AWADDR;
  wire cpu_wrapper_0_axi_periph_to_s00_couplers_AWREADY;
  wire cpu_wrapper_0_axi_periph_to_s00_couplers_AWVALID;
  wire cpu_wrapper_0_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]cpu_wrapper_0_axi_periph_to_s00_couplers_BRESP;
  wire cpu_wrapper_0_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_to_s00_couplers_RDATA;
  wire cpu_wrapper_0_axi_periph_to_s00_couplers_RREADY;
  wire cpu_wrapper_0_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]cpu_wrapper_0_axi_periph_to_s00_couplers_WDATA;
  wire cpu_wrapper_0_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]cpu_wrapper_0_axi_periph_to_s00_couplers_WSTRB;
  wire cpu_wrapper_0_axi_periph_to_s00_couplers_WVALID;
  wire [31:0]m00_couplers_to_cpu_wrapper_0_axi_periph_ARADDR;
  wire [0:0]m00_couplers_to_cpu_wrapper_0_axi_periph_ARREADY;
  wire [0:0]m00_couplers_to_cpu_wrapper_0_axi_periph_ARVALID;
  wire [31:0]m00_couplers_to_cpu_wrapper_0_axi_periph_AWADDR;
  wire [0:0]m00_couplers_to_cpu_wrapper_0_axi_periph_AWREADY;
  wire [0:0]m00_couplers_to_cpu_wrapper_0_axi_periph_AWVALID;
  wire [0:0]m00_couplers_to_cpu_wrapper_0_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_cpu_wrapper_0_axi_periph_BRESP;
  wire [0:0]m00_couplers_to_cpu_wrapper_0_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_cpu_wrapper_0_axi_periph_RDATA;
  wire [0:0]m00_couplers_to_cpu_wrapper_0_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_cpu_wrapper_0_axi_periph_RRESP;
  wire [0:0]m00_couplers_to_cpu_wrapper_0_axi_periph_RVALID;
  wire [31:0]m00_couplers_to_cpu_wrapper_0_axi_periph_WDATA;
  wire [0:0]m00_couplers_to_cpu_wrapper_0_axi_periph_WREADY;
  wire [3:0]m00_couplers_to_cpu_wrapper_0_axi_periph_WSTRB;
  wire [0:0]m00_couplers_to_cpu_wrapper_0_axi_periph_WVALID;
  wire [31:0]m01_couplers_to_cpu_wrapper_0_axi_periph_ARADDR;
  wire [0:0]m01_couplers_to_cpu_wrapper_0_axi_periph_ARREADY;
  wire [0:0]m01_couplers_to_cpu_wrapper_0_axi_periph_ARVALID;
  wire [31:0]m01_couplers_to_cpu_wrapper_0_axi_periph_AWADDR;
  wire [0:0]m01_couplers_to_cpu_wrapper_0_axi_periph_AWREADY;
  wire [0:0]m01_couplers_to_cpu_wrapper_0_axi_periph_AWVALID;
  wire [0:0]m01_couplers_to_cpu_wrapper_0_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_cpu_wrapper_0_axi_periph_BRESP;
  wire [0:0]m01_couplers_to_cpu_wrapper_0_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_cpu_wrapper_0_axi_periph_RDATA;
  wire [0:0]m01_couplers_to_cpu_wrapper_0_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_cpu_wrapper_0_axi_periph_RRESP;
  wire [0:0]m01_couplers_to_cpu_wrapper_0_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_cpu_wrapper_0_axi_periph_WDATA;
  wire [0:0]m01_couplers_to_cpu_wrapper_0_axi_periph_WREADY;
  wire [3:0]m01_couplers_to_cpu_wrapper_0_axi_periph_WSTRB;
  wire [0:0]m01_couplers_to_cpu_wrapper_0_axi_periph_WVALID;
  wire [3:0]m02_couplers_to_cpu_wrapper_0_axi_periph_ARADDR;
  wire m02_couplers_to_cpu_wrapper_0_axi_periph_ARREADY;
  wire m02_couplers_to_cpu_wrapper_0_axi_periph_ARVALID;
  wire [3:0]m02_couplers_to_cpu_wrapper_0_axi_periph_AWADDR;
  wire m02_couplers_to_cpu_wrapper_0_axi_periph_AWREADY;
  wire m02_couplers_to_cpu_wrapper_0_axi_periph_AWVALID;
  wire m02_couplers_to_cpu_wrapper_0_axi_periph_BREADY;
  wire [1:0]m02_couplers_to_cpu_wrapper_0_axi_periph_BRESP;
  wire m02_couplers_to_cpu_wrapper_0_axi_periph_BVALID;
  wire [31:0]m02_couplers_to_cpu_wrapper_0_axi_periph_RDATA;
  wire m02_couplers_to_cpu_wrapper_0_axi_periph_RREADY;
  wire [1:0]m02_couplers_to_cpu_wrapper_0_axi_periph_RRESP;
  wire m02_couplers_to_cpu_wrapper_0_axi_periph_RVALID;
  wire [31:0]m02_couplers_to_cpu_wrapper_0_axi_periph_WDATA;
  wire m02_couplers_to_cpu_wrapper_0_axi_periph_WREADY;
  wire [3:0]m02_couplers_to_cpu_wrapper_0_axi_periph_WSTRB;
  wire m02_couplers_to_cpu_wrapper_0_axi_periph_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [0:0]xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [0:0]xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [0:0]xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [0:0]xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire [0:0]xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire [0:0]xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [0:0]xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [8:6]xbar_to_m02_couplers_ARPROT;
  wire xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [8:6]xbar_to_m02_couplers_AWPROT;
  wire xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [8:0]NLW_xbar_m_axi_arprot_UNCONNECTED;
  wire [8:0]NLW_xbar_m_axi_awprot_UNCONNECTED;

  assign M00_AXI_araddr[31:0] = m00_couplers_to_cpu_wrapper_0_axi_periph_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_cpu_wrapper_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_cpu_wrapper_0_axi_periph_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_cpu_wrapper_0_axi_periph_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_cpu_wrapper_0_axi_periph_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_cpu_wrapper_0_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_cpu_wrapper_0_axi_periph_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_cpu_wrapper_0_axi_periph_WSTRB;
  assign M00_AXI_wvalid[0] = m00_couplers_to_cpu_wrapper_0_axi_periph_WVALID;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_cpu_wrapper_0_axi_periph_ARADDR;
  assign M01_AXI_arvalid[0] = m01_couplers_to_cpu_wrapper_0_axi_periph_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_cpu_wrapper_0_axi_periph_AWADDR;
  assign M01_AXI_awvalid[0] = m01_couplers_to_cpu_wrapper_0_axi_periph_AWVALID;
  assign M01_AXI_bready[0] = m01_couplers_to_cpu_wrapper_0_axi_periph_BREADY;
  assign M01_AXI_rready[0] = m01_couplers_to_cpu_wrapper_0_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_cpu_wrapper_0_axi_periph_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_cpu_wrapper_0_axi_periph_WSTRB;
  assign M01_AXI_wvalid[0] = m01_couplers_to_cpu_wrapper_0_axi_periph_WVALID;
  assign M02_AXI_araddr[3:0] = m02_couplers_to_cpu_wrapper_0_axi_periph_ARADDR;
  assign M02_AXI_arvalid = m02_couplers_to_cpu_wrapper_0_axi_periph_ARVALID;
  assign M02_AXI_awaddr[3:0] = m02_couplers_to_cpu_wrapper_0_axi_periph_AWADDR;
  assign M02_AXI_awvalid = m02_couplers_to_cpu_wrapper_0_axi_periph_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_cpu_wrapper_0_axi_periph_BREADY;
  assign M02_AXI_rready = m02_couplers_to_cpu_wrapper_0_axi_periph_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_cpu_wrapper_0_axi_periph_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_cpu_wrapper_0_axi_periph_WSTRB;
  assign M02_AXI_wvalid = m02_couplers_to_cpu_wrapper_0_axi_periph_WVALID;
  assign S00_AXI_arready = cpu_wrapper_0_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = cpu_wrapper_0_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = cpu_wrapper_0_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = cpu_wrapper_0_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = cpu_wrapper_0_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rvalid = cpu_wrapper_0_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = cpu_wrapper_0_axi_periph_to_s00_couplers_WREADY;
  assign cpu_wrapper_0_axi_periph_ACLK_net = ACLK;
  assign cpu_wrapper_0_axi_periph_ARESETN_net = ARESETN;
  assign cpu_wrapper_0_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign cpu_wrapper_0_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign cpu_wrapper_0_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign cpu_wrapper_0_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign cpu_wrapper_0_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign cpu_wrapper_0_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign cpu_wrapper_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign cpu_wrapper_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign cpu_wrapper_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign m00_couplers_to_cpu_wrapper_0_axi_periph_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_cpu_wrapper_0_axi_periph_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_cpu_wrapper_0_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_cpu_wrapper_0_axi_periph_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_cpu_wrapper_0_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_cpu_wrapper_0_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_cpu_wrapper_0_axi_periph_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_cpu_wrapper_0_axi_periph_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_cpu_wrapper_0_axi_periph_ARREADY = M01_AXI_arready[0];
  assign m01_couplers_to_cpu_wrapper_0_axi_periph_AWREADY = M01_AXI_awready[0];
  assign m01_couplers_to_cpu_wrapper_0_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_cpu_wrapper_0_axi_periph_BVALID = M01_AXI_bvalid[0];
  assign m01_couplers_to_cpu_wrapper_0_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_cpu_wrapper_0_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_cpu_wrapper_0_axi_periph_RVALID = M01_AXI_rvalid[0];
  assign m01_couplers_to_cpu_wrapper_0_axi_periph_WREADY = M01_AXI_wready[0];
  assign m02_couplers_to_cpu_wrapper_0_axi_periph_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_cpu_wrapper_0_axi_periph_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_cpu_wrapper_0_axi_periph_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_cpu_wrapper_0_axi_periph_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_cpu_wrapper_0_axi_periph_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_cpu_wrapper_0_axi_periph_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_cpu_wrapper_0_axi_periph_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_cpu_wrapper_0_axi_periph_WREADY = M02_AXI_wready;
  m00_couplers_imp_1I1UWVY m00_couplers
       (.M_ACLK(cpu_wrapper_0_axi_periph_ACLK_net),
        .M_ARESETN(cpu_wrapper_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_cpu_wrapper_0_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_cpu_wrapper_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_cpu_wrapper_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_cpu_wrapper_0_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_cpu_wrapper_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_cpu_wrapper_0_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_cpu_wrapper_0_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_cpu_wrapper_0_axi_periph_BRESP),
        .M_AXI_bvalid(m00_couplers_to_cpu_wrapper_0_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_cpu_wrapper_0_axi_periph_RDATA),
        .M_AXI_rready(m00_couplers_to_cpu_wrapper_0_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_cpu_wrapper_0_axi_periph_RRESP),
        .M_AXI_rvalid(m00_couplers_to_cpu_wrapper_0_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_cpu_wrapper_0_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_cpu_wrapper_0_axi_periph_WREADY),
        .M_AXI_wstrb(m00_couplers_to_cpu_wrapper_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_cpu_wrapper_0_axi_periph_WVALID),
        .S_ACLK(cpu_wrapper_0_axi_periph_ACLK_net),
        .S_ARESETN(cpu_wrapper_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_OWEHII m01_couplers
       (.M_ACLK(cpu_wrapper_0_axi_periph_ACLK_net),
        .M_ARESETN(cpu_wrapper_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m01_couplers_to_cpu_wrapper_0_axi_periph_ARADDR),
        .M_AXI_arready(m01_couplers_to_cpu_wrapper_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_cpu_wrapper_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_cpu_wrapper_0_axi_periph_AWADDR),
        .M_AXI_awready(m01_couplers_to_cpu_wrapper_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_cpu_wrapper_0_axi_periph_AWVALID),
        .M_AXI_bready(m01_couplers_to_cpu_wrapper_0_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_cpu_wrapper_0_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_cpu_wrapper_0_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_cpu_wrapper_0_axi_periph_RDATA),
        .M_AXI_rready(m01_couplers_to_cpu_wrapper_0_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_cpu_wrapper_0_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_cpu_wrapper_0_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_cpu_wrapper_0_axi_periph_WDATA),
        .M_AXI_wready(m01_couplers_to_cpu_wrapper_0_axi_periph_WREADY),
        .M_AXI_wstrb(m01_couplers_to_cpu_wrapper_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_cpu_wrapper_0_axi_periph_WVALID),
        .S_ACLK(cpu_wrapper_0_axi_periph_ACLK_net),
        .S_ARESETN(cpu_wrapper_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_D4XT07 m02_couplers
       (.M_ACLK(cpu_wrapper_0_axi_periph_ACLK_net),
        .M_ARESETN(cpu_wrapper_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m02_couplers_to_cpu_wrapper_0_axi_periph_ARADDR),
        .M_AXI_arready(m02_couplers_to_cpu_wrapper_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_cpu_wrapper_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_cpu_wrapper_0_axi_periph_AWADDR),
        .M_AXI_awready(m02_couplers_to_cpu_wrapper_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_cpu_wrapper_0_axi_periph_AWVALID),
        .M_AXI_bready(m02_couplers_to_cpu_wrapper_0_axi_periph_BREADY),
        .M_AXI_bresp(m02_couplers_to_cpu_wrapper_0_axi_periph_BRESP),
        .M_AXI_bvalid(m02_couplers_to_cpu_wrapper_0_axi_periph_BVALID),
        .M_AXI_rdata(m02_couplers_to_cpu_wrapper_0_axi_periph_RDATA),
        .M_AXI_rready(m02_couplers_to_cpu_wrapper_0_axi_periph_RREADY),
        .M_AXI_rresp(m02_couplers_to_cpu_wrapper_0_axi_periph_RRESP),
        .M_AXI_rvalid(m02_couplers_to_cpu_wrapper_0_axi_periph_RVALID),
        .M_AXI_wdata(m02_couplers_to_cpu_wrapper_0_axi_periph_WDATA),
        .M_AXI_wready(m02_couplers_to_cpu_wrapper_0_axi_periph_WREADY),
        .M_AXI_wstrb(m02_couplers_to_cpu_wrapper_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_cpu_wrapper_0_axi_periph_WVALID),
        .S_ACLK(cpu_wrapper_0_axi_periph_ACLK_net),
        .S_ARESETN(cpu_wrapper_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m02_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m02_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  s00_couplers_imp_1PBW5FL s00_couplers
       (.M_ACLK(cpu_wrapper_0_axi_periph_ACLK_net),
        .M_ARESETN(cpu_wrapper_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(cpu_wrapper_0_axi_periph_ACLK_net),
        .S_ARESETN(cpu_wrapper_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(cpu_wrapper_0_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arready(cpu_wrapper_0_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arvalid(cpu_wrapper_0_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(cpu_wrapper_0_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awready(cpu_wrapper_0_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awvalid(cpu_wrapper_0_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bready(cpu_wrapper_0_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(cpu_wrapper_0_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(cpu_wrapper_0_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(cpu_wrapper_0_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rready(cpu_wrapper_0_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rvalid(cpu_wrapper_0_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(cpu_wrapper_0_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wready(cpu_wrapper_0_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(cpu_wrapper_0_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(cpu_wrapper_0_axi_periph_to_s00_couplers_WVALID));
  system_design_xbar_1 xbar
       (.aclk(cpu_wrapper_0_axi_periph_ACLK_net),
        .aresetn(cpu_wrapper_0_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m02_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[5:0]}),
        .m_axi_arready({xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m02_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[5:0]}),
        .m_axi_awready({xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule
