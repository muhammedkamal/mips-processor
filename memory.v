module K_memory(K_mem_read_data, K_mem_write_data, K_ALU_result, K_MemWrite);

output reg [31:0] K_mem_read_data;
input [31:0] K_ALU_result, K_mem_write_data;
input K_MemWrite;


wire K_MemRead = ~K_MemWrite;

reg [31:0] K_data_registers [0:255];


initial begin
$readmemb("memory.txt",K_data_registers);
end


always @(K_ALU_result, K_mem_write_data)
begin
    if(K_MemWrite )
        K_data_registers[K_ALU_result] = K_mem_write_data;
    if(K_MemRead )
        K_mem_read_data = K_data_registers[K_ALU_result];
$writememb("memory.txt",K_data_registers);
end

endmodule
