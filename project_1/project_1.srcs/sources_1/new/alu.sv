`timescale 1ns / 1ps

module alu(
    input [31:0] a_i, b_i,
    output [31:0] c_o,
    output alu_flag,
    input [3:0] alu_operation
    );
    
    bit [31:0] _c_o;
    bit _alu_flag;

    always_comb begin
        //remove latch
        _c_o <= 0; _alu_flag <= 0;
        case (alu_operation)
             4'b0000:  _c_o <= a_i + b_i; 
             4'b0001:  _c_o <= a_i - b_i;// add / sub
             4'b0010: _c_o <= a_i << b_i; //shiftleft
             4'b0011:begin _c_o <= a_i < b_i; _alu_flag <= (a_i) < (b_i); end//sltu
             4'b1011: begin _c_o <= $signed(a_i) < $signed(b_i); _alu_flag <= $signed(a_i) < $signed(b_i); end//sltu
             4'b0100: _c_o <= a_i ^ b_i; //xor
             4'b0101: _c_o <= a_i >> b_i;
             4'b0110: _c_o <= $signed(a_i) >>> $signed(b_i);//srl / sra
             4'b0111:begin _c_o <= a_i | b_i; _alu_flag <= a_i || b_i; end
             4'b1000: begin _c_o <= a_i & b_i; _alu_flag <= a_i && b_i; end //and 
             default:begin _c_o <= 0; _alu_flag <= 0; end
          endcase   
//        end             
    end
    
    assign c_o = _c_o;
    assign alu_flag = _alu_flag;
    
    
endmodule
