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
    
    //state machine enum
    typedef enum bit [2:0] {FETCH,DECODE,EXECUTE,MEMORY,WRITE_BACK} e_states;
    typedef enum bit [31:0] {ADDI = 32'h1, SLTI = 32'h2, ANDI = 32'h4, ORI = 32'h8, XORI = 32'h10, LUI = 32'h20, AUIPC = 32'h40, SLLI = 32'h80, SRLI = 32'h100,
                             SRAI = 32'h200, ADD = 32'h400, SUB = 32'h800,_XOR = 32'h1000, _OR = 32'h2000, _AND = 32'h4000, SLL = 32'h8000, SRL = 32'h10000,
                             SLT = 32'h20000, LB = 32'h40000, LH = 32'h80000, LW = 32'h100000, SB = 32'h200000, SH = 32'h400000, SW = 32'h800000,
                             JAL = 32'h1000000, JALR = 32'h2000000, BEQ = 32'h4000000 ,BEN = 32'h8000000, BLT = 32'h10000000, BGE = 32'h20000000, 
	                         BLTU = 32'h40000000, BGEU = 32'h80000000} operations;
    
    localparam c_register_file_len = 5; // rv32i has 31 general-purpose registers x1-x31, which hold integer values
    //register file
    bit [31:0] REG_FILE [c_register_file_len - 1 : 0];
    //program counter -> PC
    bit [31:0] PC = 32'd0;
    //instruction reg -> INST_REG
    bit [31:0] INST_REG = 32'd0;
    
    wire [31:0] PC_plus_4 = PC + 4;
    
    //R-type instruction parts decoder
    wire [6:0] opcode = data_in_inst [6:0];
    wire [4:0] rd = data_in_inst [11:7];
    wire [2:0] funct3 = data_in_inst [14:12];
    wire [4:0] rs1 = data_in_inst [19:15];
    wire [4:0] rs2 = data_in_inst [24:20];
    wire [6:0] funct7 = data_in_inst [31:25];
    //immediate decoder
    wire [11:0] imm_I = data_in_inst[31:20];
    wire [6:0] imm_S = {data_in_inst[31:25], data_in_inst[11:7]};
    wire [6:0] imm_B = {data_in_inst[31], data_in_inst[7], data_in_inst[30:25], data_in_inst[11:8]};
    wire [19:0] imm_U = data_in_inst [31:12];
    wire [19:0] imm_J = {data_in_inst [31], data_in_inst[19:12], data_in_inst[20], data_in_inst[30:25], data_in_inst[24:21]};
 
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
	
	//decode into vector 
	bit [31:0] operation = {_addi, _slti, _andi, _ori, _xori, _lui, _auipc, _slli, _srli, _srai, _add, _sub,
	                        __xor, __or, __and, _sll, _srl, _slt, _lb, _lh, _lw, _sb, _sh, _sw, _jal, _jalr, 
	                        _beq ,_ben, _blt, _bge, _bltu, _bgeu}; 
	//TO DO: FENCE, FENCE.1, ECALL, EBREAK
	
	//setting two regfile outputs
	wire [31:0] qa = (rs1==0) ? 0 : REG_FILE[rs1];
    wire [31:0] qb = (rs2==0) ? 0 : REG_FILE[rs2];
	
	//set operation registers
	bit [31:0] a;
	bit [31:0] b;
	bit [31:0] c;
	
	//load store wires
	bit [31:0] _addr_data  = 32'b0;
	bit [3:0]  _we_data = 4'b0000;
	
	//state machine
	
    //main state machine
    always@(posedge aclk)begin
           //assign enum to state tracker 
           e_states T;
           operations operation;  
           if(aresetn)begin //work
               case(T)
                    FETCH : begin //INSTR fetch
                        INST_REG <= data_in_inst;
                        T <= T.next();
                        PC <= PC_plus_4;                          
                    end
                    DECODE : begin //INSTR decode
                        if(imm_alu_op | reg_alu_op | branch_op )begin //in case of ALU and branch instructions
                            a <= qa;
                            b <= qb;
                            c <= $signed({20{imm_B[31], imm_B}});
                            T = EXECUTE;
                        end else begin
                            case (1'b1)
                                JAL:begin
				    if(rd == 1'b0)begin //pseudo-instruction jump 1 cycle
                               	        PC <= PC + $signed({12{imm_J[31], imm_J}});
                                	T <= DECODE;
				    end	else begin //JAL part
					c <= PC_plus_4;
					PC <= PC + $signed({12{imm_J[31], imm_J}});
					T <= WRITE_BACK;
				    end	
                                end
                                JALR:begin
                                     c <= PC_plus_4;
                                     PC <= qa + {20{imm_I[31], imm_I}};
                                     T <= MEMORY;
                                end
                                AUIPC: ;
                            endcase
                        end
                           
                    end
                    EXECUTE: begin // INSTR exe
                        case(operation) //change to opcode when inst decode is completed
                            //immediate integer operations
                            ADDI: begin 
                                c <= a + {{20{imm_I[31]}}, imm_I}; //arithmetic ops are just signe-extended to 32 bits
                                T <= WRITE_BACK;
                            end
                            SLTI: begin
                                c <= $signed(a) < $signed({20{imm_I[31], imm_I}}); //logic operations need $signed function
                            end
                            SRLI: ;
                            SRAI: ;
                            ANDI: ;
                            ORI: ;
                            XORI: ; //note, XORI rd, rs1, -1 performs a bitwise logical inversion of register rs1 (assembler pseudo-instruction NOT rd, rs) 
                            LUI: ;
                            AUIPC: ;
                            //Register-Register operations
                            ADD: begin
                                c <= a + b;
                                T <= WRITE_BACK;
                            end            
                            SUB: ;
                            _XOR: ;
                            _OR: ;
                            _AND: ;
                            SRL: ;
                            SLL: ;
                            SLT: ;
	                   //store instruction adress calculation 
			   (SB | SW | SH):begin 
					     _addr_data <= a + {20{imm_I[31], imm_I}};
					     T = MEMORY;
					 end    
			   JALR: begin 
			         PC[0] <= 0; 
			         T <= WRITE_BACK;
			    end 
                        endcase
                    end
                    MEMORY: begin //memory access state
                        case (operation)
                            SB: _we_data <= 4'b0001;                                
                            SH: _we_data <= 4'b0011;
                            SW: _we_data <= 4'b1111;
                            //Load
                            LB: REG_FILE[rd] <= {{24{data_in_data[31]}},data_in_data[31:24]};
                            LH: REG_FILE[rd] <= {{16{data_in_data[31]}},data_in_data[31:16]};
                            LW: REG_FILE[rd] <= data_in_data;
                         endcase
                         T <= FETCH;        
                    end
                    WRITE_BACK: begin // write back state
                        REG_FILE[rd] = c;
                        T <= FETCH;
                    end
               endcase
               
           end
           else begin       //reset
                PC <= 32'd0;
                T <= FETCH;
           end
    end
    
    //net assigments
    assign addr_inst = PC[31:3]; //use word adress to read memory
    assign REG_FILE[0] = 32'h00; //register x0 is hardwired to the constant
    assign we_data = _we_data;
    assign addr_data = _addr_data;

	
endmodule
