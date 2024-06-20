`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 12:46:30 AM
// Design Name: 
// Module Name: cpu_wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cpu_wrapper#(
    parameter_instruction_space = 32'h0000_ffff
)(
    //clocking
    input aclk,
    input aresetn,
    //instruction port
    output [31:0] addr_inst,
    output [31:0] data_out_inst,
    input [31:0] data_in_inst,
    output  en_inst,
    output [3:0] we_inst,
    //data port
    output [31:0] addr_data,
    output [31:0] data_out_data,
    input [31:0] data_in_data,
    output en_data,
    output [3:0] we_data,
        //AXI data port
        //AXI data write address port
        output [31:0] m_axi_awaddr,
        output        m_axi_awvalid,
        input         m_axi_awready,
        //AXI data write data port
        output [31:0] m_axi_wdata,
        output  [3:0] m_axi_wstrb,
        output        m_axi_wvalid,
        input         m_axi_wready,
        //AXI data write resp port
        input         m_axi_bresp,
        output        m_axi_bready,
        input         m_axi_bvalid,
        //AXI data read address port
        output [31:0] m_axi_araddr,
        output        m_axi_arvalid,
        input         m_axi_arready,
        //AXI data read data port
        input [31:0] m_axi_rdata,
        input         m_axi_rvalid,
        output        m_axi_rready
    
    );
    
    cpu_top#(
        parameter_instruction_space
    ) cpu_inst(
        aclk,
        aresetn,
        addr_inst,
        data_out_inst,
        data_in_inst,
        en_inst,
        we_inst,
        addr_data,
        data_out_data,
        data_in_data,
        en_data,
        we_data,
        m_axi_awaddr,
        m_axi_awvalid,
        m_axi_awready,
        //AXI data write data port
        m_axi_wdata,
        m_axi_wstrb,
        m_axi_wvalid,
        m_axi_wready,
        //AXI data write resp port
        m_axi_bresp,
        m_axi_bready,
        m_axi_bvalid,
        //AXI data read address port
        m_axi_araddr,
        m_axi_arvalid,
        m_axi_arready,
        //AXI data read data port
//        m_axi_rdata,
        m_axi_rvalid,
        m_axi_rready        
    );
    
endmodule
