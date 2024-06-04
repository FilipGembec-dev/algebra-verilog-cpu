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


module cpu_wrapper(
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
    output [3:0] we_data
    //decode instruction module
    
    );
    
    cpu_top cpu_inst(
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
        we_data
    );
    
endmodule
