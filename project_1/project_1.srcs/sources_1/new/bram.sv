`timescale 1ns / 1ps

module bram_inst(
    input clk,
    input [3:0] we_i,
    input [31:0] data_in_i,
    input [31:0] addr_i,
    output [31:0] data_out_i,
    
    input [3:0] we_m,
    input [31:0] data_in_m,
    input [31:0] addr_m,
    output [31:0] data_out_m
    );
 
    reg [31:0] data_i [127:0]; //data instruction
    
    reg [31:0] data_m [127:0]; //data memory
    
    initial begin
//        data_i[0] <= 32'h00300513; //addi 
//        data_i[1] <= 32'h00300593; //addi 
//        data_i[2] <= 32'h00a586b3; //add
//        data_i[3] <= 32'h00005637; //lui
//        data_i[4] <= 32'h00b6c833; //xor
//        data_i[5] <= 32'h000001797; //aui
//        //data_i[6] <= 32'hfe7ff8ef; //jal
//        data_i[6] <= 32'h00358567; //jalr //jalr weird select

          data_i[0] <= 32'h00400593;
          data_i[1] <= 32'h00500693;
          data_i[2] <= 32'h00b6a1a3;  
          data_i[3] <= 32'h0036a603;
    end
    
    always@(posedge clk)begin
        //set data instruction    
        data_i[addr_i] <= {we_i[3] ? data_in_i[31:24] : data_i[addr_i],
                           we_i[2] ? data_in_i[23:16] : data_i[addr_i],
                           we_i[1] ? data_in_i[15:8] : data_i[addr_i],
                           we_i[0] ? data_in_i[7:0] : data_i[addr_i]};
        //set data memory
        data_m[addr_m] <= {we_m[3] ? data_in_m[31:24] : data_m[addr_m],
                           we_m[2] ? data_in_m[23:16] : data_m[addr_m],
                           we_m[1] ? data_in_m[15:8] : data_m[addr_m],
                           we_m[0] ? data_in_m[7:0] : data_m[addr_m]};
    end
    
    //read assigns
    assign data_out_i =  data_i[addr_i];
    assign  data_out_m =  data_m[addr_m];
    
    
endmodule
