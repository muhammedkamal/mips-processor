module K_memory(K_mem_read_data, K_mem_write_data, K_ALU_result, K_MemWrite);

output reg [31:0] K_mem_read_data;
input [31:0] K_ALU_result, K_mem_write_data;
input K_MemWrite;


wire K_MemRead = ~K_MemWrite;

reg [31:0] K_data_registers [0:255];


//from here added by muhammad
reg [255:0] i;
integer file;

initial 
begin 

i=0;
file = $fopen("C:/Users/Muhammad/Desktop/project/memory.txt");
$fmonitor(file,"%b ",i);
for (i=0; i<255 ;i=i+1)
begin
K_data_registers[i]=0;
end
end
//to here

always @(K_ALU_result, K_mem_write_data)
begin
    if(K_MemWrite )
	begin
        K_data_registers[K_ALU_result/4] = K_mem_write_data;//edit by muhammad
	$writememb("memory.txt",K_data_registers); //added by muhammad
	end
    if(K_MemRead )
        K_mem_read_data = K_data_registers[K_ALU_result/4];//edit by muhammad

end

endmodule
/* 
module testmem(); //by muhammad
reg [31:0] K_ALU_result, K_mem_write_data; 
reg K_MemWrite;
wire [31:0] K_mem_read_data;

K_memory testmem(K_mem_read_data, K_mem_write_data, K_ALU_result, K_MemWrite);
initial 
begin 
K_MemWrite <=1;
K_ALU_result <=1;
K_mem_write_data <= 1024;
end
endmodule
*/