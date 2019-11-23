module K_register_file (rs , rt, rd , K_write_data , K_Regwrite , K_in1 , K_in2  , clock);
input [4:0] rs , rt, rd ;
input [31:0] K_write_data ;
input K_Regwrite , clock ;
output reg [31:0]  K_in1 , K_in2 ;
reg [31:0] registers [ 0:31];
initial
begin
$readmemb("regmem.txt", registers);
end

always @ (posedge clock)
begin
assign K_in1 = registers[rs];
assign K_in2 = registers [rt];
if ( K_Regwrite)
registers[rd] =  K_write_data ;
$writememb("regmem.txt",registers);
end
endmodule



/* made by  muhammad  
module regtest();
reg [4:0] rs , rt, rd ;
reg[31:0] K_write_data ;
reg K_Regwrite , clock ;
wire [31:0]  K_in1 , K_in2 ;
K_register_file test_file(rs , rt, rd , K_write_data , K_Regwrite , K_in1 , K_in2  , clock);

initial
begin
clock =1;
rs <= 5;
rt <= 3;
rd <= 6;
K_write_data <= 255;
//K_in1 =2;
//K_in2 =10;
K_Regwrite <= 1;
#50 clock=~clock; #50 clock=~clock;

end

endmodule
*/