module K_register_file (rs , rt, rd , K_write_data , K_Regwrite , K_in1 , K_in2  , clock);
input [4:0] rs , rt, rd ;
input [31:0] K_write_data ;
input K_Regwrite , clock ;
output reg [31:0]  K_in1 , K_in2 ;
reg [31:0] registers [ 0:31];

always @ (posedge clock)
begin
assign K_in1 = registers[rs];
assign K_in2 = registers [rt];
if ( K_Regwrite)
registers[rd] =  K_write_data ;
end
endmodule

