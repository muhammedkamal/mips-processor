module testmem;
reg [31:0]testmem[0:31];
reg [31:0] i;
integer file;

initial 
begin 

i=0;
file = $fopen("C:/Users/Muhammad/Desktop/project/regmem.txt");
$fmonitor(file,"%b   // %d\n ",i,i);
for (i=0; i<31 ;i=i+1)
begin
#1
testmem[i]=i;
end
end
endmodule 
