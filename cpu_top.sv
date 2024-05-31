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
    
    //state machine enum
    localparam FETCH = 3'b000;
    localparam DECODE = 3'b001;
    localparam EXECUTE = 3'b010;
    localparam MEMORY = 3'b011;
    localparam WRITE_BACK = 3'b100;
    
    //inst_decode wires
    wire[11:0] imm_I; 
    wire[6:0] imm_S, imm_B;
    wire[19:0] imm_U, imm_J;
    wire [4:0] rd, rs1, rs2;
    

   
    
    wire [31:0] imm;
    
    localparam c_register_file_len = 5; // rv32i has 31 general-purpose registers x1-x31, which hold integer values
    //register file
    bit [31:0] REG_FILE [c_register_file_len - 1 : 0];
    //program counter -> PC
    reg [31:0] PC = 32'd0;
    //instruction reg -> INST_REG
    bit [31:0] INST_REG;
    
	//TO DO: FENCE, FENCE.1, ECALL, EBREAK
	
	wire m2r_select;
	
	//setting regfile readports
    reg [31:0] qa;
	reg [31:0] qb;
	
    //registes for extra control  
	bit [31:0] current_PC;
	bit [31:0] c;
	wire [31:0] memory_adress = c;
	//load store wires
	bit [31:0] _addr_data  = 32'b0;
	bit [2:0]  _we_data;
	bit [31:0] data_reg; //register for storing data from memory/instructions
	
	//decode settings
	bit [31:0] next_PC; //next_PC wire
	bit [31:0] a; //adder port A TODO: rename to alu_B
	bit [31:0] b;  //adder port B TODO: rename to alu_B
	bit [31:0] ALU_out; //adder out port    
	
	//to do: implement all mathematical operations vi alu
	
	//control signals
	wire[4:0] alu_operation;
	wire [6:0] opcode;
	 //pc_plus_4 for branch
	  
	//assign enum to state tracker 
    bit[2:0] T = 0;


	wire [1:0] a_select;
	wire [1:0] b_select;
	wire [1:0] c_select;
	wire PC_enable;
	wire wb;
	wire IR_enable;
	wire [1:0] next_PC_select;
	wire current_PC_enable;
	
	wire [31:0] PC_plus_4 = PC + 4;
	
	//mux for select
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
			2'b10: b <= 3'd4; //not needed
			default: b <= qb;		
		endcase
		  	
		case (next_PC_select)
		  2'b00: next_PC <= PC_plus_4;
		  2'b01: next_PC <= ALU_out;
		  2'b10: next_PC <= c; //not needed
		  default: next_PC <= PC_plus_4;	
		endcase
	end
	
	always@(posedge aclk)begin
	    qa <= (rs1==0) ? 0 : REG_FILE[rs1]; //loads into qa register (need to change name)
        qb <= (rs2==0) ? 0 : REG_FILE[rs2]; //loads into qb register (need to change name)
        data_reg <= data_in_data;
        
         
		case (c_select)
			2'b00: c <= REG_FILE[rs1];
			2'b01: c <= ALU_out;
			2'b10: c <= PC;
			2'b11:	c <= imm;		
		endcase
		
		case (PC_enable)
			1'b0:; 
			1'b1: PC <= next_PC;
		endcase
		
		case (wb)
			1'b0: ;
			1'b1: begin 
			 REG_FILE[rd] <= m2r_select ? data_reg : c;
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
		
	end
    
    //net assigments
    assign data_out_data = REG_FILE[qb]; // for store
    assign addr_data = memory_adress; //c is memory adress
    assign addr_inst = PC[31:3]; //use word adress to read memory
	assign REG_FILE[0] = 32'h00; //register x0 is hardwired to the constant
	assign we_data = _we_data;
	//assign addr_data = _addr_data;
	wire alu_flag;
	//instantiations
	 inst_decode my_inst( .INST_REG,
     .rd, .rs1, .rs2,
     .imm, 
     .alu_operation,
     .opcode,
     .aclk,
     .a_select,.b_select,.c_select,.next_PC_select, .wb, .alu_flag, .IR_enable, .PC_enable, .current_PC_enable, .m2r_select, ._we_data
     );
    
    alu alu_inst_0(.a_i(a), .b_i(b), .c_o(ALU_out), .alu_operation(alu_operation), .alu_flag(alu_flag));


	
endmodule
