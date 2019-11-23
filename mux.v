module H_mux(input sel ,input [31:0]in1 ,input [31:0]in2, output reg [31:0]out);
always@(sel)
begin 
if (sel ==0)
assign out = in1;
else 
assign out = in2;
end

endmodule

module H_mux1(input sel ,input [4:0]in1 ,input [4:0]in2, output reg [4:0]out);
always@(sel)
begin 
if (sel ==0)
assign out = in1;
else 
assign out = in2;
end

endmodule