//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Mon Jun 24 18:05:31 2024
//Host        : DESKTOP-EJ18JGA running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=13,numReposBlks=8,numNonXlnxBlks=0,numHierBlks=5,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=3,synth_mode=None}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (dip_switches_16bits_tri_i,
    led_16bits_tri_o,
    reset,
    seven_seg_led_an_tri_o,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 dip_switches_16bits TRI_I" *) input [15:0]dip_switches_16bits_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 led_16bits TRI_O" *) output [15:0]led_16bits_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 seven_seg_led_an TRI_O" *) output [3:0]seven_seg_led_an_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN design_1_sys_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart RxD" *) input usb_uart_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart TxD" *) output usb_uart_txd;

  wire [31:0]RISC_V_CPU_0_Data_BRAM_interface_ADDR;
  wire RISC_V_CPU_0_Data_BRAM_interface_CLK;
  wire [31:0]RISC_V_CPU_0_Data_BRAM_interface_DIN;
  wire [31:0]RISC_V_CPU_0_Data_BRAM_interface_DOUT;
  wire RISC_V_CPU_0_Data_BRAM_interface_EN;
  wire [3:0]RISC_V_CPU_0_Data_BRAM_interface_WE;
  wire [31:0]RISC_V_CPU_0_Instruction_BRAM_interface_ADDR;
  wire RISC_V_CPU_0_Instruction_BRAM_interface_CLK;
  wire [31:0]RISC_V_CPU_0_Instruction_BRAM_interface_DIN;
  wire [31:0]RISC_V_CPU_0_Instruction_BRAM_interface_DOUT;
  wire [3:0]RISC_V_CPU_0_Instruction_BRAM_interface_WE;
  wire [31:0]RISC_V_CPU_0_axi_periph_M00_AXI_ARADDR;
  wire RISC_V_CPU_0_axi_periph_M00_AXI_ARREADY;
  wire [0:0]RISC_V_CPU_0_axi_periph_M00_AXI_ARVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_M00_AXI_AWADDR;
  wire RISC_V_CPU_0_axi_periph_M00_AXI_AWREADY;
  wire [0:0]RISC_V_CPU_0_axi_periph_M00_AXI_AWVALID;
  wire [0:0]RISC_V_CPU_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]RISC_V_CPU_0_axi_periph_M00_AXI_BRESP;
  wire RISC_V_CPU_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_M00_AXI_RDATA;
  wire [0:0]RISC_V_CPU_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]RISC_V_CPU_0_axi_periph_M00_AXI_RRESP;
  wire RISC_V_CPU_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_M00_AXI_WDATA;
  wire RISC_V_CPU_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]RISC_V_CPU_0_axi_periph_M00_AXI_WSTRB;
  wire [0:0]RISC_V_CPU_0_axi_periph_M00_AXI_WVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_M01_AXI_ARADDR;
  wire RISC_V_CPU_0_axi_periph_M01_AXI_ARREADY;
  wire [0:0]RISC_V_CPU_0_axi_periph_M01_AXI_ARVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_M01_AXI_AWADDR;
  wire RISC_V_CPU_0_axi_periph_M01_AXI_AWREADY;
  wire [0:0]RISC_V_CPU_0_axi_periph_M01_AXI_AWVALID;
  wire [0:0]RISC_V_CPU_0_axi_periph_M01_AXI_BREADY;
  wire [1:0]RISC_V_CPU_0_axi_periph_M01_AXI_BRESP;
  wire RISC_V_CPU_0_axi_periph_M01_AXI_BVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_M01_AXI_RDATA;
  wire [0:0]RISC_V_CPU_0_axi_periph_M01_AXI_RREADY;
  wire [1:0]RISC_V_CPU_0_axi_periph_M01_AXI_RRESP;
  wire RISC_V_CPU_0_axi_periph_M01_AXI_RVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_M01_AXI_WDATA;
  wire RISC_V_CPU_0_axi_periph_M01_AXI_WREADY;
  wire [3:0]RISC_V_CPU_0_axi_periph_M01_AXI_WSTRB;
  wire [0:0]RISC_V_CPU_0_axi_periph_M01_AXI_WVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_M02_AXI_ARADDR;
  wire RISC_V_CPU_0_axi_periph_M02_AXI_ARREADY;
  wire [0:0]RISC_V_CPU_0_axi_periph_M02_AXI_ARVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_M02_AXI_AWADDR;
  wire RISC_V_CPU_0_axi_periph_M02_AXI_AWREADY;
  wire [0:0]RISC_V_CPU_0_axi_periph_M02_AXI_AWVALID;
  wire [0:0]RISC_V_CPU_0_axi_periph_M02_AXI_BREADY;
  wire [1:0]RISC_V_CPU_0_axi_periph_M02_AXI_BRESP;
  wire RISC_V_CPU_0_axi_periph_M02_AXI_BVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_M02_AXI_RDATA;
  wire [0:0]RISC_V_CPU_0_axi_periph_M02_AXI_RREADY;
  wire [1:0]RISC_V_CPU_0_axi_periph_M02_AXI_RRESP;
  wire RISC_V_CPU_0_axi_periph_M02_AXI_RVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_M02_AXI_WDATA;
  wire RISC_V_CPU_0_axi_periph_M02_AXI_WREADY;
  wire [3:0]RISC_V_CPU_0_axi_periph_M02_AXI_WSTRB;
  wire [0:0]RISC_V_CPU_0_axi_periph_M02_AXI_WVALID;
  wire [31:0]RISC_V_CPU_0_m_axi_ARADDR;
  wire [0:0]RISC_V_CPU_0_m_axi_ARREADY;
  wire RISC_V_CPU_0_m_axi_ARVALID;
  wire [31:0]RISC_V_CPU_0_m_axi_AWADDR;
  wire [0:0]RISC_V_CPU_0_m_axi_AWREADY;
  wire RISC_V_CPU_0_m_axi_AWVALID;
  wire RISC_V_CPU_0_m_axi_BREADY;
  wire [1:0]RISC_V_CPU_0_m_axi_BRESP;
  wire [0:0]RISC_V_CPU_0_m_axi_BVALID;
  wire [31:0]RISC_V_CPU_0_m_axi_RDATA;
  wire RISC_V_CPU_0_m_axi_RREADY;
  wire [0:0]RISC_V_CPU_0_m_axi_RVALID;
  wire [31:0]RISC_V_CPU_0_m_axi_WDATA;
  wire [0:0]RISC_V_CPU_0_m_axi_WREADY;
  wire [3:0]RISC_V_CPU_0_m_axi_WSTRB;
  wire RISC_V_CPU_0_m_axi_WVALID;
  wire [15:0]axi_gpio_0_GPIO2_TRI_I;
  wire [15:0]axi_gpio_0_GPIO_TRI_O;
  wire [3:0]axi_gpio_1_GPIO_TRI_O;
  wire axi_uartlite_0_UART_RxD;
  wire axi_uartlite_0_UART_TxD;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_locked;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire reset_1;
  wire sys_clock_1;

  assign axi_gpio_0_GPIO2_TRI_I = dip_switches_16bits_tri_i[15:0];
  assign axi_uartlite_0_UART_RxD = usb_uart_rxd;
  assign led_16bits_tri_o[15:0] = axi_gpio_0_GPIO_TRI_O;
  assign reset_1 = reset;
  assign seven_seg_led_an_tri_o[3:0] = axi_gpio_1_GPIO_TRI_O;
  assign sys_clock_1 = sys_clock;
  assign usb_uart_txd = axi_uartlite_0_UART_TxD;
  design_1_RISC_V_CPU_0_0 RISC_V_CPU_0
       (.aclk(clk_wiz_0_clk_out1),
        .addr_data(RISC_V_CPU_0_Data_BRAM_interface_ADDR),
        .addr_inst(RISC_V_CPU_0_Instruction_BRAM_interface_ADDR),
        .aresetn(proc_sys_reset_0_peripheral_aresetn),
        .clk_data(RISC_V_CPU_0_Data_BRAM_interface_CLK),
        .clk_inst(RISC_V_CPU_0_Instruction_BRAM_interface_CLK),
        .data_in_data(RISC_V_CPU_0_Data_BRAM_interface_DOUT),
        .data_in_inst(RISC_V_CPU_0_Instruction_BRAM_interface_DOUT),
        .data_out_data(RISC_V_CPU_0_Data_BRAM_interface_DIN),
        .data_out_inst(RISC_V_CPU_0_Instruction_BRAM_interface_DIN),
        .en_data(RISC_V_CPU_0_Data_BRAM_interface_EN),
        .m_axi_araddr(RISC_V_CPU_0_m_axi_ARADDR),
        .m_axi_arready(RISC_V_CPU_0_m_axi_ARREADY),
        .m_axi_arvalid(RISC_V_CPU_0_m_axi_ARVALID),
        .m_axi_awaddr(RISC_V_CPU_0_m_axi_AWADDR),
        .m_axi_awready(RISC_V_CPU_0_m_axi_AWREADY),
        .m_axi_awvalid(RISC_V_CPU_0_m_axi_AWVALID),
        .m_axi_bready(RISC_V_CPU_0_m_axi_BREADY),
        .m_axi_bresp(RISC_V_CPU_0_m_axi_BRESP[0]),
        .m_axi_bvalid(RISC_V_CPU_0_m_axi_BVALID),
        .m_axi_rdata(RISC_V_CPU_0_m_axi_RDATA),
        .m_axi_rready(RISC_V_CPU_0_m_axi_RREADY),
        .m_axi_rvalid(RISC_V_CPU_0_m_axi_RVALID),
        .m_axi_wdata(RISC_V_CPU_0_m_axi_WDATA),
        .m_axi_wready(RISC_V_CPU_0_m_axi_WREADY),
        .m_axi_wstrb(RISC_V_CPU_0_m_axi_WSTRB),
        .m_axi_wvalid(RISC_V_CPU_0_m_axi_WVALID),
        .we_data(RISC_V_CPU_0_Data_BRAM_interface_WE),
        .we_inst(RISC_V_CPU_0_Instruction_BRAM_interface_WE));
  design_1_RISC_V_CPU_0_axi_periph_0 RISC_V_CPU_0_axi_periph
       (.ACLK(clk_wiz_0_clk_out1),
        .ARESETN(proc_sys_reset_0_peripheral_aresetn),
        .M00_ACLK(clk_wiz_0_clk_out1),
        .M00_ARESETN(proc_sys_reset_0_peripheral_aresetn),
        .M00_AXI_araddr(RISC_V_CPU_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(RISC_V_CPU_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(RISC_V_CPU_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(RISC_V_CPU_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(RISC_V_CPU_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(RISC_V_CPU_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(RISC_V_CPU_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(RISC_V_CPU_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(RISC_V_CPU_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(RISC_V_CPU_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(RISC_V_CPU_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(RISC_V_CPU_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(RISC_V_CPU_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(RISC_V_CPU_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(RISC_V_CPU_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(RISC_V_CPU_0_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(RISC_V_CPU_0_axi_periph_M00_AXI_WVALID),
        .M01_ACLK(clk_wiz_0_clk_out1),
        .M01_ARESETN(proc_sys_reset_0_peripheral_aresetn),
        .M01_AXI_araddr(RISC_V_CPU_0_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(RISC_V_CPU_0_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(RISC_V_CPU_0_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(RISC_V_CPU_0_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(RISC_V_CPU_0_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(RISC_V_CPU_0_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(RISC_V_CPU_0_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(RISC_V_CPU_0_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(RISC_V_CPU_0_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(RISC_V_CPU_0_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(RISC_V_CPU_0_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(RISC_V_CPU_0_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(RISC_V_CPU_0_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(RISC_V_CPU_0_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(RISC_V_CPU_0_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wstrb(RISC_V_CPU_0_axi_periph_M01_AXI_WSTRB),
        .M01_AXI_wvalid(RISC_V_CPU_0_axi_periph_M01_AXI_WVALID),
        .M02_ACLK(clk_wiz_0_clk_out1),
        .M02_ARESETN(proc_sys_reset_0_peripheral_aresetn),
        .M02_AXI_araddr(RISC_V_CPU_0_axi_periph_M02_AXI_ARADDR),
        .M02_AXI_arready(RISC_V_CPU_0_axi_periph_M02_AXI_ARREADY),
        .M02_AXI_arvalid(RISC_V_CPU_0_axi_periph_M02_AXI_ARVALID),
        .M02_AXI_awaddr(RISC_V_CPU_0_axi_periph_M02_AXI_AWADDR),
        .M02_AXI_awready(RISC_V_CPU_0_axi_periph_M02_AXI_AWREADY),
        .M02_AXI_awvalid(RISC_V_CPU_0_axi_periph_M02_AXI_AWVALID),
        .M02_AXI_bready(RISC_V_CPU_0_axi_periph_M02_AXI_BREADY),
        .M02_AXI_bresp(RISC_V_CPU_0_axi_periph_M02_AXI_BRESP),
        .M02_AXI_bvalid(RISC_V_CPU_0_axi_periph_M02_AXI_BVALID),
        .M02_AXI_rdata(RISC_V_CPU_0_axi_periph_M02_AXI_RDATA),
        .M02_AXI_rready(RISC_V_CPU_0_axi_periph_M02_AXI_RREADY),
        .M02_AXI_rresp(RISC_V_CPU_0_axi_periph_M02_AXI_RRESP),
        .M02_AXI_rvalid(RISC_V_CPU_0_axi_periph_M02_AXI_RVALID),
        .M02_AXI_wdata(RISC_V_CPU_0_axi_periph_M02_AXI_WDATA),
        .M02_AXI_wready(RISC_V_CPU_0_axi_periph_M02_AXI_WREADY),
        .M02_AXI_wstrb(RISC_V_CPU_0_axi_periph_M02_AXI_WSTRB),
        .M02_AXI_wvalid(RISC_V_CPU_0_axi_periph_M02_AXI_WVALID),
        .S00_ACLK(clk_wiz_0_clk_out1),
        .S00_ARESETN(proc_sys_reset_0_peripheral_aresetn),
        .S00_AXI_araddr(RISC_V_CPU_0_m_axi_ARADDR),
        .S00_AXI_arready(RISC_V_CPU_0_m_axi_ARREADY),
        .S00_AXI_arvalid(RISC_V_CPU_0_m_axi_ARVALID),
        .S00_AXI_awaddr(RISC_V_CPU_0_m_axi_AWADDR),
        .S00_AXI_awready(RISC_V_CPU_0_m_axi_AWREADY),
        .S00_AXI_awvalid(RISC_V_CPU_0_m_axi_AWVALID),
        .S00_AXI_bready(RISC_V_CPU_0_m_axi_BREADY),
        .S00_AXI_bresp(RISC_V_CPU_0_m_axi_BRESP),
        .S00_AXI_bvalid(RISC_V_CPU_0_m_axi_BVALID),
        .S00_AXI_rdata(RISC_V_CPU_0_m_axi_RDATA),
        .S00_AXI_rready(RISC_V_CPU_0_m_axi_RREADY),
        .S00_AXI_rvalid(RISC_V_CPU_0_m_axi_RVALID),
        .S00_AXI_wdata(RISC_V_CPU_0_m_axi_WDATA),
        .S00_AXI_wready(RISC_V_CPU_0_m_axi_WREADY),
        .S00_AXI_wstrb(RISC_V_CPU_0_m_axi_WSTRB),
        .S00_AXI_wvalid(RISC_V_CPU_0_m_axi_WVALID));
  design_1_axi_gpio_0_0 axi_gpio_0
       (.gpio2_io_i(axi_gpio_0_GPIO2_TRI_I),
        .gpio_io_o(axi_gpio_0_GPIO_TRI_O),
        .s_axi_aclk(clk_wiz_0_clk_out1),
        .s_axi_araddr(RISC_V_CPU_0_axi_periph_M00_AXI_ARADDR[8:0]),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arready(RISC_V_CPU_0_axi_periph_M00_AXI_ARREADY),
        .s_axi_arvalid(RISC_V_CPU_0_axi_periph_M00_AXI_ARVALID),
        .s_axi_awaddr(RISC_V_CPU_0_axi_periph_M00_AXI_AWADDR[8:0]),
        .s_axi_awready(RISC_V_CPU_0_axi_periph_M00_AXI_AWREADY),
        .s_axi_awvalid(RISC_V_CPU_0_axi_periph_M00_AXI_AWVALID),
        .s_axi_bready(RISC_V_CPU_0_axi_periph_M00_AXI_BREADY),
        .s_axi_bresp(RISC_V_CPU_0_axi_periph_M00_AXI_BRESP),
        .s_axi_bvalid(RISC_V_CPU_0_axi_periph_M00_AXI_BVALID),
        .s_axi_rdata(RISC_V_CPU_0_axi_periph_M00_AXI_RDATA),
        .s_axi_rready(RISC_V_CPU_0_axi_periph_M00_AXI_RREADY),
        .s_axi_rresp(RISC_V_CPU_0_axi_periph_M00_AXI_RRESP),
        .s_axi_rvalid(RISC_V_CPU_0_axi_periph_M00_AXI_RVALID),
        .s_axi_wdata(RISC_V_CPU_0_axi_periph_M00_AXI_WDATA),
        .s_axi_wready(RISC_V_CPU_0_axi_periph_M00_AXI_WREADY),
        .s_axi_wstrb(RISC_V_CPU_0_axi_periph_M00_AXI_WSTRB),
        .s_axi_wvalid(RISC_V_CPU_0_axi_periph_M00_AXI_WVALID));
  design_1_axi_gpio_1_0 axi_gpio_1
       (.gpio_io_o(axi_gpio_1_GPIO_TRI_O),
        .s_axi_aclk(clk_wiz_0_clk_out1),
        .s_axi_araddr(RISC_V_CPU_0_axi_periph_M01_AXI_ARADDR[8:0]),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arready(RISC_V_CPU_0_axi_periph_M01_AXI_ARREADY),
        .s_axi_arvalid(RISC_V_CPU_0_axi_periph_M01_AXI_ARVALID),
        .s_axi_awaddr(RISC_V_CPU_0_axi_periph_M01_AXI_AWADDR[8:0]),
        .s_axi_awready(RISC_V_CPU_0_axi_periph_M01_AXI_AWREADY),
        .s_axi_awvalid(RISC_V_CPU_0_axi_periph_M01_AXI_AWVALID),
        .s_axi_bready(RISC_V_CPU_0_axi_periph_M01_AXI_BREADY),
        .s_axi_bresp(RISC_V_CPU_0_axi_periph_M01_AXI_BRESP),
        .s_axi_bvalid(RISC_V_CPU_0_axi_periph_M01_AXI_BVALID),
        .s_axi_rdata(RISC_V_CPU_0_axi_periph_M01_AXI_RDATA),
        .s_axi_rready(RISC_V_CPU_0_axi_periph_M01_AXI_RREADY),
        .s_axi_rresp(RISC_V_CPU_0_axi_periph_M01_AXI_RRESP),
        .s_axi_rvalid(RISC_V_CPU_0_axi_periph_M01_AXI_RVALID),
        .s_axi_wdata(RISC_V_CPU_0_axi_periph_M01_AXI_WDATA),
        .s_axi_wready(RISC_V_CPU_0_axi_periph_M01_AXI_WREADY),
        .s_axi_wstrb(RISC_V_CPU_0_axi_periph_M01_AXI_WSTRB),
        .s_axi_wvalid(RISC_V_CPU_0_axi_periph_M01_AXI_WVALID));
  design_1_axi_uartlite_0_0 axi_uartlite_0
       (.rx(axi_uartlite_0_UART_RxD),
        .s_axi_aclk(clk_wiz_0_clk_out1),
        .s_axi_araddr(RISC_V_CPU_0_axi_periph_M02_AXI_ARADDR[3:0]),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arready(RISC_V_CPU_0_axi_periph_M02_AXI_ARREADY),
        .s_axi_arvalid(RISC_V_CPU_0_axi_periph_M02_AXI_ARVALID),
        .s_axi_awaddr(RISC_V_CPU_0_axi_periph_M02_AXI_AWADDR[3:0]),
        .s_axi_awready(RISC_V_CPU_0_axi_periph_M02_AXI_AWREADY),
        .s_axi_awvalid(RISC_V_CPU_0_axi_periph_M02_AXI_AWVALID),
        .s_axi_bready(RISC_V_CPU_0_axi_periph_M02_AXI_BREADY),
        .s_axi_bresp(RISC_V_CPU_0_axi_periph_M02_AXI_BRESP),
        .s_axi_bvalid(RISC_V_CPU_0_axi_periph_M02_AXI_BVALID),
        .s_axi_rdata(RISC_V_CPU_0_axi_periph_M02_AXI_RDATA),
        .s_axi_rready(RISC_V_CPU_0_axi_periph_M02_AXI_RREADY),
        .s_axi_rresp(RISC_V_CPU_0_axi_periph_M02_AXI_RRESP),
        .s_axi_rvalid(RISC_V_CPU_0_axi_periph_M02_AXI_RVALID),
        .s_axi_wdata(RISC_V_CPU_0_axi_periph_M02_AXI_WDATA),
        .s_axi_wready(RISC_V_CPU_0_axi_periph_M02_AXI_WREADY),
        .s_axi_wstrb(RISC_V_CPU_0_axi_periph_M02_AXI_WSTRB),
        .s_axi_wvalid(RISC_V_CPU_0_axi_periph_M02_AXI_WVALID),
        .tx(axi_uartlite_0_UART_TxD));
  design_1_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(RISC_V_CPU_0_Instruction_BRAM_interface_ADDR[12:0]),
        .addrb(RISC_V_CPU_0_Data_BRAM_interface_ADDR[12:0]),
        .clka(RISC_V_CPU_0_Instruction_BRAM_interface_CLK),
        .clkb(RISC_V_CPU_0_Data_BRAM_interface_CLK),
        .dina(RISC_V_CPU_0_Instruction_BRAM_interface_DIN),
        .dinb(RISC_V_CPU_0_Data_BRAM_interface_DIN),
        .douta(RISC_V_CPU_0_Instruction_BRAM_interface_DOUT),
        .doutb(RISC_V_CPU_0_Data_BRAM_interface_DOUT),
        .enb(RISC_V_CPU_0_Data_BRAM_interface_EN),
        .wea(RISC_V_CPU_0_Instruction_BRAM_interface_WE),
        .web(RISC_V_CPU_0_Data_BRAM_interface_WE));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clock_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .locked(clk_wiz_0_locked),
        .reset(reset_1));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(reset_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
endmodule

module design_1_RISC_V_CPU_0_axi_periph_0
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
  output [31:0]M02_AXI_araddr;
  input [0:0]M02_AXI_arready;
  output [0:0]M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input [0:0]M02_AXI_awready;
  output [0:0]M02_AXI_awvalid;
  output [0:0]M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input [0:0]M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output [0:0]M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input [0:0]M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input [0:0]M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output [0:0]M02_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  output [0:0]S00_AXI_arready;
  input [0:0]S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  output [0:0]S00_AXI_awready;
  input [0:0]S00_AXI_awvalid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input [0:0]S00_AXI_rready;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;

  wire RISC_V_CPU_0_axi_periph_ACLK_net;
  wire RISC_V_CPU_0_axi_periph_ARESETN_net;
  wire [31:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_ARADDR;
  wire [0:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_ARREADY;
  wire [0:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_AWADDR;
  wire [0:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_AWREADY;
  wire [0:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_AWVALID;
  wire [0:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_BRESP;
  wire [0:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_RDATA;
  wire [0:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_RREADY;
  wire [0:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_WDATA;
  wire [0:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_WSTRB;
  wire [0:0]RISC_V_CPU_0_axi_periph_to_s00_couplers_WVALID;
  wire [31:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_ARADDR;
  wire [0:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_ARREADY;
  wire [0:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_ARVALID;
  wire [31:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_AWADDR;
  wire [0:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_AWREADY;
  wire [0:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_AWVALID;
  wire [0:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_BRESP;
  wire [0:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_RDATA;
  wire [0:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_RRESP;
  wire [0:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_RVALID;
  wire [31:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_WDATA;
  wire [0:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_WREADY;
  wire [3:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_WSTRB;
  wire [0:0]m00_couplers_to_RISC_V_CPU_0_axi_periph_WVALID;
  wire [31:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_ARADDR;
  wire [0:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_ARREADY;
  wire [0:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_ARVALID;
  wire [31:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_AWADDR;
  wire [0:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_AWREADY;
  wire [0:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_AWVALID;
  wire [0:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_BRESP;
  wire [0:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_RDATA;
  wire [0:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_RRESP;
  wire [0:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_WDATA;
  wire [0:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_WREADY;
  wire [3:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_WSTRB;
  wire [0:0]m01_couplers_to_RISC_V_CPU_0_axi_periph_WVALID;
  wire [31:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_ARADDR;
  wire [0:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_ARREADY;
  wire [0:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_ARVALID;
  wire [31:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_AWADDR;
  wire [0:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_AWREADY;
  wire [0:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_AWVALID;
  wire [0:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_BREADY;
  wire [1:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_BRESP;
  wire [0:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_BVALID;
  wire [31:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_RDATA;
  wire [0:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_RREADY;
  wire [1:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_RRESP;
  wire [0:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_RVALID;
  wire [31:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_WDATA;
  wire [0:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_WREADY;
  wire [3:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_WSTRB;
  wire [0:0]m02_couplers_to_RISC_V_CPU_0_axi_periph_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [0:0]s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [0:0]s00_couplers_to_xbar_AWVALID;
  wire [0:0]s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RREADY;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire [0:0]s00_couplers_to_xbar_WVALID;
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
  wire [0:0]xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [0:0]xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire [0:0]xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire [0:0]xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire [0:0]xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;

  assign M00_AXI_araddr[31:0] = m00_couplers_to_RISC_V_CPU_0_axi_periph_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_RISC_V_CPU_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_RISC_V_CPU_0_axi_periph_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_RISC_V_CPU_0_axi_periph_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_RISC_V_CPU_0_axi_periph_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_RISC_V_CPU_0_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_RISC_V_CPU_0_axi_periph_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_RISC_V_CPU_0_axi_periph_WSTRB;
  assign M00_AXI_wvalid[0] = m00_couplers_to_RISC_V_CPU_0_axi_periph_WVALID;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_RISC_V_CPU_0_axi_periph_ARADDR;
  assign M01_AXI_arvalid[0] = m01_couplers_to_RISC_V_CPU_0_axi_periph_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_RISC_V_CPU_0_axi_periph_AWADDR;
  assign M01_AXI_awvalid[0] = m01_couplers_to_RISC_V_CPU_0_axi_periph_AWVALID;
  assign M01_AXI_bready[0] = m01_couplers_to_RISC_V_CPU_0_axi_periph_BREADY;
  assign M01_AXI_rready[0] = m01_couplers_to_RISC_V_CPU_0_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_RISC_V_CPU_0_axi_periph_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_RISC_V_CPU_0_axi_periph_WSTRB;
  assign M01_AXI_wvalid[0] = m01_couplers_to_RISC_V_CPU_0_axi_periph_WVALID;
  assign M02_AXI_araddr[31:0] = m02_couplers_to_RISC_V_CPU_0_axi_periph_ARADDR;
  assign M02_AXI_arvalid[0] = m02_couplers_to_RISC_V_CPU_0_axi_periph_ARVALID;
  assign M02_AXI_awaddr[31:0] = m02_couplers_to_RISC_V_CPU_0_axi_periph_AWADDR;
  assign M02_AXI_awvalid[0] = m02_couplers_to_RISC_V_CPU_0_axi_periph_AWVALID;
  assign M02_AXI_bready[0] = m02_couplers_to_RISC_V_CPU_0_axi_periph_BREADY;
  assign M02_AXI_rready[0] = m02_couplers_to_RISC_V_CPU_0_axi_periph_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_RISC_V_CPU_0_axi_periph_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_RISC_V_CPU_0_axi_periph_WSTRB;
  assign M02_AXI_wvalid[0] = m02_couplers_to_RISC_V_CPU_0_axi_periph_WVALID;
  assign RISC_V_CPU_0_axi_periph_ACLK_net = ACLK;
  assign RISC_V_CPU_0_axi_periph_ARESETN_net = ARESETN;
  assign RISC_V_CPU_0_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign RISC_V_CPU_0_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid[0];
  assign RISC_V_CPU_0_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign RISC_V_CPU_0_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid[0];
  assign RISC_V_CPU_0_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready[0];
  assign RISC_V_CPU_0_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready[0];
  assign RISC_V_CPU_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign RISC_V_CPU_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign RISC_V_CPU_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid[0];
  assign S00_AXI_arready[0] = RISC_V_CPU_0_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready[0] = RISC_V_CPU_0_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = RISC_V_CPU_0_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid[0] = RISC_V_CPU_0_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = RISC_V_CPU_0_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rvalid[0] = RISC_V_CPU_0_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready[0] = RISC_V_CPU_0_axi_periph_to_s00_couplers_WREADY;
  assign m00_couplers_to_RISC_V_CPU_0_axi_periph_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_RISC_V_CPU_0_axi_periph_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_RISC_V_CPU_0_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_RISC_V_CPU_0_axi_periph_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_RISC_V_CPU_0_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_RISC_V_CPU_0_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_RISC_V_CPU_0_axi_periph_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_RISC_V_CPU_0_axi_periph_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_RISC_V_CPU_0_axi_periph_ARREADY = M01_AXI_arready[0];
  assign m01_couplers_to_RISC_V_CPU_0_axi_periph_AWREADY = M01_AXI_awready[0];
  assign m01_couplers_to_RISC_V_CPU_0_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_RISC_V_CPU_0_axi_periph_BVALID = M01_AXI_bvalid[0];
  assign m01_couplers_to_RISC_V_CPU_0_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_RISC_V_CPU_0_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_RISC_V_CPU_0_axi_periph_RVALID = M01_AXI_rvalid[0];
  assign m01_couplers_to_RISC_V_CPU_0_axi_periph_WREADY = M01_AXI_wready[0];
  assign m02_couplers_to_RISC_V_CPU_0_axi_periph_ARREADY = M02_AXI_arready[0];
  assign m02_couplers_to_RISC_V_CPU_0_axi_periph_AWREADY = M02_AXI_awready[0];
  assign m02_couplers_to_RISC_V_CPU_0_axi_periph_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_RISC_V_CPU_0_axi_periph_BVALID = M02_AXI_bvalid[0];
  assign m02_couplers_to_RISC_V_CPU_0_axi_periph_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_RISC_V_CPU_0_axi_periph_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_RISC_V_CPU_0_axi_periph_RVALID = M02_AXI_rvalid[0];
  assign m02_couplers_to_RISC_V_CPU_0_axi_periph_WREADY = M02_AXI_wready[0];
  m00_couplers_imp_73LXKO m00_couplers
       (.M_ACLK(RISC_V_CPU_0_axi_periph_ACLK_net),
        .M_ARESETN(RISC_V_CPU_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_RISC_V_CPU_0_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_RISC_V_CPU_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_RISC_V_CPU_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_RISC_V_CPU_0_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_RISC_V_CPU_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_RISC_V_CPU_0_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_RISC_V_CPU_0_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_RISC_V_CPU_0_axi_periph_BRESP),
        .M_AXI_bvalid(m00_couplers_to_RISC_V_CPU_0_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_RISC_V_CPU_0_axi_periph_RDATA),
        .M_AXI_rready(m00_couplers_to_RISC_V_CPU_0_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_RISC_V_CPU_0_axi_periph_RRESP),
        .M_AXI_rvalid(m00_couplers_to_RISC_V_CPU_0_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_RISC_V_CPU_0_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_RISC_V_CPU_0_axi_periph_WREADY),
        .M_AXI_wstrb(m00_couplers_to_RISC_V_CPU_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_RISC_V_CPU_0_axi_periph_WVALID),
        .S_ACLK(RISC_V_CPU_0_axi_periph_ACLK_net),
        .S_ARESETN(RISC_V_CPU_0_axi_periph_ARESETN_net),
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
  m01_couplers_imp_1WGVU8P m01_couplers
       (.M_ACLK(RISC_V_CPU_0_axi_periph_ACLK_net),
        .M_ARESETN(RISC_V_CPU_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m01_couplers_to_RISC_V_CPU_0_axi_periph_ARADDR),
        .M_AXI_arready(m01_couplers_to_RISC_V_CPU_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_RISC_V_CPU_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_RISC_V_CPU_0_axi_periph_AWADDR),
        .M_AXI_awready(m01_couplers_to_RISC_V_CPU_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_RISC_V_CPU_0_axi_periph_AWVALID),
        .M_AXI_bready(m01_couplers_to_RISC_V_CPU_0_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_RISC_V_CPU_0_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_RISC_V_CPU_0_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_RISC_V_CPU_0_axi_periph_RDATA),
        .M_AXI_rready(m01_couplers_to_RISC_V_CPU_0_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_RISC_V_CPU_0_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_RISC_V_CPU_0_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_RISC_V_CPU_0_axi_periph_WDATA),
        .M_AXI_wready(m01_couplers_to_RISC_V_CPU_0_axi_periph_WREADY),
        .M_AXI_wstrb(m01_couplers_to_RISC_V_CPU_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_RISC_V_CPU_0_axi_periph_WVALID),
        .S_ACLK(RISC_V_CPU_0_axi_periph_ACLK_net),
        .S_ARESETN(RISC_V_CPU_0_axi_periph_ARESETN_net),
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
  m02_couplers_imp_7UA663 m02_couplers
       (.M_ACLK(RISC_V_CPU_0_axi_periph_ACLK_net),
        .M_ARESETN(RISC_V_CPU_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m02_couplers_to_RISC_V_CPU_0_axi_periph_ARADDR),
        .M_AXI_arready(m02_couplers_to_RISC_V_CPU_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_RISC_V_CPU_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_RISC_V_CPU_0_axi_periph_AWADDR),
        .M_AXI_awready(m02_couplers_to_RISC_V_CPU_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_RISC_V_CPU_0_axi_periph_AWVALID),
        .M_AXI_bready(m02_couplers_to_RISC_V_CPU_0_axi_periph_BREADY),
        .M_AXI_bresp(m02_couplers_to_RISC_V_CPU_0_axi_periph_BRESP),
        .M_AXI_bvalid(m02_couplers_to_RISC_V_CPU_0_axi_periph_BVALID),
        .M_AXI_rdata(m02_couplers_to_RISC_V_CPU_0_axi_periph_RDATA),
        .M_AXI_rready(m02_couplers_to_RISC_V_CPU_0_axi_periph_RREADY),
        .M_AXI_rresp(m02_couplers_to_RISC_V_CPU_0_axi_periph_RRESP),
        .M_AXI_rvalid(m02_couplers_to_RISC_V_CPU_0_axi_periph_RVALID),
        .M_AXI_wdata(m02_couplers_to_RISC_V_CPU_0_axi_periph_WDATA),
        .M_AXI_wready(m02_couplers_to_RISC_V_CPU_0_axi_periph_WREADY),
        .M_AXI_wstrb(m02_couplers_to_RISC_V_CPU_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_RISC_V_CPU_0_axi_periph_WVALID),
        .S_ACLK(RISC_V_CPU_0_axi_periph_ACLK_net),
        .S_ARESETN(RISC_V_CPU_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
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
  s00_couplers_imp_1QC16RE s00_couplers
       (.M_ACLK(RISC_V_CPU_0_axi_periph_ACLK_net),
        .M_ARESETN(RISC_V_CPU_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(RISC_V_CPU_0_axi_periph_ACLK_net),
        .S_ARESETN(RISC_V_CPU_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(RISC_V_CPU_0_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arready(RISC_V_CPU_0_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arvalid(RISC_V_CPU_0_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(RISC_V_CPU_0_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awready(RISC_V_CPU_0_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awvalid(RISC_V_CPU_0_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bready(RISC_V_CPU_0_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(RISC_V_CPU_0_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(RISC_V_CPU_0_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(RISC_V_CPU_0_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rready(RISC_V_CPU_0_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rvalid(RISC_V_CPU_0_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(RISC_V_CPU_0_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wready(RISC_V_CPU_0_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(RISC_V_CPU_0_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(RISC_V_CPU_0_axi_periph_to_s00_couplers_WVALID));
  design_1_xbar_0 xbar
       (.aclk(RISC_V_CPU_0_axi_periph_ACLK_net),
        .aresetn(RISC_V_CPU_0_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arready({xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
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
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module m00_couplers_imp_73LXKO
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

module m01_couplers_imp_1WGVU8P
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

module m02_couplers_imp_7UA663
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

  wire [31:0]m02_couplers_to_m02_couplers_ARADDR;
  wire [0:0]m02_couplers_to_m02_couplers_ARREADY;
  wire [0:0]m02_couplers_to_m02_couplers_ARVALID;
  wire [31:0]m02_couplers_to_m02_couplers_AWADDR;
  wire [0:0]m02_couplers_to_m02_couplers_AWREADY;
  wire [0:0]m02_couplers_to_m02_couplers_AWVALID;
  wire [0:0]m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire [0:0]m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire [0:0]m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire [0:0]m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire [0:0]m02_couplers_to_m02_couplers_WREADY;
  wire [3:0]m02_couplers_to_m02_couplers_WSTRB;
  wire [0:0]m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready[0] = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready[0] = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m02_couplers_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready[0] = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready[0] = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid[0] = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid[0] = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready[0] = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready[0];
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid[0];
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready[0];
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid[0];
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready[0];
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid[0];
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready[0];
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid[0];
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready[0];
  assign m02_couplers_to_m02_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module s00_couplers_imp_1QC16RE
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
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [0:0]s00_couplers_to_s00_couplers_ARREADY;
  wire [0:0]s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [0:0]s00_couplers_to_s00_couplers_AWREADY;
  wire [0:0]s00_couplers_to_s00_couplers_AWVALID;
  wire [0:0]s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire [0:0]s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [0:0]s00_couplers_to_s00_couplers_RREADY;
  wire [0:0]s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire [0:0]s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire [0:0]s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arvalid[0] = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awvalid[0] = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready[0] = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready[0] = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready[0] = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready[0] = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid[0] = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rvalid[0] = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready[0] = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready[0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid[0];
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready[0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid[0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready[0];
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid[0];
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready[0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid[0];
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready[0];
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid[0];
endmodule
