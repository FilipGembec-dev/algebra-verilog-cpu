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
    );
	
    localparam c_register_file_len = 5; // rv32i has 31 general-purpose registers x1-x31, which hold integer values
    //register file
    bit [31:0] REG_FILE [c_register_file_len - 1 : 0];
    //program counter -> PC
    bit [31:0] PC = 32'd0;
    //instruction reg -> INST_REG
    bit [31:0] INST_REG = 32'd0;
    //state tracker
    bit [31:0] T = 'd0;
    //next pc 
    //bit [31:0] next_PC; 

    //PC + 4
    wire [31:0] PC_plus_4 = PC + 4;
    
    //R-type instruction parts decoder
    wire [6:0] opcode = data_in_inst [6:0];
    wire [4:0] rd = data_in_inst [11:7];
    wire [2:0] funct3 = data_in_inst [14:12];
    wire [4:0] rs1 = data_in_inst [19:15];
    wire [4:0] rs2 = data_in_inst [24:20];
    wire [6:0] funct7 = data_in_inst [31:25];
    //immediate decoder
    wire signed [11:0] imm_I = data_in_inst [31:20];
    wire signed [6:0] imm_S = {data_in_inst[31:25], data_in_inst[11:7]};
    wire signed [6:0] imm_B = {data_in_inst[31], data_in_inst[7], data_in_inst[30:25], data_in_inst[11:8]};
    wire signed [19:0] imm_U = data_in_inst [31:12];
    wire signed [19:0] imm_J = {data_in_inst [31], data_in_inst[19:12], data_in_inst[20], data_in_inst[30:25], data_in_inst[24:21]};
 
 //instruction format decode
    //Integer Register-Immediate Instructions (I-type operations)
    wire imm_alu_op = (opcode == 7'b0010011); 
    //Integer Register-Register Operations
    wire reg_alu_op = (opcode == 7'b0110011); 
    //NOP 
    //?? 
	
    //Conditional branches
    wire branch_op = (opcode == 7'b1100011);
    //Load and store instructions
    wire load_op = (opcode == 7'b0000011);
    wire store_op = (opcode == 7'b0100011);
    
//instruction decode    
    //immediate    
    wire addi =  imm_alu_op & (funct3 == 3'h0); // add immediate
    wire slti = imm_alu_op & (funct3 == 3'h2); // set less then immediate
    wire andi = imm_alu_op & (funct3 == 3'h7); // and immediate
    wire ori = imm_alu_op & (funct3 == 3'h6); // or immediate
    wire xori = imm_alu_op & (funct3 == 3'h4); // xor immediate
    wire lui = (opcode == 7'b0110111); // load upper immediate
    wire auipc = (opcode == 7'b0010111); // // add upper immediate to PC
    wire slli = imm_alu_op & (funct3 == 3'h1) & (imm_I[11:5] == 7'h00); //shift left logical immediate
    wire srli = imm_alu_op & (funct3 == 3'h5) & (imm_I[11:5] == 7'h00); //shift right logical immediate
    wire srai = imm_alu_op & (funct3 == 3'h5) & (imm_I[11:5] == 7'h20); //shift right arithmetic immediate
    //register to register alu ops
    wire add = reg_alu_op & (funct3 == 3'h0) & (funct7 == 7'h00); //add rs1 and rs2
    wire sub = reg_alu_op & (funct3 == 3'h0) & (funct7 == 7'h20); //sub rs1 and rs2
    wire _xor = reg_alu_op & (funct3 == 3'h4) & (funct7 == 7'h00); //xor rs1 and rs2
    wire _or = reg_alu_op & (funct3 == 3'h6) & (funct7 == 7'h00); //or rs1 and rs2
    wire _and = reg_alu_op & (funct3 == 3'h7) & (funct7 == 7'h00); //and rs1 and rs2
    wire sll = reg_alu_op & (funct3 == 3'h1) & (funct7 == 7'h00); //shift left logical rs1 and rs2
    wire srl = reg_alu_op & (funct3 == 3'h5) & (funct7 == 7'h00); //shift right logical rs1 and rs2
    wire slt = reg_alu_op & (funct3 == 3'h2) & (funct7 == 7'h00); //set les then if rs1 is less then imm
    //load
    wire lb = load_op & (funct3 == 3'h0); //load byte
    wire lh = load_op & (funct3 == 3'h1); //load half word
    wire lw = load_op & (funct3 == 3'h2); //load word
    //store
    wire sb = store_op & (funct3 == 3'h0); //store byte
    wire sh = store_op & (funct3 == 3'h1); //store half word
    wire sw = store_op & (funct3 == 3'h2); //store word
    //control
	//Unconditional jumps
    wire jal = (opcode == 7'b1101111);
    wire jalr = (opcode == 7'b1100111) & (funct3 == 3'h7);
    //branch
    wire beq = branch_op & (funct3 == 3'h0); //branch if equale
    wire ben = branch_op & (funct3 == 3'h1); //branch if not equale
    wire blt = branch_op & (funct3 == 3'h4); //branch if less then zero
    wire bge = branch_op & (funct3 == 3'h5); //branch greater or equale
    wire bltu = branch_op & (funct3 == 3'h6); //brench if less then *unsigned
    wire bgeu = branch_op & (funct3 == 3'h7); //branch if greater or equale then *unsigned 
    //TO DO: FENCE, FENCE.1, ECALL, EBREAK
	
    //setting registers for ALU operations
    wire [31:0] a = (rs1==0) ? 0 : REG_FILE[rs1];
    wire [31:0] b = (rs2==0) ? 0 : REG_FILE[rs2];	
	
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
               
               case(1'b1) //change to opcode when inst decode is completed
					//immediate integer operations				
					addi: REG_FILE[rd] <= a + imm_I; //TO DO: do we get a signed integer?
					slti: REG_FILE[rd] <= a < imm_I; //-II-
					srli: ;
					srai: ;
					andi: ;
					ori: ;
					xori: ;
					lui: ;
					auipc: ;
					//Register-Register operations
					add: REG_FILE[rd] <= a + b;
					sub: ;
					_xor: ;
					_or: ;
					_and: ;
					srl: ;
					sll: ;
					slt: ;
					// Conditional jumps
					beq: ;
					ben: ;
					blt: ;
					bge: ;
					bltu: ;
					bgeu: ;
					// Unconditional jumps
					jal: ;
					jalr: ;
					//store
					sb: ;
					sh: ;
					sw: ;
					//Load
					lb: ;
					lh: ;
					lw: ;
               endcase
           end
           else begin       //reset
                PC <= 32'd0;
                T <= 32'd0;
           end
    end
    
    //net assigments
    assign addr_inst = PC[31:3]; //use word adress to read memory
	assign REG_FILE[31] = 32'h00; //register x0 is hardwired to the constant 0
	
endmodule
