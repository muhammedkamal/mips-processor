module K_register_file (rs , rt, rd , K_write_data , K_Regwrite , K_in1 , K_in2  , clock);
input [4:0] rs , rt, rd ;
input [31:0] K_write_data ;
input K_Regwrite , clock ;
output reg [31:0]  K_in1 , K_in2 ;
reg [31:0] registers [ 0:31];
//from here added by muhammad
reg [31:0] i;
integer file;

initial 
begin 

i=0;
file = $fopen("C:/Users/Muhammad/Desktop/project/regmem.txt");
$fmonitor(file,"%b ",i);
for (i=0; i<32 ;i=i+1)
begin
registers[i]=i;
end
end
//to here 
always 
begin
registers[0]=32'b0;
#1
K_in1 <= registers[rs];
K_in2 <= registers [rt];
if ( K_Regwrite)
registers[rd] =  K_write_data ; //edited by muhammad
$writememb("regmem.txt",registers); //added by muhammad
end
endmodule



 //made by  muhammad  
/*
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
K_write_data <= 300;
//K_in1 =2;
//K_in2 =10;
K_Regwrite <= 1;
#50 clock=~clock; #50 clock=~clock;

end

endmodule
*/