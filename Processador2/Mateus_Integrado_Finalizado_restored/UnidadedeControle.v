module UnidadedeControle (
    input [5:0] Opcode,
    output [2:0] AluOp, 
    output RegDst, MemRead, MemtoReg, MemWrite, ALUSrc,
    RegWrite, PCFunct, BEQ, BNE, ControlJump, Halt, 
    EnableClock, JAL, Out, In
);


	reg auxRegDst, auxMemRead, auxMemtoReg, auxMemWrite,
	auxALUSrc, auxRegWrite, auxPCFunct, auxBEQ, auxBNE,
	auxControlJump, auxHalt, auxJAL, auxOut, auxIn;

	reg [2:0] auxAluOp;

	reg auxEnable;

	always @(*)

	begin

		case(Opcode) 
			6'b000000: begin // Tipo R
				auxRegWrite <= 1;
				auxPCFunct <= 1;
				auxAluOp <= 3'b000;
				auxMemRead <= 0;
				auxMemWrite <= 0;
				auxMemtoReg <= 0;
				auxALUSrc <= 0;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b000001: begin //ADDI
				auxRegWrite <= 1;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001;
				auxMemRead <= 0;
				auxMemWrite <= 0;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b000010: begin //SUBI
				auxRegWrite <= 1;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001;
				auxMemRead <= 0;
				auxMemWrite <= 0;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b000011: begin //ANDI
				auxRegWrite <= 1;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001;
				auxMemRead <= 0;
				auxMemWrite <= 0;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b000100: begin //ORI
				auxRegWrite <= 1;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001;
				auxMemRead <= 0;
				auxMemWrite <= 0;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b000101: begin //LW
				auxRegWrite <= 1;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001;
				auxMemRead <= 1;
				auxMemWrite <= 0;
				auxMemtoReg <= 1;
				auxALUSrc <= 1;
				auxRegDst <= 1;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b000110: begin // LWI      !!!!! VER
				auxRegWrite <= 1;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001;
				auxMemRead <= 1;
				auxMemWrite <= 0;
				auxMemtoReg <= 1;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b000111: begin // SW
				auxRegWrite <= 0;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001; 
				auxMemRead <= 0;
				auxMemWrite <= 1;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b001000: begin // J
				auxRegWrite <= 0;
				auxPCFunct <= 1;
//				auxAluOp <= 3'b001; // ???
				auxMemRead <= 0;
				auxMemWrite <= 0;
				auxMemtoReg <= 0;
				auxALUSrc <= 0;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 1;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
//				auxRegWrite <= 0;
//				auxPCFunct <= 1;
////				auxAluOp <= 3'b001; // ???
//				auxMemRead <= 0;
//				auxMemWrite <= 0;
//				auxMemtoReg <= 0;
//				auxALUSrc <= 0;
//				auxRegDst <= 0;
//				auxBEQ <= 0;
//				auxBNE <= 0;
//				auxControlJump <= 1;
//				auxHalt <= 0;
//				auxJAL <= 0;
//			end
			6'b001010: begin // JAL
				auxRegWrite <= 0;
				auxPCFunct <= 1;
//				auxAluOp <= 3'b001; // ???
				auxMemRead <= 0;
				auxMemWrite <= 0;
				auxMemtoReg <= 0;
				auxALUSrc <= 0;
				auxRegDst <= 1;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 1;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b001101: begin // SLTI
				auxRegWrite <= 0;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001; 
				auxMemRead <= 0;
				auxMemWrite <= 1;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b001110: begin // BEQ
				auxRegWrite <= 0;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001; 
				auxMemRead <= 0;
				auxMemWrite <= 1;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b001111: begin // BNE
				auxRegWrite <= 0;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001; 
				auxMemRead <= 0;
				auxMemWrite <= 1;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b010000: begin // Move
				auxRegWrite <= 0;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001; 
				auxMemRead <= 0;
				auxMemWrite <= 1;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b010001: begin // Nop
				auxRegWrite <= 0;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001; 
				auxMemRead <= 0;
				auxMemWrite <= 1;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b111111: begin // Halt
				auxRegWrite <= 0;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001; 
				auxMemRead <= 0;
				auxMemWrite <= 1;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 0;
			end
			6'b001100: begin // Out
				auxRegWrite <= 0;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001; 
				auxMemRead <= 0;
				auxMemWrite <= 0;
				auxMemtoReg <= 0;
				auxALUSrc <= 0;
				auxRegDst <= 0;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 1;
				auxIn <= 0;
			end
			6'b001011: begin // In
				auxRegWrite <= 1;
				auxPCFunct <= 1;
				auxAluOp <= 3'b001; 
				auxMemRead <= 0;
				auxMemWrite <= 0;
				auxMemtoReg <= 0;
				auxALUSrc <= 1;
				auxRegDst <= 1;
				auxBEQ <= 0;
				auxBNE <= 0;
				auxControlJump <= 0;
				auxHalt <= 0;
				auxJAL <= 0;
				auxOut <= 0;
				auxIn <= 1;
			end
		endcase
	end
	
	assign RegDst = auxRegDst;
	assign MemRead = auxMemRead;
	assign MemtoReg = auxMemtoReg;
	assign MemWrite = auxMemWrite;
	assign ALUSrc = auxALUSrc;
	assign RegWrite = auxRegWrite;
	assign PCFunct = auxPCFunct;
	assign BEQ = auxBEQ;
	assign BNE = auxBNE;
	assign ControlJump = auxControlJump;
	assign Halt = auxHalt;
	assign EnableClock = auxEnable;
	assign JAL = auxJAL;
	assign Out = auxOut;
	assign In = auxIn;
	assign AluOp = auxAluOp;
	
	
	
endmodule
