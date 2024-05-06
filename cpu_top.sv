`timescale 1ns / 1ps


module cpu_top(
    //clocking
    input aclk,
    input aresetn,
    //instruction port
    input [31:0] addr_inst,
    output [31:0] data_out_inst,
    input [31:0] data_in_inst,
    input [3:0] en_inst,
    input we_inst,
    //data port
    input [31:0] addr_data,
    output [31:0] data_out_data,
    input [31:0] data_in_data,
    input en_data,
    input [3:0] we_data
    );
    
    
    
    localparam c_register_file_len = 32;
    //register file
    bit [31:0] REG_FILE [c_register_file_len - 1 : 0];
    
    //program counter -> PC
    bit [31:0] PC = 32'd0;
    //instruction reg -> INST_REG
    bit [31:0] INST_REG = 32'd0;
    //state tracker
    bit [31:0] T = 'd0;
//next pc 
//    bit [31:0] next_PC; 

    //PC + 4
    wire [31:0] PC_plus_4 = PC + 4;
    
    
    //main state machine
    always@(posedge aclk)begin
           if(aresetn)begin //work
                T <= T + 1;
               case(T)
                    32'd0 : begin //INSTR fetch
                        INST_REG <= data_in_inst;
                        T <= T + 1;
//                        PC <= next_PC;
                        PC <= PC_plus_4;                          
                    end
               endcase
               
               case(INST_REG) //change to opcode when inst decode is completed
                    
               endcase
           end
           else begin       //reset
                PC <= 32'd0;
                T <= 32'd0;
           end
    end
    
    
    //net assigments
    assign addr_inst = PC[31:3]; //use word adress to read memory
    
endmodule
