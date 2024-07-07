`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2024 10:50:08
// Design Name: 
// Module Name: design_sim
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


`timescale 1ns / 1ps


module design_1_simulator;

  logic reset = 0;
  logic sys_clock = 0;

  system_design_wrapper system_design_wrapper_i
       (.reset(reset),
        .sys_clock(sys_clock));

//generate a system clock
always begin
     sys_clock <= ~sys_clock; #10;
end


initial begin
  
end


endmodule

