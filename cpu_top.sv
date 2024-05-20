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
    typedef enum logic [31:0] {ADDI = 32'h1, SLTI = 32'h2, ANDI = 32'h4, ORI = 32'h8, XORI = 32'h10, LUI = 32'h20, AUIPC = 32'h40, SLLI = 32'h80, SRLI = 32'h100,
                             SRAI = 32'h200, ADD = 32'h400, SUB = 32'h800,_XOR = 32'h1000, _OR = 32'h2000, _AND = 32'h4000, SLL = 32'h8000, SRL = 32'h10000,
                             SLT = 32'h20000, LB = 32'h40000, LH = 32'h80000, LW = 32'h100000, SB = 32'h200000, SH = 32'h400000, SW = 32'h800000,
                             JAL = 32'h1000000, JALR = 32'h2000000, BEQ = 32'h4000000 ,BEN = 32'h8000000, BLT = 32'h10000000, BGE = 32'h20000000, 
	                         BLTU = 32'h40000000, BGEU = 32'h80000000} e_operations;
    
    //inst_decode wires
    wire[11:0] imm_I; 
    wire[6:0] imm_S, imm_B;
    wire[19:0] imm_U, imm_J;
    wire [4:0] rd, rs1, rs2;
    wire jump_ops;
    
    //signextended in multiples of two(first two LSB killed)
    wire[31:0] sig_imm_I = { { 21{imm_I[11]} }, imm_I [11:1]};  
    wire[31:0] sig_imm_B = {{25{1'b0}},imm_B[6:1]}; 
    wire[31:0] sig_imm_J = { { 13{imm_J[19]} }, imm_J[19:1]};
    
    localparam c_register_file_len = 5; // rv32i has 31 general-purpose registers x1-x31, which hold integer values
    //register file
    bit [31:0] REG_FILE [c_register_file_len - 1 : 0];
    //program counter -> PC
    reg [31:0] PC = 32'd0;
    //instruction reg -> INST_REG
    bit [31:0] INST_REG = 32'd0;
    
	//TO DO: FENCE, FENCE.1, ECALL, EBREAK
	
	//setting regfile readports
    reg [31:0] qa;
	reg [31:0] qb;
	
    //registes for extra control  
	logic [31:0] current_PC;
	logic [31:0] c;
	
	//load store wires
	bit [31:0] _addr_data  = 32'b0;
	bit [2:0]  _we_data = 4'b0000;
	
	//decode settings
	bit [31:0] next_PC; //next_PC wire
	bit [4:0] dest_rn = rd; //TODO: redundant 
	logic [31:0] a; //adder port A TODO: rename to alu_B
	logic [31:0] b;  //adder port B TODO: rename to alu_B
	logic [31:0] ALU_out; //adder out port     
	//muxes and alu combo
	    
	      
	      
	      
	  
	 //assign enum to state tracker 
     e_states T;
     e_operations operation;
    //combinational part - muxes (no registers or elements with clock)        
    always@(T, operation)begin
    //set defult states for no latches
        next_PC <= ALU_out;
        a <= PC;
        b <= 31'd4;
        ALU_out <= a + b;
    //work part     
	   case(T)
	       FETCH:begin
	           next_PC <= ALU_out;
               a <= PC;
               b <= 31'd4;
               ALU_out <= a + b; //set all for PC = PC + 4    
	       end
	       DECODE:begin
	           if(jump_ops)begin //in case of ALU and branch instructions
                            case (operation)
                                JAL:begin
									if(dest_rn == 1'b0)begin //pseudo-instruction jump 1 cycle
                                        a <= PC;
                                        b <=  sig_imm_J;
								        ALU_out <= a + b; // set all for PC = PC + imm_J (sequential part goes to fetch) 
								    end	else begin //JAL part
								        b <=  sig_imm_J;
								        a <= current_PC; //TODO:check might be wrong
										ALU_out <= a + b; //set all for PC = PC + imm_J  (sequential part goes to execute)
								    end	
                                end
                                JALR:begin
                                    //TODO: This is incomplete
                                    ALU_out <= a + b;
                                end
                                AUIPC: begin 
                                    //PC <= PC + {imm_U,{12'b0}}; //U-immediate in register rd (lowest 12 bits are zeroes) TODO: check!
                                end
                                LUI: begin
                                    //c <= {imm_U,{12'b0}}; //U-immediate in register rd (lowest 12 bits are zeroes)  TODO: check!
                                end
                            endcase
                        end else begin
                                           //no combinational for this part
                        end                      
	       end
	       EXECUTE: begin
                case(operation) //change to opcode when inst decode is completed
                            //immediate integer operations
                            ADDI: begin
                                a <= qa;
                                b <= sig_imm_I;
                                ALU_out <= a + b; //set for c = qa + imm_I (c is register that is rewired in sequential part)
                            end
                            SLTI: begin //writes 1 or 0 to reg[rd] depending on a<b 
                                a <= qa;
                                b <= sig_imm_I;
                                ALU_out <= $signed(a) < $signed(b); //set c = qa < imm_I (logic operations need $signed function)
                            end
                            SRLI: ;
                            SRAI: ;
                            ANDI: ;
                            ORI: ;
                            XORI: ; //note, XORI rd, rs1, -1 performs a bitwise logical inversion of register rs1 (assembler pseudo-instruction NOT rd, rs) 
                            LUI: ;
                            AUIPC:begin 
                                // ALU_out <= PC; TODO
                            end
                            //Register-Register operations
                            ADD: begin
                                a <= qa;
                                b <= qb;
                                ALU_out <= a + b; //set registers for c = a + b (c is register that is rewired in sequential part)
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
							     a <= qa;
							     b <= sig_imm_I; 
							     ALU_out <= a + b;
							 end    
							JALR: begin // TODO
						    end 
                        endcase	
           end                     
	       MEMORY: ;
	   endcase
	end  
    //
    //
    //     SEQUENTIAL LOGIC PART
    //
    //    
    always@(posedge aclk)begin 
           if(aresetn)begin //work
               case(T)
                    FETCH : begin //INSTR fetch
                        INST_REG <= data_in_inst;
                        current_PC <= PC; //save current PC to register for control instructions 
                        PC <= next_PC; //save next_PC to PC
                        T <= DECODE;               
                    end
                    DECODE : begin //INSTR decode
                        if(jump_ops)begin //in case of ALU and branch instructions
                            case (operation)
                                JAL:begin
									if(dest_rn == 1'b0)begin //pseudo-instruction jump 1 cycle
									   next_PC <= ALU_out;  //this is actually comb
                                       T <= FETCH;                             
								    end	else begin //JAL part
								       next_PC <= ALU_out; //this is actually comb
									   T <= EXECUTE;
								    end	
                                end
                                JALR:begin
                                    T <= MEMORY; // TODO: not done
                                end
                                AUIPC: begin 
                                    T <= EXECUTE; // TODO: not done
                                end
                                LUI: begin
                                    T <= WRITE_BACK; // TODO: not done
                                end
                            endcase
                        end else begin // in case of ALU r to r 
                            //setting regfile readports for ALU operations
                            qa <= (rs1==0) ? 0 : REG_FILE[rs1];
                        	qb <= (rs2==0) ? 0 : REG_FILE[rs2];
                            T <= EXECUTE;                            
                        end
                           
                    end
                    EXECUTE: begin // INSTR exe                    
                        case(operation) //change to opcode when inst decode is completed
                            //immediate integer operations
                            ADDI: begin
                                c <= ALU_out; 
                                T <= WRITE_BACK; //load and go to write
                            end
                            SLTI: begin
                                c <= ALU_out;
                                T <= WRITE_BACK; //load and go to write
                            end
                            SRLI: ;
                            SRAI: ;
                            ANDI: ;
                            ORI: ;
                            XORI: ; //note, XORI rd, rs1, -1 performs a bitwise logical inversion of register rs1 (assembler pseudo-instruction NOT rd, rs) 
                            LUI: ;
                            AUIPC:begin
                                 c <= ALU_out; 
                                 T <= WRITE_BACK; //load and go to write
                            end
                            //Register-Register operations
                            ADD: begin
                                c <= ALU_out;
                                T <= WRITE_BACK; //load and go to write
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
                                 c = ALU_out;
							     T = MEMORY; //load and go to write
							 end    
							JALR: begin 
//						         PC[0] <= 0; 
						         T <= WRITE_BACK; //load and go to write
						    end 
                        endcase
                    end
                    MEMORY: begin //memory access state
                    //TO DO: this needs to be redone but this is general scheme
                //                        case (operation)
//                            SB: _we_data <= 4'b0001;                                
//                            SH: _we_data <= 4'b0011;
//                            SW: _we_data <= 4'b1111;
//                            //Load
//                            LB: REG_FILE[dest_rn] <= {{24{data_in_data[31]}},data_in_data[31:24]};
//                            LH: REG_FILE[dest_rn] <= {{16{data_in_data[31]}},data_in_data[31:16]};
//                            LW: REG_FILE[dest_rn] <= data_in_data;
//                         endcase
                         T <= FETCH;        
                    end
                    WRITE_BACK: begin // write back state
                        REG_FILE[dest_rn] <= c; //write back and go to first state
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
	
	//instantiations
	 inst_decode my_inst( .data_in_inst,
     .operation,
     .imm_I, 
     .imm_S , .imm_B ,
     .imm_U , .imm_J,
     .rd, .rs1, .rs2,
     .jump_ops
     );


	
endmodule
