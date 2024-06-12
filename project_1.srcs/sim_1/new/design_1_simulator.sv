`timescale 1ns / 1ps


module design_1_simulator;

  logic reset = 1;
  logic sys_clock = 0;

  design_1 design_1_i
       (.reset(reset),
        .sys_clock(sys_clock));

//generate a system clock
always begin
     sys_clock <= ~sys_clock; #10;
end


initial begin
  
end


endmodule
