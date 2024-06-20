`timescale 1ns / 1ps

module bram_inst(
    input clk,
    input [3:0] we_i,
    input [31:0] data_in_i,
    input [31:0] addr_i,
    output [31:0] data_out_i,

    input ena,
    input [3:0] we_m,
    input [31:0] data_in_m,
    input [31:0] addr_m,
    output [31:0] data_out_m
    );
 
    reg [31:0] data_i [127:0]; //data instruction
    
    reg [31:0] data_m [127:0]; //data memory
    
    initial begin
//imm,reg,jal jalr, aui test
//        data_i[0] <= 32'h00300513; //addi 
//        data_i[1] <= 32'h00300593; //addi 
//        data_i[2] <= 32'h00a586b3; //add
//        data_i[3] <= 32'h00005637; //lui
//        data_i[4] <= 32'h00b6c833; //xor
//        data_i[5] <= 32'h000001797; //aui
//        //data_i[6] <= 32'hfe7ff8ef; //jal
//        data_i[6] <= 32'h00358567; //jalr 
//load store test
//          data_i[0] <= 32'h00400593;
//          //data_i[0] <= 32'b111100000000_00000_000_01011_0000011;
//          data_i[1] <= 32'h00500693;
//          data_i[2] <= 32'hffb6a1a3;  
//          //data_i[0] <= 32'b1111000_01011_01101_010_00000_0100011;
//          data_i[3] <= 32'h0036a603;
          
//branch test
//          data_i[0] <= 32'h00300513;
//          data_i[1] <= 32'h00300593;
//          data_i[2] <= 32'h00a586b3;
//          data_i[3] <= 32'h00300513;
//          data_i[4] <= 32'h00300593;
//          data_i[5] <= 32'h00a586b3;
//          data_i[6] <= 32'hfeb50ae3;

//64bit integer addition
//           data_i[0] <= 32'h00300593;
//           data_i[1] <= 32'h00300613;
//           data_i[2] <= 32'h00300693;
//           data_i[3] <= 32'h00300713;
//           data_i[4] <= 32'h00c50533;
//           data_i[5] <= 32'h00d582b3;
//           data_i[6] <= 32'h00c53333;
//           data_i[7] <= 32'h006285b3;

//jal test
//            data_i[0] <= 32'h00300513;
//            data_i[1] <= 32'h00400593;
//            data_i[2] <= 32'h00a586b3;
//            data_i[3] <= 32'hff9ff06f;
            
//        .global _start
//_start:
	
//	addi a0, zero, 0x3
//	label:
//	add a1, zero, 0x4
//	add a3, a1, a0
//	jal a4, label 

////////////////////////////////////////
// EXTENSIVE TESTING                  //
/////////////////////////////////////// 

//enable 

//	addi a0, zero, 0x5
//	addi a1, zero, 0x3
//	add a3, a1, a0
//	sub a4, a3, a0 
        data_i[0] <= 32'h00500513;
        data_i[1] <= 32'h00300593;
        data_i[2] <= 32'h00a586b3;
        data_i[3] <= 32'h40a68733;
        //addi,add,sub - working

//        slt a1, a0, a3
        data_i[4] <= 32'h00d525b3;
        //slt - working
        
        //slti a2, a0, 0x8
        data_i[5] <= 32'h00852613;
        //slti - working
        
        //lui a0, 0xfffff
	   //sltu a7, a3, a0
	   //slt a6, a3, a0
	   data_i[6] <= 32'hfffff537;
	   data_i[7] <= 32'h00a6b8b3;
	   data_i[8] <= 32'h00a6a833;
	   //lui and sltu - working
	   
	   //auipc a0,0x2
	   data_i[9] <= 32'h00002517;
	   //auipc - working
	   
//	   	and a5, a1, a2
//	    and a6, a0, a2
       data_i[10] <=  32'h00c5f7b3;
       data_i[11] <=  32'h00c57833;
	   //and working
	   
//	     or a5, a1, a2
//       or a6, a0, a2
        
//       and a1, a6, a0

	   data_i[12] <= 32'h00c5e7b3;
	   data_i[13] <= 32'h00c56833;
	   data_i[14] <= 32'h00a875b3;
	   //or working
	   
	   //xor a5, a1, a3
	   data_i[15] <= 32'h00d5c7b3;	
       //xor working
       
//       xori a5, a1, 0x2a
//	   ori a5, a1, 0x3a
//	   andi a5, a1, 0x3f  
       data_i[16] <= 32'h02a5c793;	 
	   data_i[17] <= 32'h03a5e793;
	   data_i[18] <= 32'h03f5f793;		
	   //working
	   
//	   sll a5,a1,a2
//	   srl a5,a1,a2
	
//	   slli a5,a1,0x2
//	   srli a5,a1,0x3
	
//	   srai a5,a1,0x2
       data_i[19] <= 32'h00c597b3;
       data_i[20] <= 32'h00c5d7b3;
       
       data_i[21] <= 32'h00259793;
       data_i[22] <= 32'h0035d793;
       data_i[23] <= 32'h4025d793;  
       
       //sll srl slli srli - working (had bug with imm shifts, then fixed it on all but tested it on one case)
       
       //bne a4, a3, branch (38{2024 signed})
       //working
//       data_i[24] <= 32'hfcd71ce3; //branches
       //data_i[24] <= 32'hfcb51ce3;  //branches
//       data_i[24] <= 32'hfcb50ae3; //branches 
        //TODO: this part I have forgot to document what commands 
        //data_i[24] <= 32'hfcf74ce3;
        //branches working
        
        //sw a6, 0x0(a3)
        data_i[24] <= 32'h01082023;
        data_i[25] <= 32'h06000513;
        data_i[26] <= 32'h01050023;
        //sw sb sh working
        
        //lw s1, 0x0(a3)
        data_i[27] <= 32'h00050483;
        //lw working
        
        data_i[28] <= 32'h00068403;
        //lb lh working (axi not)
        
//       data_i[29] <= 32'hfc5ff3ef;
        //jal working doublechecked
        //jalr already checked
        
        //CODE FOR TESTING SOMEVALUES CHANGED (2/3 at the bottom) FIX THEM TO REPRODUCE TEST
        	
//		addi a0, zero, 0x5
//	addi a1, zero, 0x3
//	add a3, a1, a0
//	sub a4, a3, a0
//	slt a1, a0, a3
//	slti a2, a0, 0x8
//	lui a0, 0xfffff
//	sltu a7, a3, a0
//	slt a6, a3, a0
//	auipc a0, 0x2
	
//	and a5, a1, a2
//	and a6, a0, a2
	
//	or a5, a1, a2
//	or a6, a0, a2
	
//	branch:
	
//	and a1, a6, a0
	
//	xor a5, a1, a3
	
//	xori a5, a1, 0x2a
//	ori a5, a1, 0x3a
//	andi a5, a1, 0x3f
	
//	sll a5,a1,a2
//	srl a5,a1,a2
	
//	slli a5,a1,0x2
//	srli a5,a1,0x3
	
//	srai a5,a1,0x2
	
//	sw a6, 0x0(a6)
//	addi a0, zero, 0x60
//	sb a6, 0x0(a0)
	
//	lw s1, 0x0(a0)
//	lb s0, 0x0(a3)
	   
    end
    
    
    wire [23:0] byte = data_m[addr_m];
    wire [16:0] halfword = data_m[addr_m];
    
    always@(posedge clk)begin
        if(ena)begin
            //set data instruction (this is not needed) 
            data_i[addr_i] <= {we_i[3] ? data_in_i[31:24] : data_i[addr_i],
                               we_i[2] ? data_in_i[23:16] : data_i[addr_i],
                               we_i[1] ? data_in_i[15:8] : data_i[addr_i],
                               we_i[0] ? data_in_i[7:0] : data_i[addr_i]};
            //set data memory
    //        data_m[addr_m] <= {{we_m[3] ? data_in_m[31:24] : data_m[addr_m]},
    //                           {we_m[2] ? data_in_m[23:16] : data_m[addr_m]},
    //                           {we_m[1] ? data_in_m[15:8] : data_m[addr_m]},
    //                           {we_m[0] ? data_in_m[7:0] : data_m[addr_m]}};
      
                  case(we_m)
                    4'b0001: data_m [addr_m] <= {byte, data_in_m[7:0]};
                    4'b0011: data_m [addr_m] <= {halfword, data_in_m[16:0]};
                    4'b1111: data_m [addr_m] <= data_in_m;
                  endcase
        end     
    end
    
    //read assigns
    assign data_out_i = data_i[addr_i];
    assign  data_out_m = ena ?  data_m[addr_m]: 32'h0;
    
    
endmodule
