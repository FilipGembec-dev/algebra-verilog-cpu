`timescale 1ns / 1ps

module bram_inst(
    input clk,
    input [3:0] we_i,
    input [31:0] data_in_i,
    input [31:0] addr_i,
    output [31:0] data_out_i,
    input [3:0] we_m,
    input [31:0] data_in_m,
    input [31:0] addr_m,
    output [31:0] data_out_m
    );
 
    reg [31:0] data [127:0]; //data instruction
    
    wire [31:0] addr_hi = addr_m[31:2];
    wire [1:0] addr_lo = addr_m[1:0];
    
    
    wire [31:24] msb_1 = data[addr_hi];
    wire [23:16] msb_2 = data[addr_hi];
    wire [15:8] lsb_1 = data[addr_hi];
    wire [7:0] lsb_2 = data[addr_hi];
    
    always@(posedge clk)begin
    
        case (addr_lo)
            2'b00: begin 
                case(we_m)
                    4'b1111: data[addr_hi] <= data_in_m;
                    4'b0001: data[addr_hi] <= {msb_1, msb_2, lsb_1, data_in_m[7:0]};
                    4'b0011: data[addr_hi] <= {msb_1, msb_2, data_in_m[15:0]};
                    default: ;                    
                endcase
            end    
            2'b01: begin 
                case(we_m)
                    4'b1111: data[addr_hi] <= data_in_m;
                    4'b0001: data[addr_hi] <= {msb_1, msb_2, data_in_m[7:0], lsb_2};
                    4'b0011: data[addr_hi] <= {msb_1, data_in_m[15:0], lsb_2};
                    default: ;                              
                endcase    
            end
            2'b10: begin 
                case(we_m)
                    4'b1111: data[addr_hi] <= data_in_m;
                    4'b0001: data[addr_hi] <= {msb_1, data_in_m[7:0], lsb_1, lsb_2};
                    4'b0011: data[addr_hi] <= {data_in_m[15:0], lsb_1, lsb_2};
                    default: ;                              
                endcase    
            end
            2'b11: begin 
                case(we_m)
                    4'b1111: data[addr_hi] <= data_in_m;
                    4'b0001: data[addr_hi] <= {msb_1, msb_2, data_in_m[7:0], lsb_2};
                    4'b0011: data[addr_hi] <= {msb_1, data_in_m[15:0], lsb_2};
                    default: ;                              
                endcase    
            end
        endcase
        data[addr_m] <= {{we_m[3] ? data_in_m[31:24] : msb_1},
                         {we_m[2] ? data_in_m[23:16] : msb_2},
                         {we_m[1] ? data_in_m[15:8] : lsb_1},
                         {we_m[0] ? data_in_m[7:0] : lsb_2}};
    end
    
    //read assigns
    assign data_out_i = data[addr_i];
    assign data_out_m = data[addr_m];
    
    
endmodule
