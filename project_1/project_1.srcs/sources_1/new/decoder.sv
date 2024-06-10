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
    output [2:0] c_select, 
    output [1:0] next_PC_select,
    output PC_enable, 
    output IR_enable,
    output wb,
    output current_PC_enable,
    output m2r_select,
    output [3:0] _we_data,
    output c_enable
    );
    //areset zero is low impendence
    bit areset;
  
    //STATES TODO: onehotencoding
    localparam FETCH = 3'b000;
    localparam DECODE = 3'b001;
    localparam EXECUTE = 3'b010;
    localparam MEMORY = 3'b011;
    localparam WRITE_BACK = 3'b100;
      
//////////////////////////////////////////////////////////////////    
//INSTRUCTION OPERATION CODES:                                  //  
//Integer Register-Immediate Instructions opcode == 7'b0010011  //    
//Integer Register-Register Operations opcode == 7'b0110011     //
//Load upper-immediate opcode == 7'b0110111                     //
//Add upper-immediate to pc opcode == 7'b0010011                //
//Csr_opcode == 7'b1110011 //not implented                      //
//Conditional Branches opcode == 7'b1100011                     //
//Load instructions opcode == 7'b0000011                        //
//Store instructions opcode == 7'b0100011                       //
//Jump and link register opcode == 7'b1100111                   //
//Jump and link opcode == 7'b1101111                            //
//////////////////////////////////////////////////////////////////
    //R-type instruction part decode
    wire [6:0] _opcode = INST_REG [6:0];
    wire [4:0] _rd = INST_REG [11:7];
    wire [2:0] _funct3 = INST_REG [14:12];
    wire [4:0] _rs1 = INST_REG [19:15];
    wire [4:0] _rs2 = INST_REG [24:20];
    wire [6:0] _funct7 = INST_REG [31:25];
    
    //state machine data
    bit [2:0] next_state;
    bit[2:0] T = 0;
    
    //ALU input selector 
    bit [1:0] _a_select; //ALU input a selector (reg a, PC, current_PC) 
    bit [1:0] _b_select; //ALU input a selector (reg b, imm)
    
    //ALU output selector 
    bit [2:0] _c_select; //ALU output mux (ALU_out, imm, REGFILE[rs1], PC)
    
    //Program counter selectors and enable
    bit [1:0] _next_PC_select; //select next PC output (PC+4, ALU_out, c, PC)
    bit _PC_enable; //enable write to pc
    bit _current_PC_enable; //current pc enable
    bit _IR_enable; //enable write to instruction register
    
    //REGFILE data
    bit _wb; //enable write to regfile
    bit _m2r_select; //memory to register
    
    bit [3:0] _alu_operation; //ALU selector signals
    
    bit [3:0] we_data; //enable for memory
   
    bit [31:0] _imm; //immideate selector
    
    bit _c_enable; //?????
    
    always_comb begin
////////////////////////////////////////    
//Immediate decode according to opcode//
///////////////////////////////////////
        case(_opcode)
            7'b0100011: _imm <= {{20{INST_REG[31]}}, INST_REG[31:25], INST_REG[11:7]}; //S type store
            7'b1100011: _imm <= {{20{INST_REG[31]}}, INST_REG[31:25], INST_REG[11:8], 1'b0}; //B type branch
            7'b0010011: _imm <= {{20{INST_REG[31]}}, {INST_REG[31:20]}}; //I type (imm_alu_op or load or jalr)
            7'b1100111: _imm <= {{20{INST_REG[31]}}, {INST_REG[31:20]}}; //I type (imm_alu_op or load or jalr)
            7'b0000011: _imm <= {{20{INST_REG[31]}}, {INST_REG[31:20]}}; //I type (imm_alu_op or load or jalr)
            7'b0110111:  _imm <=  {{INST_REG[31:12]}, {12'b000000000000}}; //U type (LUI or AUI)
            7'b0010111: _imm <=  {{INST_REG[31:12]}, {12'b000000000000}}; //U type (LUI or AUI)
            7'b1101111: _imm <= {{12{INST_REG[31]}}, INST_REG[19:12], INST_REG[20], INST_REG[30:25], INST_REG[24:21], 1'b0}; // j type jal
            7'b1110011, 7'b0110011: _imm <= 7'b0; // r type (csr, reg_alu_op)
            default: _imm <= 7'b0;           
        endcase
///////////////////////////////////////////////////        
//ALU selector data according to 'func3', 'func7'//
/////////////////////////////////////////////////// 
/*
NOTE FOR FUTURE UPGRADE: in case of pipeline needs to be updated since control transfer instructions require their own adder
TODO: add to all conditional branch instructions (T == DECODE) ? 4'b0000 : 4'b????; 
*/
        case(_opcode)
            7'b1100011:begin //If conditional branch instructions
                 case (_funct3)
                     3'b000: _alu_operation <= (T == DECODE) ? 4'b0000 : 4'b1000; // equale (if state is decode select addition for calculating address)
                     3'b001: _alu_operation <= 4'b1001; //not equale
                     3'b100: _alu_operation <= 4'b0011; //less
                     3'b101: _alu_operation <= 4'b1010; //greater
                     3'b110: _alu_operation <= 4'b1011; //less then unsigned
                     3'b111: _alu_operation <= 4'b1100; //greater then unsigned
                     default: _alu_operation <= 4'b0000;       
                 endcase
            end   
            7'b1101111: _alu_operation <= 4'b0000; // jal instructions special case
            7'b0110011, 7'b0010011: begin // all other instructions (excluding control transfer instructions)
                 case (_funct3)
                     3'b000: _alu_operation <= _funct7[5] ? 4'b0001 : 4'b0000; // add / sub
                     3'b001: _alu_operation <= 4'b0010; //shiftleft
                     3'b010: _alu_operation <= 4'b0011; // lessthen
                     3'b011: _alu_operation <= 4'b1011;  //sltu
                     3'b100: _alu_operation <= 4'b0100; //xor
                     3'b101: _alu_operation <= _funct7 ? 4'b0101 : 4'b0110; //srl / sra
                     3'b110: _alu_operation <=  4'b0111;//or
                     3'b111: _alu_operation <=  4'b1000; //and 
                     default: _alu_operation <= 4'b0000;        
                 endcase
            end
            default: _alu_operation <= 4'b0000; 
        endcase
 
 //////////////////
 //SELECT SIGNALS//
 //////////////////
 /*
 SELECT SIGNALS:
 _a_select (reg a, PC, current_PC) 
 _b_select (reg b, imm) 
 _PC_enable (off, on)
 _next_PC_select (PC+4, ALU_out, c, PC)
 _IR_enable (off, on)
 _c_select (ALU_out, imm, REGFILE[rs1], PC)
 _wb (off, on)
  _current_PC_enable (off, on) 
 _m2r_select ( from reg c , from memory)
 we_data (off, on)
 _c_enable (off, on) ???
 
 NOTES FOR SELECT SIGNALS:
 - IMPORTANTE qa <= regfile[rs1] and qa <= regfile[rs2] is always on (no select signal)
 - some pseudo instructions could be faster for one cycles 
 - does c signal really need to be 2 bit?
 - c enable cant remamber if its esssential
 - I overdone it with defaults cause I keeep getting bugs, now that it is bug free unnecessery defaults should be removed
 - IMPORTANTE store halfword and byte is not done
 - IMPORTANTE tested all opcodes, but not individual instructions (in theory should work)
 - IMPORTANTE program counter has its own adder (while debugging branch instructions found out to be simpler solution)
 */              
        //default cases for operations 
        _a_select <= 2'b00; 
        _b_select <= 2'b00; 
        _PC_enable <= 1'b1; 
        _next_PC_select <= 2'b01; 
        _IR_enable <= 1'b0;
        _c_select <= 3'b010; 
        _wb <= 1'b0;
        _current_PC_enable <= 1'b1; 
        _m2r_select <= 1'b0;
        we_data <= 4'b0000;  
        _c_enable <= 1'b1;    
        
        //
        case(T)
            FETCH:begin
                _IR_enable <= 1'b1;
                _PC_enable <= 1'b1; //select PC <= next_PC regtype
                _next_PC_select <= 2'b00; // pc <= pc_plus_4
                _current_PC_enable <= 1'b1; //on
                _a_select <= 2'b00; //PC
                _b_select <= 2'b01; //imm
                _c_select <= 3'b010; // save jump adress to registar c
                _m2r_select <= 1'b0; //c to reg
                we_data <= 4'b0000;  //off memory
            end
            DECODE:begin
                case(_opcode)
                    7'b0010011:begin  //imm
                        _b_select <= 2'b01; //imm
                        _a_select <= 2'b00; // 0
                        _PC_enable <= 1'b0; //no nextPC select
                        _c_select <= 3'b000; //REG_FILE[rs] //reg file  for pseudo mv ,goes to writeback if rs = 0 TODO
                        _next_PC_select <= 2'b00; // pc <= pc_plus_4
                    end
                    7'b0110011:begin //reg
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b00; //qa
                        _PC_enable <= 1'b0; //no nextPC select
                        _next_PC_select <= 2'b00; // pc <= pc_plus_4
                    end
                    7'b0110111: begin //lui
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b00; //qa
                        _PC_enable <= 1'b0; //no nextPC select
                        _c_select <= 3'b011; //immmediate regtype
                        _next_PC_select <= 2'b00; // pc <= pc_plus_4   
                    end
                    7'b0010111:begin //aui
                        _a_select <= 2'b10; //current_PC
                        _b_select <= 2'b01; //imm
                        _next_PC_select <= 2'b00; //pc + 4
                        _PC_enable <= 1'b0; // write enable to pc (PC <= ALU_out)
                        _c_select <= 3'b001; //write to c       
                    end
                    7'b1110011: begin //csr
                        _a_select <= 2'b01; //qa
                        _b_select <= 2'b01; //imm
                     end
                    7'b1100011:begin //branch
                        _a_select <= 2'b01; //PC
                        _b_select <= 2'b01; //imm
                        _c_select <= 3'b001; // save jump adress to registar c
                        _PC_enable <= 1'b0;
                        _next_PC_select <= 2'b00; // pc <= pc_plus_4       
                    end
                    7'b0000011: begin  //load
                        _b_select <= 2'b01; //imm
                        _a_select <= 2'b01;
                        _PC_enable <= 1'b0; //no nextPC select
                        _c_select <= 3'b000; //REG_FILE[rs] //reg file  for pseudo mv ,goes to writeback if rs = 0 TODO
                        _next_PC_select <= 2'b00; // pc <= pc_plus_4
                        //qa <= regfile[rs1] and qa <= regfile[rs2] is done regardlessly
                    end //load 
                    7'b0100011:begin 
                        _PC_enable <= 1'b0; //store //qa <= regfile[rs1] and qa <= regfile[rs2] is done regardlessly
                        _a_select <= 2'b00;
                        _b_select <= 2'b00;
                    end//jalr
                    7'b1100111: begin
                        _a_select <= 2'b01;
                        _b_select <= 2'b01;
                        _PC_enable <= 1'b0; 
                    end  
                    7'b1101111: begin //jal
                       _a_select <= 2'b01; //PC
                       _b_select <= 2'b01; //imm
                       _c_select <= 3'b100; // save jump adress to registar c
                       _next_PC_select <= 2'b01; //redirect alu_out to pc
                       _PC_enable <= 1'b1; 
                    end 
                    default:begin
                        _a_select <= 2'b01; //PC
                        _b_select <= 2'b10; //constant 4
                        _PC_enable <= 1'b1; // PC <= ALU_out 
                        _next_PC_select <= 2'b00; //redirect alu_out to pc
                        _c_select <= 3'b010; // save jump adress to registar c
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
                        _c_select <= 3'b001; // write to c
                        _PC_enable <= 1'b0;
                     end
                    7'b0110011:begin //reg
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b00; //qb
                        _c_select <= 3'b001; //write to c
                        _PC_enable <= 1'b0;
                    end
//                    7'b1110011: ; //csr
                    7'b1100011:begin //branch
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b00; //qb
                        _next_PC_select <= 2'b10; //redirect c to pc
                        _PC_enable <= alu_flag ? 1'b1 : 1'b0;       
                    end
                    7'b0000011:begin //load
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b01; //imm
                        _PC_enable <= 1'b0;
                        _c_select <= 3'b001;     
                        _m2r_select <= 1'b0;                    
                    end
                    7'b0100011:begin  //store
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b01; //imm
                        _PC_enable <= 1'b0;
                        _c_select <= 3'b001;
                        _m2r_select <= 1'b0;    
                    end
                    7'b1100111:begin  //jalr
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b01; //imm
                        _c_select <= 3'b010; //c = pc + 4
                        _next_PC_select <= 2'b01; //redirect alu_out to pc
                        _PC_enable <= 1'b1; // enable write to pc
                    end    
                    7'b0010011:begin 
                        _a_select <= 2'b01; //qa
                         _b_select <= 2'b01; //imm
                    end //sssrli // b = rs2 TODO
                    default:begin
                        _a_select <= 2'b01; //qa
                        _b_select <= 2'b10; //constant 4
                        _PC_enable <= 1'b0; // PC <= ALU_out 
                        _next_PC_select <= 2'b00; //redirect alu_out to pc
                        _c_select <= 3'b010; // save jump adress to registar c
                        _wb <= 0;
                        _current_PC_enable <= 1'b0;
                        _IR_enable <= 1'b0;
                        we_data <= 4'b0000; 
                    end    
                endcase 
             end
             MEMORY:begin                  
               case(_opcode)
                    7'b0000011:begin _m2r_select <= 1'b0; _PC_enable <= 1'b0; _a_select <= 2'b00; _b_select <= 2'b00; end //load 
                    7'b0100011:begin //store
                        _PC_enable <= 1'b0;
                        we_data <= 4'b1111;
						_m2r_select <= 1'b0;
						_a_select <= 2'b00;
                        _b_select <= 2'b01;		
                    end    
                    default:begin
                        _a_select <= 2'b00; //PC
                        _b_select <= 2'b10; //constant 4
                        _PC_enable <= 1'b0; // PC not enabled
                        _next_PC_select <= 2'b00; //redirect alu_out to pc
                        _c_select <= 3'b010; // save jump adress to registar c
                        _wb <= 0;
                        _current_PC_enable <= 1'b0;
                        _IR_enable <= 1'b0;
                        we_data <= 4'b0000; 
                    end    
               endcase 
             end
             WRITE_BACK:begin
                     _a_select <= 2'b00;
                     _b_select <= 2'b00;
                     we_data <= 4'b0000;   
                     _wb <= 1'b1;
                     _PC_enable <= 1'b0;
                     _current_PC_enable <= 1'b0; 
                 if (_opcode == 7'b0000011)begin 
                    _m2r_select <= 1'b0; 
                    _a_select <= 2'b00;
                    _b_select <= 2'b00;
                 end else begin
                    _m2r_select <= 1'b1;
                    _a_select <= 2'b00;
                    _b_select <= 2'b00;
                 end   
             end
             default:begin
                 _a_select <= 2'b01; //qa
                 _b_select <= 2'b01; //imm
             end              
        endcase
        
 /////////////////   
 //state machine//
 /////////////////
 /*
 NOTES ON STATE MACHINE:
 - during debugging this proved as best method for statemachine (seperate case statements from mux and enable signals)
 - should be put in seperate module 
 */
 //default states           
        next_state <= FETCH; //set default state
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
                        7'b0010111:begin //aui
                           next_state <= WRITE_BACK;
                        end
                        7'b1110011: ; //csr
                        7'b1100011:begin //branch
                            next_state <= EXECUTE;      
                        end
                        7'b0000011: next_state <= EXECUTE; //load
                        7'b0100011: next_state <= EXECUTE; //store
                        7'b1100111: next_state <= EXECUTE; //jalr
                        7'b1101111: begin //jalr
                           next_state <= (_rd == 5'b00000) ?  FETCH : WRITE_BACK; //pseudo  jump
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
                        7'b0000011: next_state <= MEMORY; //load
                        7'b0100011: next_state <= MEMORY; //store
                        7'b1100111: begin  //jalr
                           next_state <= WRITE_BACK;
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
///////////////////
//NET ASSIGNMENTS//
//////////////////
    //destination and source   
    assign rd = _rd;
    assign rs1 = _rs1;
    assign rs2 = _rs2;
    
    assign imm = _imm; //immediate
    assign alu_operation = _alu_operation; //ALU operation
    //select signals
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
