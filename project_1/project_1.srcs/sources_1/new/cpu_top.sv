`timescale 1ns / 1ps

module cpu_top(
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
    
    //source and destination
    wire [4:0] rd, rs1, rs2;   
    //imm
    wire [31:0] imm;
    
    localparam c_register_file_len = 32; // rv32i has 31 general-purpose registers x1-x31, which hold integer values
    //REGFILE PC INSTREG(program register)
    bit [31:0] REG_FILE [c_register_file_len - 1 : 0];
    reg [31:0] PC = 32'd0;
    wire [31:0] PC_plus_4 = PC + 4;
    bit [31:0] INST_REG;	
	//setting REGFILE read registers a and b
    reg [31:0] qa;
	reg [31:0] qb; 
	//decode signals and registers
	bit [31:0] a; //adder port A TODO: rename to alu_B
	bit [31:0] b;  //adder port B TODO: rename to alu_B
	bit [31:0] ALU_out; //adder out port
	bit [31:0] data_reg; //register for storing data from memory/instructions
	bit [31:0] current_PC; //save current PC
	bit [31:0] c; //setting ALUout c register
	wire [31:0] memory_adress = c; //adress for memory (always on)
	wire m2r_select; //memory or c
	wire alu_flag; //for logical operations alu
    //see decode
	wire [1:0] a_select;
	wire [1:0] b_select;
	wire [2:0] c_select;
	wire PC_enable;
	wire wb;
	wire IR_enable;
	wire [1:0] next_PC_select;
	wire current_PC_enable;
	bit [3:0]  _we_data;
	bit [31:0] next_PC;    
	wire [3:0] alu_operation; 	
///////////////////////////////////////	
//WIRE TO MULTIPLEXERS SELECT ACTIONS//
//////////////////////////////////////
	always_comb begin
		case (a_select)
			2'b00: a <= qa;
			2'b01: a <= PC;
			2'b10: a <= current_PC;
			default: a <= 32'b0;
		endcase
		
		case (b_select)
			2'b00: b <= qb;
			2'b01: b <= imm;
			default: b <= qb;		
		endcase
		  	
		case (next_PC_select)
		  2'b00: next_PC <= PC_plus_4;
		  2'b01: next_PC <= ALU_out;
		  2'b10: next_PC <= c; 
		  default: next_PC <= PC_plus_4;	
		endcase
	end

//////////////////////////////////////////////////////	
//WIRES AND MULTIPLEXERS TO REGISTERS SELECT ACTIONS//
/////////////////////////////////////////////////////
	always@(posedge aclk)begin
	   if (aresetn)begin
            qa <= (rs1==0) ? 0 : REG_FILE[rs1]; //loads into qa register (need to change name)
            qb <= (rs2==0) ? 0 : REG_FILE[rs2]; //loads into qb register (need to change name)
            data_reg <= data_in_data;            
             
            case (c_select)
                3'b000: c <= REG_FILE[rs1];
                3'b001: c <= ALU_out;
                3'b010: c <= PC;
                3'b011:	c <= imm;
                3'b100: c <= PC_plus_4;		
            endcase
            
            case (PC_enable)
                1'b0:; 
                1'b1: PC <= next_PC;
            endcase
       
            case (wb)
                1'b0: ;
                1'b1: begin 
                 REG_FILE[rd] <= m2r_select ? c : data_reg;
                 end
            endcase
            
            case (IR_enable)
                1'b0: ;
                1'b1: INST_REG <= data_in_inst;
            endcase
            
            case(current_PC_enable)
              1'b0: ;
              1'b1: current_PC <= PC;
            endcase
            
		end else begin
            PC <= 0;
            INST_REG <= 0;		  
		end
	end
    
    //net assigments
    assign data_out_data = qb; // for store
    assign addr_data = memory_adress; //c is memory adress
    assign addr_inst = PC[31:2]; //use word adress to read memory
	assign REG_FILE[0] = 32'h00; //register x0 is hardwired to the constant
	assign we_data = _we_data;
	
	//instantiations
	 inst_decode my_inst( .INST_REG,
     .rd, .rs1, .rs2,
     .imm, 
     .alu_operation,
     .aclk,
     .a_select,.b_select,.c_select,.next_PC_select, .wb, .alu_flag, .IR_enable, .PC_enable, .current_PC_enable, .m2r_select, ._we_data, .aresetn
     );
    
     alu alu_inst_0(.a_i(a), .b_i(b), .c_o(ALU_out), .alu_operation(alu_operation), .alu_flag(alu_flag));
	
endmodule
