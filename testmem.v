module testmem;
reg [31:0]testmem[0:199];
reg [31:0] i;
integer file;

initial 
begin 

i=0;
file = $fopen("C:/Users/Muhammad/Desktop/project/file.txt");
$fmonitor(file,"%b   // %d\n ",i,i);
for (i=0; i<200 ;i=i+1)
begin
#1
i=i;
end
end
endmodule 
