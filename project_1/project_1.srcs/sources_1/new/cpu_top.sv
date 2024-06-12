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
    //REGFILE PC INSTREG(program register)
    //localparam c_register_file_len = 32; // rv32i has 31 general-purpose registers x1-x31, which hold integer values
    //bit [31:0] REG_FILE [c_register_file_len - 1 : 0];
    
    //regfile
    bit [31:0] regfile_in;
    wire [31:0] regfile_out_a;
    wire [31:0] regfile_out_b;
    wire [4:0] regfile_address_a;
    wire [4:0] regfile_address_b;
    wire [4:0] regfile_address_in;
    
    reg [31:0] PC = 32'd0;
    wire [31:0] PC_plus_4 = PC + 4;
    bit [31:0] INST_REG;	
	//setting REGFILE read registers a and b
    reg [31:0] reg_a;
	reg [31:0] reg_b; 
	//decode signals and registers
	bit [31:0] alu_a; //ALU in port A
	bit [31:0] alu_b;  //ALU in port B 
	bit [31:0] ALU_out; //ALU out port
	bit [31:0] data_reg; //register for storing data from memory/instructions
	bit [31:0] current_PC; //save current PC
	bit [31:0] reg_c; //setting ALU out c register
	wire [31:0] memory_adress = reg_c; //adress for memory (always on)
	wire m2r_select; //memory or c
	wire alu_flag; //for logical operations alu
    //see decode
	wire [1:0] a_select;
	wire [1:0] b_select;
	wire [1:0] c_select;
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
			2'b00: alu_a <= reg_a;
			2'b01: alu_a <= PC;
			2'b10: alu_a <= current_PC;
			default: alu_a <= 32'b0;
		endcase
		
		case (b_select)
			2'b00: alu_b <= reg_b;
			2'b01: alu_b <= imm;
			default: alu_b <= reg_b;		
		endcase
		  	
		case (next_PC_select)
		  2'b00: next_PC <= PC_plus_4;
		  2'b01: next_PC <= ALU_out;
		  2'b10: next_PC <= reg_c; 
		  default: next_PC <= PC_plus_4;	
		endcase
		
		case (m2r_select)
            1'b0: regfile_in <=  reg_c;
            1'b1: regfile_in <= data_reg;
       endcase
	end

    //////////////////////////////////////////////////////	
    //WIRES AND MULTIPLEXERS TO REGISTERS SELECT ACTIONS//
    /////////////////////////////////////////////////////
	always@(posedge aclk)begin
	   if (aresetn)begin
	       //prepare regfile reg_a and reg_b for operations when there is adress
           reg_a <= (rs1==0) ? 0 : regfile_out_a; 
           reg_b <= (rs2==0) ? 0 : regfile_out_b;
           //prepare data_reg when theres address
           data_reg <= data_in_data;            
             
            case (c_select)
                2'b00: reg_c <= regfile_out_a;
                2'b01: reg_c <= ALU_out;
                2'b10: reg_c <= PC;
                2'b11: reg_c <= imm;		
            endcase
            
            case (PC_enable)
                1'b0:; 
                1'b1: PC <= next_PC;
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
    assign data_out_data = reg_b; // for store
    assign addr_data = memory_adress; //c is memory adress
    assign addr_inst = PC[31:2]; //use word adress to read memory
	assign we_data = _we_data;
	
	assign regfile_address_in = rd; 
	assign regfile_address_a = rs1; 
	assign regfile_address_b = rs2;
	
	
	
	//instantiations
	 inst_decode inst_decode_instance( .INST_REG,
     .rd, .rs1, .rs2,
     .imm, 
     .alu_operation,
     .aclk,
     .a_select,.b_select,.c_select,.next_PC_select, .wb, .alu_flag, .IR_enable, .PC_enable, .current_PC_enable, .m2r_select, ._we_data, .aresetn
     );
    
     alu alu_inst_0(.a_i(alu_a), .b_i(alu_b), .c_o(ALU_out), .alu_operation(alu_operation), .alu_flag(alu_flag));
	
	reg_file regfile_instance(.clk(aclk), .address_a(regfile_address_a), .address_b(regfile_address_b),
                             .address_in(regfile_address_in), .regfile_in(regfile_in), .regfile_out_a(regfile_out_a),
                             .regfile_out_b(regfile_out_b), .we(wb));
	
	
endmodule
