

module P_control(P_RegDst, P_Branch, P_MemtoReg, P_ALUOp, P_MemWrite, P_ALUSrc, P_RegWrite, P_instruction);  

output P_RegDst, P_Branch, P_MemtoReg, P_MemWrite, P_ALUSrc, P_RegWrite;
output [1:0] P_ALUOp;
input [31:0] P_instruction;

wire [5:0] P_Op = P_instruction[31:26];

reg [7:0] P_Control;

assign P_RegDst = P_Control[7];
assign P_RegWrite = P_Control[6];
assign P_ALUSrc = P_Control[5];
assign P_MemWrite = P_Control[4];
assign P_MemtoReg = P_Control[3];
assign P_Branch = P_Control[2];
assign P_ALUOp = P_Control[1:0];


always @(P_instruction)
    casex(P_Op)
        32'd0 : P_Control = 8'b11000010; // R-TYPE

        32'd35 : P_Control = 8'b01101000; // LW

        32'd43 : P_Control = 8'bx011x000; // SW

        32'd4 : P_Control = 8'bx000x101; // BEQ

        32'd8 : P_Control = 8'b01100000; // addi

        32'd13 : P_Control = 8'b01100011; // ori

        32'd2 : P_Control = 8'bx0x0x0xx; // j


        default : P_Control = 8'b00000000; // NOP  
    endcase

endmodule

