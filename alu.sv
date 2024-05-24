`timescale 1ns / 1ps

module alu(
    input [31:0] a_i, b_i,
    input [2:0] funct3_i,
    input funct7_i,
    output [31:0] c_o,
    //no pipeline input
    input pc_add
    );
    
    bit c_i;
    
    always_comb begin
        if (pc_add) c_i = a_i + b_i; // in pipeline cpu pc needs seperate adder to preform fetch add pc, and execute instruction adds in same time
        else begin
            case (funct3_i)
                3'b000: c_i = funct7_i ? (a_i + b_i) : (a_i - b_i); // add / sub
                3'b001: c_i = a_i << b_i; // sll: rs1 is a_i, b_i is lower 5 bits of I-immidate 
                3'b010: c_i = a_i < b_i; // slt
                3'b011: c_i = a_i == b_i;  //sltu
                3'b100: c_i = a_i ^ b_i; //xor
                3'b101: c_i = funct7_i ? (a_i >> b_i) : (a_i >>> b_i); //srl / sra
                3'b110: c_i = a_i | b_i; //or
                3'b111: c_i = a_i & b_i; //and      
            endcase
        end             
    end
    
    
endmodule
