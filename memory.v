
module K_memory(K_mem_read_data, K_mem_write_data, K_ALU_result, K_MemWrite);

output reg [31:0] K_mem_read_data;
input [31:0] K_ALU_result, K_mem_write_data;
input K_MemWrite;

wire K_MemRead = ~K_MemWrite;

reg [31:0] K_data_registers;

initial
    K_mem_read_data = 0;

always @(K_ALU_result, K_mem_write_data)
begin
    if(K_MemWrite )
        K_data_registers[K_ALU_result] = K_mem_write_data;
    if(K_MemRead )
        K_mem_read_data = K_data_registers[K_ALU_result];
end

endmodule
