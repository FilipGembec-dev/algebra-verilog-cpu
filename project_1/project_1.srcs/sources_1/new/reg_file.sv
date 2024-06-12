`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2024 22:16:30
// Design Name: 
// Module Name: reg_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 0ne input two outputs regfile
// - made for RISC-V cpu project
// Dependencies: no 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_file(
    input clk,
    input we,
    input [4:0] address_a, address_b, address_in,
    input [31:0] regfile_in,
    output [31:0] regfile_out_a, regfile_out_b            
    );
    
    reg [31:0] REGFILE [31:0];
    
    always@(posedge clk)begin
        if(we)begin
            REGFILE[address_in] <= regfile_in;
        end    
    end    
    
    assign regfile_out_a = REGFILE[address_a];
    assign regfile_out_b = REGFILE[address_b]; 
    assign REGFILE[0] = 32'h00; //register x0 is hardwired to the constant
endmodule
