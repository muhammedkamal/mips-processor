module mips(clock);

	input clock;
	
	// Program counter
	reg[31:0] PC = 32'b0;
	
	// Intruction
	wire [31:0] instruction;
	
	// bus instruction
	wire [5:0] funct;
	wire [4:0] rs, rt, rd, shamt;
	wire [25:0] address;
	wire [15:0] immediate;
	wire [5:0] opcode;
	
	// Signals
	wire read_reg_signal, write_reg_signal, regDst_signal,memToreg_signal,ALUSrc,zero;
	wire read_mem_signal, write_mem_signal;
	wire branch_signal;
	wire [1:0] ALUOp;
	wire [3:0] ALU_control;
	
	// Registers contents
	wire [31:0] regWrite_data, memory_read_data,aluIn1,aluIn2,mux2In1,mux2In2,aluResult;
	
	
	// Read the instruction
	pc inst_mem (instruction, PC);
	//ins bus
	inst_bus bus (opcode, rs, rt, rd, shamt, funct, immediate, address, instruction, PC);
							 
	//control unit
	P_control control(regDst_signal, branch_signal, memToreg_signal, ALUOp, read_mem_signal, ALUSrc,write_reg_signal , instruction);
	//alu
	K_ALU alu(aluResult, zero, aluIn1, aluIn2, ALU_control);
		
	P_ALU_control aluControl(ALU_control, ALUOp, funct);
	//mem and reg
	K_memory dataMemory(memory_read_data, mux2In1, aluResult, write_mem_signal);

	K_register_file registers(rs , rt, rd , regWrite_data , write_reg_signal , aluIn1 , mux2In1 , clock);


	// PC operations
	always @(posedge clock) begin 
		// jump 
		if(opcode == 6'h2) begin
			PC = address;
		end
		// jr
		else if(opcode == 6'h0 & funct == 6'h08)begin
			PC = aluIn1;
		end
		// branch
		else if(regWrite_data == 0 & branch_signal == 1) begin
			PC = PC + 1 + $signed(immediate); 
		end
		else begin
			PC = PC+1;
		end
	end 
	// muxs
	//mux 2
	 H_mux mux2(ALUSrc ,mux2In1 ,$signed(immediate), aluIn2 );
	/*always @(ALUSrc)
	begin
		if (ALUSrc == 0)
		aluIn2 = mux2In1;
		else 
		aluIn2 = $signed(immeddiate);
	end*/
	//mux 1
	H_mux1 mux1(regDst_signal ,rt ,rd, rd );
	/*always @(regDst_signal)
	begin
		if (regDst_signal ==0)
		rd = rt;
		else
		rd =rd;
	end*/
	// mux 3
	H_mux mux3(memToreg_signal ,mux2In1 ,memory_read_data, regWrite_data);
	/*always @(memToreg_signal)
	begin
		if (memToreg_signal==0)
		regWrite_data = mux2In1;
		else 
		regWrite_data = memory_read_data;
	end
	*/
endmodule
