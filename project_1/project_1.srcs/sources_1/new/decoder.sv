`timescale 1ns / 1ps

module inst_decode(
    input[31:0]  INST_REG,
    input aresetn,
    input aclk,
    input alu_flag,
    output [4:0] rd, rs1, rs2,
    output [31:0] imm,
    output [3:0] alu_operation,
    output[6:0] opcode,
    output [1:0] a_select,
    output [1:0] b_select,
    output [1:0] c_select, //regfile select (it can be interpeted as ALU_out select need to refactor)
    output [1:0] next_PC_select,
    output PC_enable, //regfile select
    output IR_enable,
    output wb,
    output current_PC_enable,
    output m2r_select, //select adress from rd(reg destination, 0) or c(memory destination, 1)
    output [3:0] _we_data
    
    );
    localparam FETCH = 3'b000;
    localparam DECODE = 3'b001;
    localparam EXECUTE = 3'b010;
    localparam MEMORY = 3'b011;
    localparam WRITE_BACK = 3'b100;
    
    //typedef enum bit [2:0] {FETCH,DECODE,EXECUTE,MEMORY,WRITE_BACK} e_states;
//    typedef enum bit [31:0] {ADDI = 32'h1, SLTI = 32'h2, ANDI = 32'h4, ORI = 32'h8, XORI = 32'h10, LUI = 32'h20, AUIPC = 32'h40, SLLI = 32'h80, SRLI = 32'h100,
//                             SRAI = 32'h200, ADD = 32'h400, SUB = 32'h800,_XOR = 32'h1000, _OR = 32'h2000, _AND = 32'h4000, SLL = 32'h8000, SRL = 32'h10000,
//                             SLT = 32'h20000, LB = 32'h40000, LH = 32'h80000, LW = 32'h100000, SB = 32'h200000, SH = 32'h400000, SW = 32'h800000,
//                             JAL = 32'h1000000, JALR = 32'h2000000, BEQ = 32'h4000000 ,BEN = 32'h8000000, BLT = 32'h10000000, BGE = 32'h20000000, 
//	                         BLTU = 32'h40000000, BGEU = 32'h80000000} e_operations;
    
    //R-type instruction parts decoder
    wire [6:0] _opcode = INST_REG [6:0];
    wire [4:0] _rd = INST_REG [11:7];
    wire [2:0] _funct3 = INST_REG [14:12];
    wire [4:0] _rs1 = INST_REG [19:15];
    wire [4:0] _rs2 = INST_REG [24:20];
    wire [6:0] _funct7 = INST_REG [31:25];
    
    bit [2:0] next_state;
// instruction format decode
//    Integer Register-Immediate Instructions (I-type operations)
//    wire imm_alu_op = (opcode == 7'b0010011); 
//    //Integer Register-Register Operations
//    wire reg_alu_op = (opcode == 7'b0110011); 
//    //lui aui
//    wire lui = (opcode == 7'b0110111);
//    wire aui = (opcode == 7'b0010011);
//    //interupts 
//	wire csr_op = (opcode == 7'b1110011);
//    //Conditional branches
//    wire branch_op = (opcode == 7'b1100011);
//    //Load and store instructions
//    wire load_op = (opcode == 7'b0000011);
//    wire store_op = (opcode == 7'b0100011);
//    wire jalr_op = (opcode == 7'b1100111);
//    wire _jal_op = (opcode == 7'b1101111); //needed
//    wire srrli = (opcode == 7'b0010011);
    bit[2:0] T = 0;
    bit [1:0] _a_select; //select a_alu_input (reg a, PC, current_PC) 
    bit [1:0] _b_select; //select b_alu_input (reg b, imm)
    bit [1:0] _c_select; //select for c reg file (ALU_out, imm, REGFILE[rs1], PC)
    bit [1:0] _next_PC_select; //select next PC output (PC+4, ALU_out, c, PC)
    bit _PC_enable; //enable write to pc
    bit _IR_enable; //enable write to instruction register
    bit _wb; //enable write to regfile
    bit _current_PC_enable; //current pc enable
    bit areset;
    bit [3:0] _alu_operation;
    bit _m2r_select; //memory to register
    bit we_data;
    
    
   
    //immideate multiplexer
    bit [31:0] _imm;
    
    //combinational for choosing immidiate and alu_ops
    always_comb begin
        //imm select
        case(_opcode)
            7'b0100011: _imm <= {{20{INST_REG[31]}}, INST_REG[31:25], INST_REG[11:7]}; //S type store
            7'b1100011: _imm <= {{20{INST_REG[31]}}, INST_REG[31:25], INST_REG[11:8], 1'b0}; //B type branch
            7'b0010011: _imm <= {{20{INST_REG[31]}}, {INST_REG[31:20]}}; //I type (imm_alu_op or load or jalr)
            7'b1100111: _imm <= {{20{INST_REG[31]}}, {INST_REG[31:20]}}; //I type (imm_alu_op or load or jalr)
            7'b0000011: _imm <= {{20{INST_REG[31]}}, {INST_REG[31:20]}}; //I type (imm_alu_op or load or jalr)
            7'b0110111 , 7'b0010011: _imm <=  {{INST_REG[31:12]}, {12'b000000000000}}; //U type (LUI or AUI)
            7'b1101111: _imm <= {{12{INST_REG[31]}}, INST_REG[19:12], INST_REG[20], INST_REG[30:25], INST_REG[24:21], 1'b0}; // j type jal
            7'b1110011, 7'b0110011: _imm <= 7'b0; // r type (csr, reg_alu_op)
            default: _imm <= 7'b0;           
        endcase
        
        //ALU operation select (without fetch)  
        case(_opcode) //prebacit u alu
            7'b1100011:begin //branch
                 case (_funct3)
                     3'b000: _alu_operation <= 4'b1000; // equale
                     3'b001: _alu_operation <= 4'b1001; //not equale
                     3'b100: _alu_operation <= 4'b0011; //less
                     3'b101: _alu_operation <= 4'b1010; //greater
                     3'b110: _alu_operation <= 4'b1011; //less then unsigned
                     3'b111: _alu_operation <= 4'b1100; //greater then unsigned
                     default: _alu_operation <= 4'b0000;       
                 endcase
            end   
            7'b1101111: _alu_operation <= 4'b0000; // jal (this is diffrent in pipelined)
            7'b0110011, 7'b0010011: begin // r type
                 case (_funct3)
                     3'b000: _alu_operation <= _funct7[5] ? 4'b0001 : 4'b0000; // add / sub
                     3'b001: _alu_operation <= 4'b0010; //shiftleft
                     3'b010: _alu_operation <= 4'b0011; // lessthen
                     3'b011: _alu_operation <= 4'b1011;  //sltu
                     3'b100: _alu_operation <= 4'b0100; //xor
                     3'b101: _alu_operation <= funct7 ? 4'b0101 : 4'b0110; //srl / sra
                     3'b110: _alu_operation <=  4'b0111;//or
                     3'b111: _alu_operation <=  4'b1000; //and 
                     default: _alu_operation <= 4'b0000;        
                 endcase
            end
            default: _alu_operation <= 4'b0000; 
        endcase
        
             //defult cases for operations 
        _a_select <= 2'b10; //PC
        _b_select <= 2'b10; //constant 4
        _PC_enable <= 1'b1; // PC <= ALU_out 
        _next_PC_select <= 2'b01; //redirect alu_out to pc
        _IR_enable <= 1'b0;
        _c_select <= 2'b10; // save jump adress to registar c   
        _wb <= 1'b0;
        _current_PC_enable <= 1'b1; 
        _m2r_select <= 1'b0;
        we_data <= 4'b0000;      
        
        //
        case(T)
            FETCH:begin
                _IR_enable <= 1'b1;
                _PC_enable <= 1'b1; //select PC <= next_PC regtype
                _next_PC_select <= 2'b00; // pc <= pc_plus_4
                _current_PC_enable <= 1'b1;
                _a_select <= 2'b00; //PC
                _b_select <= 2'b01; //imm
                _c_select <= 2'b10; // save jump adress to registar c
                _m2r_select <= 1'b0;
                we_data <= 4'b0000;  
            end
            DECODE:begin
                case(_opcode)
                    7'b0010011:begin  //imm
                        _b_select <= 2'b01; //imm
                        _a_select <= 2'b00; // 0
                        _PC_enable <= 1'b0; //no nextPC select
                        _c_select <= 2'b00; //REG_FILE[rs] //reg file  for pseudo mv ,goes to writeback if rs = 0 TODO
                        _next_PC_select <= 2'b00; // pc <= pc_plus_4
                        //qa <= regfile[rs1] and qa <= regfile[rs2] is done regardlessly
                    end
                    7'b0110011:begin //reg
                        _a_select <= 2'b00;
                        _b_select <= 2'b00;
                        _PC_enable <= 1'b0; //no nextPC select
                        _next_PC_select <= 2'b00; // pc <= pc_plus_4
                        //qa <= regfile[rs1] and qa <= regfile[rs2] is done regardlessly
                    end
                    7'b0110111: begin //lui
                        _PC_enable <= 1'b0; //no nextPC select
                        _c_select <= 2'b11; //immmediate regtype
                        _next_PC_select <= 2'b00; // pc <= pc_plus_4
                    end
                    7'b0010011:begin //aui
                        _a_select <= 2'b10; //current_PC
                        _b_select <= 2'b01; //imm
                        _next_PC_select <= 2'b01; //redirect alu_out to pc
                        _PC_enable <= 1'b1; // write enable to pc (PC <= ALU_out)       
                    end
                    7'b1110011: ; //csr
                    7'b1100011:begin //branch
                        _a_select <= 2'b00; //PC
                        _b_select <= 2'b01; //imm
                        _c_select <= 2'b10; // save jump adress to registar c
                        _PC_enable = 1'b0;
                        _next_PC_select <= 2'b00; // pc <= pc_plus_4       
                    end
                    7'b0000011: begin  //imm
                        _b_select <= 2'b01; //imm
                        _a_select <= 2'b01;
                        _PC_enable <= 1'b0; //no nextPC select
                        _c_select <= 2'b00; //REG_FILE[rs] //reg file  for pseudo mv ,goes to writeback if rs = 0 TODO
                        _next_PC_select <= 2'b00; // pc <= pc_plus_4
                        //qa <= regfile[rs1] and qa <= regfile[rs2] is done regardlessly
                    end //load //qa <= regfile[rs1] and qa <= regfile[rs2] is done regardlessly
                    7'b0100011: _PC_enable <= 1'b0; //store //qa <= regfile[rs1] and qa <= regfile[rs2] is done regardlessly
                    //jalr
                    7'b1100111: ;  //qa <= regfile[rs1] and qa <= regfile[rs2] is done regardlessly //jalr
                    7'b1101111: begin //jal
                       _a_select <= 2'b00; //PC
                       _b_select <= 2'b01; //imm
                       _c_select <= 2'b10; // save jump adress to registar c
                       _next_PC_select <= 2'b01; //redirect alu_out to pc
                       _PC_enable <= 1'b1; 
                    end 
                    7'b0010011: ; //sssrli // b = rs2 TODO
                    default:begin
                        _a_select <= 2'b00; //PC
                        _b_select <= 2'b10; //constant 4
                        _PC_enable <= 1'b1; // PC <= ALU_out 
                        _next_PC_select <= 2'b00; //redirect alu_out to pc
                        _c_select <= 2'b10; // save jump adress to registar c
                        _wb <= 0;
                        _current_PC_enable <= 1'b0;
                        _IR_enable <= 1'b0;
                        _m2r_select <= 1'b0;
                        we_data <= 4'b0000;  
                    end    
                 endcase
            end         
            EXECUTE:begin    
                case(_opcode)
                    7'b0010011:begin  //imm
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b01; //imm
                        _c_select <= 2'b01; // write to c
                        _PC_enable <= 1'b0;
                     end
                    7'b0110011:begin //reg
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b00; //qb
                        _c_select <= 2'b01; //write to c
                        _PC_enable <= 1'b0;
                    end
//                    7'b1110011: ; //csr
                    7'b1100011:begin //branch
                        _a_select <= 2'b01; //qa
                        _b_select <= 2'b00; //qb
                        _next_PC_select <= 2'b10; //redirect c to pc
                        _PC_enable <= alu_flag ? 1'b0 : 1'b1;       
                    end
                    7'b0000011:begin //load
                        _a_select <= 2'b01; //qa
                        _b_select <= 2'b01; //imm
                        _PC_enable <= 1'b0;
                        _c_select <= 2'b01;     
                        _m2r_select <= 1'b0;                    
                    end
                    7'b0100011:begin  //store
                        _a_select <= 2'b01; //qa
                        _b_select <= 2'b01; //imm
                        _PC_enable <= 1'b0;
                        _c_select <= 2'b01;
                        _m2r_select <= 1'b0;    
                    end
                    7'b1100111: begin  //jalr
                       _a_select = 2'b01; //qa
                       _b_select = 2'b01; //imm
                       _c_select = 2'b01; //write ALU_out to c (set to zero if rd = 0 ???)
                       _next_PC_select <= 2'b01; //redirect alu_out to pc
                       _PC_enable <= 1'b1; // enable write to pc
                    end    
                    7'b0010011: ; //sssrli // b = rs2 TODO
                    default:begin
                        _a_select <= 2'b01; //qa
                        _b_select <= 2'b10; //constant 4
                        _PC_enable <= 1'b0; // PC <= ALU_out 
                        _next_PC_select <= 2'b00; //redirect alu_out to pc
                        _c_select <= 2'b10; // save jump adress to registar c
                        _wb <= 0;
                        _current_PC_enable <= 1'b0;
                        _IR_enable <= 1'b0;
                        we_data <= 4'b0000; 
                    end    
                endcase 
             end
             MEMORY:begin
                  
               case(_opcode)
                    7'b0000011:begin _m2r_select <= 1'b0; _PC_enable <= 1'b0; end //load 
                    7'b0100011:begin //store
                        _PC_enable <= 1'b0;
                        we_data <= 4'b1111;
						_m2r_select <= 1'b0;		
                    end    
                    default:begin
                        _a_select <= 2'b00; //PC
                        _b_select <= 2'b10; //constant 4
                        _PC_enable <= 1'b0; // PC not enabled
                        _next_PC_select <= 2'b00; //redirect alu_out to pc
                        _c_select <= 2'b10; // save jump adress to registar c
                        _wb <= 0;
                        _current_PC_enable <= 1'b0;
                        _IR_enable <= 1'b0;
                        we_data <= 4'b0000; 
                    end    
               endcase 
             end
             WRITE_BACK:begin
                 we_data <= 4'b0000;   
                 _wb <= 1'b1;
                 _PC_enable <= 1'b0;
                 _current_PC_enable <= 1'b0; 
                 if (_opcode == 7'b0000011) _m2r_select <= 1'b0;  //load TODO
                 else _m2r_select <= 1'b1;   
             end              
        endcase
    
    
    
    
        
    next_state <= FETCH; 
   ///state machine
        case(T)
                FETCH:begin
                    next_state <= DECODE;
                end
                DECODE:begin
                    case(_opcode)
                        7'b0010011:begin  //imm
                           next_state <= EXECUTE;
                        end
                        7'b0110011:begin //reg
                            next_state <= EXECUTE;
                        end
                        7'b0110111: begin //lui
                            next_state <= WRITE_BACK;
                        end
                        7'b0010011:begin //aui
                           next_state <= FETCH;     
                        end
                        7'b1110011: ; //csr
                        7'b1100011:begin //branch
                            next_state <= EXECUTE;      
                        end
                        7'b0000011: next_state <= EXECUTE; //load
                        7'b0100011: next_state <= EXECUTE; //store
                        7'b1100111: next_state <= EXECUTE; //jalr
                        7'b1101111: begin //jal
                           next_state <= (_rd == 0) ?  WRITE_BACK : FETCH; //pseudo  jump
                        end 
                        7'b0010011: next_state <= EXECUTE ; //sssrli // b = rs2 TODO
                        default:begin
                            next_state <= EXECUTE;
                        end    
                     endcase
                end         
                EXECUTE:begin    
                    case(_opcode)
                        7'b0010011:begin  //imm
                            next_state <= WRITE_BACK;
                         end
                        7'b0110011:begin //reg
                            next_state <= WRITE_BACK;
                        end
                        7'b1100011:begin //branch
                            next_state <= FETCH;       
                        end
                        7'b0000011: next_state <= WRITE_BACK; //load
                        7'b0100011: next_state <= MEMORY; //store
                        7'b1100111: begin  //jalr
                           next_state <= (_rd == 0) ? WRITE_BACK : FETCH;
                        end    
                        default:begin
                            next_state <= WRITE_BACK;
                        end   
                    endcase 
                 end
                 MEMORY:begin    
                    case(_opcode)
                        7'b0000011: next_state <= WRITE_BACK; //load 
                        7'b0100011: next_state <= FETCH; //store
                        default:begin
                            next_state <= FETCH;
                        end   
                    endcase 
                 end
                 WRITE_BACK:begin    
                   next_state <= FETCH;
                 end                  
            endcase
         
     end
     
    always@(posedge aclk)begin
        if (aresetn) T <= next_state;
        else T <= 0;
    end                    
    
    assign rd = _rd;
    assign rs1 = _rs1;
    assign rs2 = _rs2;

//    assign jump_ops = _jump_ops;
    
    assign funct3 = _funct3;
    assign funct7 = _funct7[5];
     
    assign imm = _imm;
    
//    assign jal_op = _jal_op;
    
    assign alu_operation = _alu_operation;
    
//    assign _T = T;   
    
//    assign a_select = _a_select;                     
    
    assign opcode = _opcode;
    
    assign a_select = _a_select;
    assign b_select = _b_select;
    assign c_select = _c_select; //regfile select (it can be interpeted as ALU_out select need to refactor)
    assign PC_enable = _PC_enable; //regfile select
    assign wb = _wb;
    assign next_PC_select = _next_PC_select;
    assign IR_enable = _IR_enable;
    assign current_PC_enable = _current_PC_enable;
    assign m2r_select = _m2r_select;
    assign _we_data = we_data;
    
    
endmodule
