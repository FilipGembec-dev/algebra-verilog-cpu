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
//    bit [31:0] next_PC; 

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
	
	//setting two regfile outputs
	wire [31:0] qa <= (rs1==0) ? 0 : REG_FILE[rs1];
    wire [31:0] qb <= (rs2==0) ? 0 : REG_FILE[rs2];
	
	//set operation registers
	reg [31:0] a;
	reg [31:0] b;
	reg [31:0] c;
	
	//load store wires
	wire [31:0] address  = 32'b0;
	wire [3:0] write_enable = 4'b0000;
	
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
                    32'd1 : begin //INSTR decode
                        if(imm_alu_op | reg_alu_op | branch_op )begin //in case of ALU and branch instructions
                            a <= qa
                            b <= qb
                            c <= $signed({20{imm_B[31], imm_B}});
                            T <= T + 1;
                        end else begin
                            case (1'b1)
                                jal:begin
									if(rd == 1'b0)begin //pseudo-instruction jump 1 cycle
                                        PC <= PC + $signed({12{imm_J[31], imm_J}});
                                        T <= 0;
									end	else begin //JAL part
										c <= PC_plus_4;
										PC <= PC + $signed({12{imm_J[31], imm_J}});
										T <= T + 2;
									end
										
                                end
                                jalr:begin
                                        c <= PC_plus_4;
                                        PC <= qa + {20{imm_I[31], imm_I}};
                                        T <= T + 2;
                                    end
                                auipc: ;
                            endcase
                        end
                           
                    end
                    32'd2: begin // INSTR exe
                        case(1'b1) //change to opcode when inst decode is completed
                            //immediate integer operations
                            (imm_alu_op | reg_alu_op): T <= T + 2;				
                            addi: c <= a + {{20{imm_I[31]}}, imm_I}; //arithmetic ops are just signe-extended to 32 bits
                            slti: c <= $signed(a) < $signed({20{imm_I[31], imm_I}}); //logic operations need $signed function
                            srli: ;
                            srai: ;
                            andi: ;
                            ori: ;
                            xori: ; //note, XORI rd, rs1, -1 performs a bitwise logical inversion of register rs1 (assembler pseudo-instruction NOT rd, rs) 
                            lui: ;
                            auipc: ;
                            //Register-Register operations
                            add: c <= a + b;
                            sub: ;
                            _xor: ;
                            _or: ;
                            _and: ;
                            srl: ;
                            sll: ;
                            slt: ;
							//store instruction adress calculation 
							(sb | sw | sh):	address <= a + {20{imm_I[31], imm_I}};
                            //load-store
                            (load_op | store_op): T <= T + 1; //jump to mem cycle
							jalr:begin PC[0] <= 0; T <= T + 2;  end 
                        endcase
                    end
                    32'd3: begin //memory access state
                        T <= 0;
                        case (1'b1)
                            sb: write_enable <= 4'b0001;                                
                            sh: write_enable <= 4'b0011;
                            sw: write_enable <= 4'b1111;
                            //Load
                            lb: REG_FILE[rd] <= {{24{data_in_data[31]}},data_in_data[31:24]};
                            lh: REG_FILE[rd] <= {{16{data_in_data[31]}},data_in_data[31:16]};
                            lw: REG_FILE[rd] <= data_in_data;
                         endcase        
                    end
                    32'd4: begin // write back state
                        REG_FILE[rd] = c;
                        T <= 0;
                    end
               endcase
               
           end
           else begin       //reset
                PC <= 32'd0;
                T <= 32'd0;
           end
    end
    
    //net assigments
    assign addr_inst = PC[31:3]; //use word adress to read memory
	assign REG_FILE[31] = 32'h00; //register x0 is hardwired to the constant
	assign we_data = write_enable;
	assign addr_data = adress;

	
endmodule
