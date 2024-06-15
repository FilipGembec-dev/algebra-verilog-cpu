`timescale 1ns / 1ps

module inst_decode#(
    parameter_instruction_space = 32'h0000_ff
    )(
    input[31:0]  INST_REG,
    input aresetn,
    input aclk,
    input alu_flag,
	input [31:0] memory_adress,
	input axi_write_done,
	input axi_read_done,
    output [4:0] rd, rs1, rs2,
    output [31:0] imm,
    output [3:0] alu_operation,
    output [1:0] a_select,
    output [1:0] b_select,
    output [1:0] c_select, 
    output [1:0] next_PC_select,
    output PC_enable, 
    output IR_enable,
    output wb,
    output current_PC_enable,
    output m2r_select,
    output [3:0] _we_data,
	output memory_adress_in_program_space,
	output logic [2:0] T,
	output [6:0] op_code
    );
    //areset zero is low impendence
    bit areset;
  
    //STATES TODO: onehotencoding
    localparam FETCH = 3'b000;
    localparam DECODE = 3'b001;
    localparam EXECUTE = 3'b010;
    localparam MEMORY = 3'b011;
    localparam WRITE_BACK = 3'b100;
	localparam AXI_WAIT = 3'b101;

    //opcodes
    localparam IMM2REG = 7'b0010011;
    localparam REG2REG = 7'b0110011;
    localparam LUI = 7'b0110111;
    localparam AUIPC = 7'b0010111;
    localparam BRANCH = 7'b1100011;
    localparam LOAD = 7'b0000011;
    localparam STORE = 7'b0100011;
    localparam JAL =  7'b1101111;
    localparam JALR = 7'b1100111;
              
    //R-type instruction part decode
    wire [6:0] _opcode = INST_REG [6:0]; assign op_code = _opcode;
    wire [4:0] _rd = INST_REG [11:7];
    wire [2:0] _funct3 = INST_REG [14:12];
    wire [4:0] _rs1 = INST_REG [19:15];
    wire [4:0] _rs2 = INST_REG [24:20];
    wire [6:0] _funct7 = INST_REG [31:25];
	
	//decoding between axi master and native data port
	assign memory_adress_in_program_space = !(memory_adress > parameter_instruction_space);

    
    //state machine data
    bit [2:0] next_state;
    //bit[2:0] T = 0;
    
    //ALU input selector 
    bit [1:0] _a_select; //ALU input a selector (reg a, PC, current_PC) 
    bit [1:0] _b_select; //ALU input a selector (reg b, imm)
    
    //ALU output selector 
    bit [1:0] _c_select; //ALU output mux (ALU_out, imm, REGFILE[rs1], PC)
    
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
    
    always_comb begin
        ////////////////////////////////////////    
        //Immediate decode according to opcode//
        ///////////////////////////////////////
        case(_opcode)
            STORE: _imm <= {{20{INST_REG[31]}}, INST_REG[31:25], INST_REG[11:7]}; //S type store
            BRANCH: _imm <= {{20{INST_REG[31]}}, INST_REG[31:25], INST_REG[11:8], 1'b0}; //B type branch
            IMM2REG: _imm <= {{20{INST_REG[31]}}, {INST_REG[31:20]}}; //I type (imm_alu_op or load or jalr)
            JALR: _imm <= {{20{INST_REG[31]}}, {INST_REG[31:20]}}; //I type (imm_alu_op or load or jalr)
            LOAD: _imm <= {{20{INST_REG[31]}}, {INST_REG[31:20]}}; //I type (imm_alu_op or load or jalr)
            LUI:  _imm <=  {{INST_REG[31:12]}, {12'b000000000000}}; //U type (LUI or AUI)
            AUIPC: _imm <=  {{INST_REG[31:12]}, {12'b000000000000}}; //U type (LUI or AUI)
            JAL: _imm <= {{12{INST_REG[31]}}, INST_REG[19:12], INST_REG[20], INST_REG[30:25], INST_REG[24:21], 1'b0}; // j type jal
            REG2REG: _imm <= 7'b0; // r type (csr, reg_alu_op)
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
            BRANCH:begin 
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
            JAL: _alu_operation <= 4'b0000; //noit needed 
            REG2REG, IMM2REG: begin 
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
        //default cases for operations ##MARINE JEBO GA BOG 0## ovo u initial
        _a_select <= 2'b00; 
        _b_select <= 2'b00; 
        _PC_enable <= 1'b0; 
        _next_PC_select <= 2'b00; 
        _IR_enable <= 1'b0;
        _c_select <= 2'b00; 
        _wb <= 1'b0;
        _current_PC_enable <= 1'b0; 
        _m2r_select <= 1'b0;
        we_data <= 4'b0000;  
        
        case(T)
            FETCH:begin
                _IR_enable <= 1'b1;
                _PC_enable <= 1'b1; //select PC <= next_PC regtype
                _next_PC_select <= 2'b00; // pc <= pc_plus_4
                _current_PC_enable <= 1'b1; //on
            end
            DECODE:begin
                case(_opcode)
                    IMM2REG:_c_select <= 2'b11; //imm - c <= imm - signal 
                    7'b0110111: _c_select <= 2'b11; //lui - c <= imm - signal;
                    7'b0010111:begin 
                        _a_select <= 2'b10; //current_PC
                        _b_select <= 2'b01; //imm
                        _c_select <= 3'b01; //write to c       
                    end
                    BRANCH:begin 
                        _a_select <= 2'b01; //PC
                        _b_select <= 2'b01; //imm
                        _c_select <= 2'b01; // save jump adress to registar c       
                    end
                    JAL: begin 
                       _a_select <= 2'b10; //current_PC
                       _b_select <= 2'b01; //imm
                       _c_select <= 3'b010; // save PC to registar c
                       _next_PC_select <= 2'b01; //redirect alu_out to pc
                       _PC_enable <= 1'b1; 
                    end 
                    default:begin
                        _a_select <= 2'b00; 
                        _b_select <= 2'b00; 
                        _PC_enable <= 1'b0; 
                        _next_PC_select <= 2'b00; 
                        _c_select <= 2'b00; 
                        _wb <= 0;
                        _current_PC_enable <= 1'b0;
                        _IR_enable <= 1'b0;
                        we_data <= 4'b0000;  
                    end    
                 endcase
            end         
            EXECUTE:begin    
                case(_opcode)
                    IMM2REG:begin  
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b01; //imm
                        _c_select <= 2'b01; // write to c
                     end
                    REG2REG:begin 
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b00; //qb
                        _c_select <= 2'b01; //write to c
                    end
                    BRANCH:begin 
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b00; //qb
                        _next_PC_select <= 2'b10; //redirect c to pc
                        _PC_enable <= alu_flag ? 1'b1 : 1'b0;       
                    end
                    LOAD:begin 
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b01; //imm
                        _c_select <= 2'b01;     
                        _m2r_select <= 1'b0;                    
                    end
                    STORE:begin  
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b01; //imm
                        _c_select <= 2'b01;
                        _m2r_select <= 1'b0;    
                    end
                    JALR:begin  
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b01; //imm
                        _c_select <= 2'b10; //c <= PC (following pc)
                        _next_PC_select <= 2'b01; //redirect alu_out to pc
                        _PC_enable <= 1'b1; // enable write to pc
                    end    
                    default:begin
                        _a_select <= 2'b00; 
                        _b_select <= 2'b00; 
                        _PC_enable <= 1'b0; 
                        _next_PC_select <= 2'b00; 
                        _c_select <= 2'b00; 
                        _wb <= 0;
                        _current_PC_enable <= 1'b0;
                        _IR_enable <= 1'b0;
                        we_data <= 4'b0000; 
                    end    
                endcase 
             end
             MEMORY:begin                  
               case(_opcode)
                    STORE:begin//store_comb_logic #GEMB MAKNI ME#
						we_data <= memory_adress_in_program_space ? 4'b1111 : 4'b0000;
                    end
                    LOAD:begin//load_comb_logic #GEMB MAKNI ME"
                       
                    end
                    default:begin
                        _a_select <= 2'b00; //qa
                        _b_select <= 2'b10; //constant 4
                        _PC_enable <= 1'b0; // PC not enabled
                        _next_PC_select <= 2'b00; //redirect alu_out to pc
                        _c_select <= 3'b000; // save jump adress to registar c
                        _wb <= 1'b0;
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
                 if (_opcode == LOAD)begin 
                    _m2r_select <= 1'b1; 
                 end else begin
                    _m2r_select <= 1'b0;
                 end   
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
            FETCH: next_state <= DECODE;
            DECODE:begin
                case(_opcode)
                    IMM2REG:begin next_state <= (_rd == 5'b00000) ?  EXECUTE : WRITE_BACK; end 
                    LUI: next_state <= WRITE_BACK;                     
                    AUIPC: next_state <= WRITE_BACK;                          
                    BRANCH:next_state <= EXECUTE;      
                    LOAD: next_state <= EXECUTE; 
                    STORE: next_state <= EXECUTE; 
                    JALR: next_state <= EXECUTE; 
                    JAL: begin next_state <= (_rs1 == 5'b00000) ?  FETCH : WRITE_BACK; end //jal
                    default: next_state <= FETCH;    
                 endcase
            end         
            EXECUTE:begin    
                case(_opcode)
                    IMM2REG: next_state <= WRITE_BACK;  
                    REG2REG: next_state <= WRITE_BACK;                      
                    BRANCH: next_state <= FETCH;                            
                    LOAD: next_state <= MEMORY; 
                    STORE: next_state <= MEMORY; 
                    JALR: next_state <= WRITE_BACK;
                    default:next_state <= WRITE_BACK;                               
                endcase 
            end
            MEMORY:begin    
                case(_opcode)
                    LOAD:begin
                        next_state <= memory_adress_in_program_space ? WRITE_BACK : AXI_WAIT;
                    end  
                    STORE:begin
                        next_state <= memory_adress_in_program_space ? FETCH : AXI_WAIT;
                    end
                    default: next_state <= FETCH;
                 endcase 
            end
			AXI_WAIT: begin//GEMBTODO#0 -> napravit malo energetski optimiziraniju logiku za ovo
				case(_opcode)
                    LOAD:begin
                        next_state <= axi_read_done ? WRITE_BACK : AXI_WAIT;
                    end  
                    STORE:begin
                        next_state <= axi_write_done ? FETCH : AXI_WAIT;
                    end
                    default: next_state <= FETCH;
                 endcase 
				
			end
            WRITE_BACK: next_state <= FETCH;  
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
    assign c_select = _c_select; 
    assign PC_enable = _PC_enable; 
    assign wb = _wb;
    assign next_PC_select = _next_PC_select;
    assign IR_enable = _IR_enable;
    assign current_PC_enable = _current_PC_enable;
    assign m2r_select = _m2r_select;
    assign _we_data = we_data;
    
    
endmodule
