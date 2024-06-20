`timescale 1ns / 1ps

module cpu_top#(
    //parameter list
    parameter_instruction_space = 32'h0000_ffff
    )(
    //clocking
    input aclk,
    input aresetn,
    //program instruction port
    output [31:0] addr_inst,
    output [31:0] data_out_inst,
    input [31:0] data_in_inst,
    output  en_inst,
    output [3:0] we_inst,
    //program data port
    output [31:0] addr_data,
    output [31:0] data_out_data,
    input [31:0] data_in_data,
    output en_data,
    output [3:0] we_data,
    //AXI data port
        //AXI data write address port
        output logic [31:0] m_axi_awaddr,
        output logic        m_axi_awvalid,
        input               m_axi_awready,
        //AXI data write data port
        output logic [31:0] m_axi_wdata,
        output logic [3:0]  m_axi_wstrb,
        output logic        m_axi_wvalid,
        input               m_axi_wready,
        //AXI data write resp port
        input               m_axi_bresp,
        output logic        m_axi_bready,
        input               m_axi_bvalid,
        //AXI data read address port
        output logic [31:0] m_axi_araddr,
        output logic        m_axi_arvalid,
        input               m_axi_arready,
        //AXI data read data port
        input logic [31:0] m_axi_rdata, //FILIP IT WAS OUTPUT changed to input
        input               m_axi_rvalid,
        output logic        m_axi_rready
    );
    
    //r_enable for load
     wire [3:0] r_enable;
     //enable memory reg
    wire ena;
    //source and destination
    wire [4:0] rd, rs1, rs2;   
    //imm
    wire [31:0] imm;
    //REGFILE PC INSTREG(program register)
    localparam c_register_file_len = 32; // rv32i has 31 general-purpose registers x1-x31, which hold integer values
    bit [31:0] REG_FILE [c_register_file_len - 1 : 0];
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
	wire memory_adress_in_program_space;
	wire [6:0] op_code;
	wire [2:0] T;
	
	
	logic [31:0] axi_loaded_data = 32'd0; //jebiga tu je da se vivado ne žali 	
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
		
		
	end

    //////////////////////////////////////////////////////	
    //WIRES AND MULTIPLEXERS TO REGISTERS SELECT ACTIONS//
    /////////////////////////////////////////////////////
    
	always@(posedge aclk)begin
	   if (aresetn)begin
	       //prepare regfile reg_a and reg_b for operations when there is adress
           reg_a <= (rs1==0) ? 0 : REG_FILE[rs1]; 
           reg_b <= (rs2==0) ? 0 : REG_FILE[rs2];
           //prepare data_reg when theres address
           data_reg <= data_in_data;
                     
             
            case (c_select)
                2'b00: reg_c <= REG_FILE[rs1];
                2'b01: reg_c <= ALU_out;
                2'b10: reg_c <= PC;
                2'b11: reg_c <= imm;		
            endcase
            
            case (PC_enable)
                1'b0:; 
                1'b1: PC <= next_PC;
            endcase
       
            case (wb)
                1'b0: ;
                1'b1: REG_FILE[rd] <= m2r_select ? (memory_adress_in_program_space ? data_reg : axi_loaded_data) : reg_c;
            endcase
            
            case (IR_enable)
                1'b0: ;
                1'b1: INST_REG <= data_in_inst;
            endcase
            
            case(current_PC_enable)
              1'b0: ;
              1'b1: current_PC <= PC;
            endcase
            
            //axi lb lh doesnt work
//            case(r_enable)
//              4'b0001: begin data_reg <= {{24{1'b0}}, data_reg[7:0]}; axi_loaded_data <= {{24{1'b0}}, axi_loaded_data[7:0]}; end
//              4'b0011:  begin data_reg <= {{16{1'b0}}, data_reg[15:0]}; axi_loaded_data <= {{24{1'b0}}, axi_loaded_data[7:0]}; end
//              4'b1111:  begin data_reg <= data_in_data; axi_loaded_data <= m_axi_rdata; end
//              default: begin data_reg <= data_in_data; axi_loaded_data <= m_axi_rdata; end
//            endcase

            case(r_enable)
              4'b0001: begin data_reg <= {{24{1'b0}}, {data_in_data[7:0]}};end
              4'b0011:  begin data_reg <= {{16{1'b0}}, {data_in_data[15:0]}};end
              4'b1111:  begin data_reg <= data_in_data;end
              default: begin data_reg <= data_in_data;end
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
	assign REG_FILE[0] = 32'h00; //register x0 is hardwired to the constant
	assign we_data = _we_data;
	assign en_data = ena;
	
	initial begin
	       m_axi_bready <= 1'b0;
	       m_axi_awvalid <= 1'b0;
	       m_axi_wvalid <= 1'b0;
	       m_axi_arvalid <= 1'b0;
	       m_axi_rready <= 1'b0;	
	       m_axi_awaddr <= 32'd0;
	       m_axi_wdata <= 32'd0;
	       m_axi_araddr <= 32'd0;
	end
	//axi master state machine
	logic axi_write_done = 1'b0;
	assign m_axi_wstrb = 4'b1111;
	//AXI MASTER WRITE
	enum{
	   AXI_WRITE_STANDBY,
	   AXI_WRITE_ADDR,
	   AXI_WRITE_DATA,
	   AXI_WRITE_RESP
	} AXI_WRITE_STATE;
	
	always@(posedge aclk)begin
	   if(aresetn)begin
	       case(AXI_WRITE_STATE)
	           AXI_WRITE_STANDBY:begin //scan for write instruction
	               axi_write_done = 1'b0;
	               if(T == decoder_inst.MEMORY & op_code == decoder_inst.STORE & !memory_adress_in_program_space)begin
	                   AXI_WRITE_STATE <= AXI_WRITE_ADDR; //go to axi write addr state
	                   m_axi_awvalid <= 1'b1; //serve write addres valid
	                   m_axi_awaddr <= memory_adress; //serve write address  
	               end
	           end
	           AXI_WRITE_ADDR:begin
	               if(m_axi_awvalid & m_axi_awready)begin
	                   AXI_WRITE_STATE <= AXI_WRITE_DATA; //go to axi write data state
	                   m_axi_awvalid <= 1'b0; //reset write address valid 
	                   m_axi_wvalid <= 1'b1; //serve write data valid
	                   m_axi_wdata <= reg_b; //serve write data 
	               end
	           end
	           AXI_WRITE_DATA:begin
	               if(m_axi_wvalid & m_axi_wready)begin
	                   AXI_WRITE_STATE <= AXI_WRITE_RESP; //go to axi write data state
	                   m_axi_wvalid <= 1'b0; //reset write data valid
	                   m_axi_bready <= 1'b1; //set bresp ready
	               end
	           end
	           AXI_WRITE_RESP:begin
	               if(m_axi_bready & m_axi_bvalid)begin
	                   AXI_WRITE_STATE <= AXI_WRITE_STANDBY;
	                   m_axi_bready <= 1'b0; //reset bresp ready
	                   axi_write_done = 1'b1; //signal to decoder that the write transaction is done
	               end
	           end
	           default: begin
	               AXI_WRITE_STATE <= AXI_WRITE_STANDBY;
	               m_axi_bready <= 1'b0;
	               m_axi_awvalid <= 1'b0;
	               m_axi_wvalid <= 1'b0;
	               
	           end
	       endcase    
	   end
	   else begin
	       AXI_WRITE_STATE <= AXI_WRITE_STANDBY;
	       axi_write_done <= 1'b0;
	       m_axi_bready <= 1'b0;
	       m_axi_awvalid <= 1'b0;
	       m_axi_wvalid <= 1'b0;
	   end
	end
	//AXI MASTER READ
	logic axi_read_done = 1'b0;
	
	enum{
	   AXI_READ_STANDBY,
	   AXI_READ_ADDR,
	   AXI_READ_DATA
	} AXI_READ_STATE;
	
	always@(posedge aclk)begin
	   if(aresetn)begin
	       case(AXI_READ_STATE)
	           AXI_READ_STANDBY: begin
	               axi_read_done <= 1'b0;
	               if(T == decoder_inst.MEMORY & op_code == decoder_inst.LOAD & !memory_adress_in_program_space)begin
	                   AXI_READ_STATE <= AXI_READ_ADDR;
	                   m_axi_arvalid <= 1'b1; //set valid read address
	                   m_axi_araddr <= memory_adress; //set read address
	               end
	           end
	           AXI_READ_ADDR: begin
	               if(m_axi_arvalid & m_axi_arready)begin
	                   AXI_READ_STATE <= AXI_READ_DATA;
	                   m_axi_arvalid <= 1'b0; //reset valid read address
	                   m_axi_rready <= 1'b1; //set ready read data
	               end
	           end
	           AXI_READ_DATA: begin
	               if(m_axi_rready & m_axi_rvalid)begin
	                   AXI_READ_STATE <= AXI_READ_STANDBY;
	                   axi_read_done <= 1'b1; //signl to decoder that the axi read transaction is done
	                   m_axi_rready <= 1'b0; //reset ready read data
//	                   axi_loaded_data <= m_axi_rdata; //load the data from the read port
	                   case(r_enable)         
	                       4'b0001: begin axi_loaded_data <= {{24{1'b0}}, {m_axi_rdata[7:0]}};end
                           4'b0011:  begin axi_loaded_data <= {{16{1'b0}}, {m_axi_rdata[15:0]}};end
                           4'b1111:  begin data_reg <= m_axi_rdata;end
                           default: begin data_reg <= m_axi_rdata;end
	                   endcase
	               end
	           end
	           default: begin
	               AXI_READ_STATE <= AXI_READ_STANDBY;
	               m_axi_arvalid <= 1'b0;
	               m_axi_rready <= 1'b0;
	           end
	       endcase
	   end
	   else begin
	       AXI_READ_STATE <= AXI_READ_STANDBY;
	       axi_read_done <= 1'b0;
	       m_axi_arvalid <= 1'b0;
	       m_axi_rready <= 1'b0;
	   end
	end
	
	
	//instantiations
	 inst_decode#(
	   .parameter_instruction_space(parameter_instruction_space)
	 ) decoder_inst( .
	 INST_REG,
     .rd, .rs1, .rs2,
     .imm, 
     .alu_operation,
     .aclk,
     .memory_adress,
     .axi_write_done,
     .axi_read_done,
     .a_select,
     .b_select,
     .c_select,
     .next_PC_select, 
     .wb, 
     .alu_flag, 
     .IR_enable, 
     .PC_enable, 
     .current_PC_enable, 
     .m2r_select, 
     ._we_data, 
     .aresetn,
     .memory_adress_in_program_space,
     .T,
     .op_code,
     .r_enable,
     .ena
     );
    
     alu alu_inst_0(.a_i(alu_a), .b_i(alu_b), .c_o(ALU_out), .alu_operation(alu_operation), .alu_flag(alu_flag));
	
endmodule
