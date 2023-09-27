module UnidadedeControleULA (Funct, AluOp, ControleALU, JALR, JR);


	input [5:0] Funct;
	input [2:0] AluOp; 
	output [3:0] ControleALU;
	output JALR, JR;

	reg[3:0] RegControle;
	reg RegJALR, RegJR; 

	always @(*)
	begin
		case (AluOp)
			3'b000: begin
				case (Funct) 
					6'b000001: begin // ADD
						RegControle <= 4'b0010; 
						RegJALR <= 0;
						RegJR <= 0;
					end
					6'b000010: begin // SUB
						RegControle <= 4'b0011;
						RegJALR <= 0;
						RegJR <= 0;	
					end
					6'b000011: begin // DIV
						RegControle <= 4'b1001;
						RegJALR <= 0;
						RegJR <= 0;
					end
					6'b000100: begin // MULT
						RegControle <= 4'b1000;
						RegJALR <= 0;
						RegJR <= 0;
					end
					6'b000101: begin // AND
						RegControle <= 4'b0000;
						RegJALR <= 0;
						RegJR <= 0;	
					end
					6'b000110: begin // OR
						RegControle <= 4'b0001;
						RegJALR <= 0;
						RegJR <= 0;
					end			
	//				6'b000111: begin // NOT
	//					RegControle = 4'b0000; 
	//				end
					6'b000111: begin // NOR
						RegControle <= 4'b1010;
						RegJALR <= 0;
						RegJR <= 0;
					end
					6'b001000: begin // SLL
						RegControle <= 4'b1011;
						RegJALR <= 0;
						RegJR <= 0;	
					end
					6'b001001: begin // SRL
						RegControle <= 4'b1100;
						RegJALR <= 0;
						RegJR <= 0;
					end
					6'b001010: begin // JR
						RegControle <= 4'b0010; // ADD ???
						RegJALR <= 0;
						RegJR <= 1;
					end
					6'b001011: begin // JALR
						RegControle <= 4'b0000; // AND ???
						RegJALR <= 1;
						RegJR <= 0;
					end
					6'b001100: begin // SLT
						RegControle <= 4'b0100;
						RegJALR <= 0;
						RegJR <= 0;
					end
					6'b001101: begin // SLET
						RegControle <= 4'b0111;
						RegJALR <= 0;
						RegJR <= 0;	
					end
					6'b001110: begin // SGT
						RegControle <= 4'b0101;
						RegJALR <= 0;
						RegJR <= 0;
					end
					6'b001111: begin // SGET
						RegControle <= 4'b0110;
						RegJALR <= 0;
						RegJR <= 0;	
					end
				endcase
			end
			3'b001: begin // SOMA
				RegControle <= 4'b0010;
				RegJALR <= 0;
				RegJR <= 0;
			end
			3'b010: begin // SUB
				RegControle <= 4'b0011;
				RegJALR <= 0;
				RegJR <= 0;
			end
			3'b011: begin // AND
				RegControle <= 4'b0010;
				RegJALR <= 0;
				RegJR <= 0;
			end
			3'b100: begin // OR
				RegControle <= 4'b0001;
				RegJALR <= 0;
				RegJR <= 0;
			end
			3'b101: begin // SLT
				RegControle <= 4'b0100;
				RegJALR <= 0;
				RegJR <= 0;
			end
		endcase
	end
	
	assign ControleALU = RegControle;
	assign JALR = RegJALR;
	assign JR = RegJR;


endmodule
