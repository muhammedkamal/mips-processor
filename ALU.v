
module K_ALU(K_ALU_result, K_zero, K_in1, K_in2, K_ALU_control,shamt);

output reg [31:0] K_ALU_result;
output reg K_zero;
input [31:0] K_in1, K_in2;
input [3:0] K_ALU_control;
input wire [4:0]shamt;

initial
begin
    K_ALU_result = 32'd0;
    K_zero = 0;
end

always @( K_in1  , K_in2 ,K_ALU_control)
begin
    case(K_ALU_control)
        4'b0000 : K_ALU_result = K_in1 & K_in2;

        4'b0001 : K_ALU_result = K_in1 | K_in2;

        4'b0010 : K_ALU_result = K_in1 + K_in2;

        4'b0110 : K_ALU_result = K_in1 - K_in2;

        4'b0111 : K_ALU_result = (K_in1 < K_in2) ? 32'd1 : 32'd0;
	
	4'b1000 : K_ALU_result = (K_in2 << shamt);
    endcase
    if (K_ALU_result == 0)
        K_zero = 1'b1;
    else
        K_zero = 1'b0;
end

endmodule

