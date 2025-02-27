
module P_ALU_control(P_ALU_control, P_ALUOp, P_funct);

output reg [3:0] P_ALU_control;
input [1:0] P_ALUOp;
input [5:0] P_funct;

initial
    P_ALU_control = 4'b0000;

always @(P_ALUOp , P_funct)
begin
    case(P_ALUOp[1])
        1'b0 :  case(P_ALUOp[0])
                1'b0 :P_ALU_control = 4'b0010; // ADD for LW, SW

                1'b1 : P_ALU_control = 4'b0110; // SUB for BEQ
            endcase

        1'b1 :  case(P_funct[5:0]) //edited by muhammad 
		6'b000000:P_ALU_control = 4'b1000; //sll 
                6'd32 : P_ALU_control = 4'b0010; // ADD

                4'b0100 : P_ALU_control = 4'b0000; // AND

                4'b0101 : P_ALU_control = 4'b0001; // OR

                4'b0010 : P_ALU_control= 4'b0110; // SUB

                4'b1010 : P_ALU_control = 4'b0111; // SLT

                default : P_ALU_control = 4'b0010; // ADD 
            endcase
          1'b1 : P_ALU_control = 4'b0001; // ORi

    endcase
	
end

endmodule

