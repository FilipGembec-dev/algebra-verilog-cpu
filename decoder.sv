`timescale 1ns / 1ps

module inst_decode(
    input[31:0]  data_in_inst,
    output[31:0] operation,
    output[11:0] imm_I, 
    output[6:0] imm_S, imm_B,
    output[19:0] imm_U, imm_J,
    output [4:0] rd, rs1, rs2,
    output jump_ops,
    output [3:0] funct3,
    output funct7
    );
    typedef enum bit [31:0] {ADDI = 32'h1, SLTI = 32'h2, ANDI = 32'h4, ORI = 32'h8, XORI = 32'h10, LUI = 32'h20, AUIPC = 32'h40, SLLI = 32'h80, SRLI = 32'h100,
                             SRAI = 32'h200, ADD = 32'h400, SUB = 32'h800,_XOR = 32'h1000, _OR = 32'h2000, _AND = 32'h4000, SLL = 32'h8000, SRL = 32'h10000,
                             SLT = 32'h20000, LB = 32'h40000, LH = 32'h80000, LW = 32'h100000, SB = 32'h200000, SH = 32'h400000, SW = 32'h800000,
                             JAL = 32'h1000000, JALR = 32'h2000000, BEQ = 32'h4000000 ,BEN = 32'h8000000, BLT = 32'h10000000, BGE = 32'h20000000, 
	                         BLTU = 32'h40000000, BGEU = 32'h80000000} e_operations;
    
    
    //R-type instruction parts decoder
    wire [6:0] opcode = data_in_inst [6:0];
    wire [4:0] _rd = data_in_inst [11:7];
    wire [2:0] _funct3 = data_in_inst [14:12];
    wire [4:0] _rs1 = data_in_inst [19:15];
    wire [4:0] _rs2 = data_in_inst [24:20];
    wire [6:0] _funct7 = data_in_inst [31:25];
    //immediate decoder
    wire [11:0] _imm_I = data_in_inst[31:20];
    wire [6:0] _imm_S = {data_in_inst[31:25], data_in_inst[11:7]};
    wire [6:0] _imm_B = {data_in_inst[31], data_in_inst[7], data_in_inst[30:25], data_in_inst[11:8]};
    wire [19:0] _imm_U = data_in_inst [31:12];
    wire [19:0] _imm_J = {data_in_inst [31], data_in_inst[19:12], data_in_inst[20], data_in_inst[30:25], data_in_inst[24:21]};
 
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
    wire _addi =  imm_alu_op & (funct3 == 3'h0); // add immediate
    wire _slti = imm_alu_op & (funct3 == 3'h2); // set less then immediate
    wire _andi = imm_alu_op & (funct3 == 3'h7); // and immediate
    wire _ori = imm_alu_op & (funct3 == 3'h6); // or immediate
    wire _xori = imm_alu_op & (funct3 == 3'h4); // xor immediate
    wire _lui = (opcode == 7'b0110111); // load upper immediate
    wire _auipc = (opcode == 7'b0010111); // // add upper immediate to PC
    wire _slli = imm_alu_op & (funct3 == 3'h1) & (imm_I[11:5] == 7'h00); //shift left logical immediate
    wire _srli = imm_alu_op & (funct3 == 3'h5) & (imm_I[11:5] == 7'h00); //shift right logical immediate
    wire _srai = imm_alu_op & (funct3 == 3'h5) & (imm_I[11:5] == 7'h20); //shift right arithmetic immediate
    //register to register alu ops
    wire _add = reg_alu_op & (funct3 == 3'h0) & (funct7 == 7'h00); //add rs1 and rs2
    wire _sub = reg_alu_op & (funct3 == 3'h0) & (funct7 == 7'h20); //sub rs1 and rs2
    wire __xor = reg_alu_op & (funct3 == 3'h4) & (funct7 == 7'h00); //xor rs1 and rs2
    wire __or = reg_alu_op & (funct3 == 3'h6) & (funct7 == 7'h00); //or rs1 and rs2
    wire __and = reg_alu_op & (funct3 == 3'h7) & (funct7 == 7'h00); //and rs1 and rs2
    wire _sll = reg_alu_op & (funct3 == 3'h1) & (funct7 == 7'h00); //shift left logical rs1 and rs2
    wire _srl = reg_alu_op & (funct3 == 3'h5) & (funct7 == 7'h00); //shift right logical rs1 and rs2
    wire _slt = reg_alu_op & (funct3 == 3'h2) & (funct7 == 7'h00); //set les then if rs1 is less then imm
    //load
    wire _lb = load_op & (funct3 == 3'h0); //load byte
    wire _lh = load_op & (funct3 == 3'h1); //load half word
    wire _lw = load_op & (funct3 == 3'h2); //load word
    //store
    wire _sb = store_op & (funct3 == 3'h0); //store byte
    wire _sh = store_op & (funct3 == 3'h1); //store half word
    wire _sw = store_op & (funct3 == 3'h2); //store word
    //control
	//Unconditional jumps
    wire _jal = (opcode == 7'b1101111);
    wire _jalr = (opcode == 7'b1100111) & (funct3 == 3'h7);
    //branch
	wire _beq = branch_op & (funct3 == 3'h0); //branch if equale
	wire _ben = branch_op & (funct3 == 3'h1); //branch if not equale
	wire _blt = branch_op & (funct3 == 3'h4); //branch if less then zero
	wire _bge = branch_op & (funct3 == 3'h5); //branch greater or equale
	wire _bltu = branch_op & (funct3 == 3'h6); //brench if less then *unsigned
	wire _bgeu = branch_op & (funct3 == 3'h7); //branch if greater or equale then *unsigned
	

	wire _jump_ops = (_jal | _jalr); //select j immedieta
	

	   
	

	
	//operations into vector 
	bit [31:0] _operation = {_addi, _slti, _andi, _ori, _xori, _lui, _auipc, _slli, _srli, _srai, _add, _sub,
	                        __xor, __or, __and, _sll, _srl, _slt, _lb, _lh, _lw, _sb, _sh, _sw, _jal, _jalr, 
	                        _beq ,_ben, _blt, _bge, _bltu, _bgeu};
	                        
    //net assignments
    assign operation = _operation;

    assign imm_I = _imm_I; 
    assign imm_S = _imm_S;
    assign imm_B = _imm_B;
    assign imm_U = _imm_U;
    assign imm_J = _imm_J;
    
    assign rd = _rd;
    assign rs1 = _rs1;
    assign rs2 = _rs2;

    assign jump_ops = _jump_ops;
    
    assign funct3 = _funct3;
    assign funct7 = _funct7[5];
     
    
                            
    
endmodule
