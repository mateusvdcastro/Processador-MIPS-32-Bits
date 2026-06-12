module UnidadedeProcessamento (

	//input [4:0] RegisterRS, RegisterRT, RegisterRD,

	input clock,
	input [15:0] Interruptores,
	output [6:0] Display1, Display2, Display3, Display4,
	output led,
	output zero,
	//output [6:0] display,
	output [31:0] Out_ULA,
	output [31:0] Inst,
	output [4:0] auxRS,
	output [4:0] auxRT, 
	output [31:0] Wave_Saida_RegDST, Wave_Saida_AluSrc, Wave_Saida_MemToReg, Wave_Dado1,
	output [3:0] Wave_Unit_Control_ALU
);

    // Instrucao em binario saindo da Memoria ROM
	wire [31:0] InstMem;

	wire [31:0] ImediatoEstendido; // Saida do Extensor de Sinal

    // Saida da ULA
	wire [31:0] auxALUOut;
	wire auxZero;

    // Saida do dado 1 e dado 2 do banco de registradores
	wire [31:0] ReadDataRS;
	wire [31:0] ReadDataRT;
	
    // Fios dos bits de saida da unidade de controle
    wire RegDst, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, PCFunct, BEQ, BNE, ControlBranch, ControlJump, Halt, EnableClock, JAL, In, Out;
    wire [2:0] AluOp;

    wire [31:0] Saida_MemDados; // Saida da memoria RAM

    // Unidade de controle da ULA
    wire [3:0]Unit_Control_ALU; // Bits para controle da ULA
    wire JALR, JR; // Bits de controle para os jumps especificos do tipo R
	
	wire RegWriteHabilitado;

	wire [4:0] Saida_DestinoFinal;
	wire [31:0] Saida_WriteDataFinal;

	wire Control_Branch;

    // MUX
    wire [4:0] Saida_RegDST;
    wire [31:0] Saida_AluSrc;
    wire [31:0] Saida_MemToReg;
	 
	// Modulo de Entrada
	wire novo_clock;
	wire [15:0] resultado_entrada;
    
	integer auxSelec = 0; // Temporário, teste MEM e PC
    wire [9:0] valorPC; // Indice de saída do PC
	wire [9:0] ProximoPC;
	wire [9:0] EnderecoBranch;
	wire [10:0] EnderecoBranch11;
	wire [10:0] EnderecoJumpMux11;
	wire [10:0] EnderecoFinalPC11;
	wire [9:0] EnderecoFinalPC;
	wire [31:0] EnderecoJump;

	// Sinais de Interrupção
	wire int_halt, int_clk;
	wire [9:0] save_pc_halt;
	wire PCFunctHabilitaHalt;

	assign EnderecoBranch11 = {1'b0, EnderecoBranch};
	assign EnderecoFinalPC = EnderecoFinalPC11[9:0];
	assign PCFunctHabilitaHalt = PCFunct & ~int_halt;
	assign RegWriteHabilitado = RegWrite & ~JR;

	Entrada Chamada11(.clock(clock), .novo_clock(novo_clock), .in(In), .interruptores(Interruptores), .resultado_entrada(resultado_entrada));
	 
	Out Chamada12 (.result_ULA(auxALUOut), .clock(novo_clock), .controle(Out), .display1(Display1), .display2(Display2), .display3(Display3), .display4(Display4));

    UnidadedeControle Chamada6(.Opcode(InstMem[31:26]), .AluOp(AluOp), .RegDst(RegDst), .MemRead(MemRead), .MemtoReg(MemtoReg), .MemWrite(MemWrite), 
	 .ALUSrc(ALUSrc), .RegWrite(RegWrite), .PCFunct(PCFunct), .BEQ(BEQ), .BNE(BNE), .ControlJump(ControlJump), .Halt(Halt), .EnableClock(EnableClock), 
	 .JAL(JAL), .Out(Out), .In(In));

    UnidadedeControleULA Chamada8(.Funct(InstMem[5:0]), .AluOp(AluOp), .ControleALU(Unit_Control_ALU), .JALR(JALR), .JR(JR));
    
	MemoriaInstrucoesROM Chamada3(.addr(valorPC), .q(InstMem)); 
	 
	BNEandBEQ ChamadaBranchControl(.ControlBEQ(BEQ), .ControlBNE(BNE), .Zero(auxZero), .Control_Branch(Control_Branch));

	ExtensorSinal ExtensorBranch(.Imediato16(InstMem[15:0]), .ImediatoExtenso32(ImediatoEstendido));

	Branch BranchAddr(.Imediato(ImediatoEstendido), .PCAtual(valorPC), .MuxBranch(Control_Branch), .NovoEndereco(EnderecoBranch), .ProximoPC(ProximoPC));

	Jump JumpAddr (.Imediato26Bits(InstMem[25:0]), .JumpContext(1'b0), .Imediato(ImediatoEstendido), .Instrucao(EnderecoJump));

	MultiplexadorJump MuxJump (.NormalouBranch(EnderecoBranch11), .Jump(EnderecoJump), .ControleJump(ControlJump), .Escolhido_MultiplexadorJump(EnderecoJumpMux11));

	MultiplexadorJumpReg MuxJumpReg (.Dado1(ReadDataRS), .Jump(EnderecoJumpMux11), .JALR(JALR), .JReg(JR), .Escolhido_MultiplexadorJumpReg(EnderecoFinalPC11));

    MuxRegDst Chamada9(.reg1(InstMem[15:11]), .reg2(InstMem[20:16]), .reg_saida(Saida_RegDST), .controle(RegDst));

	MultiplexadorDestino MuxDestino (.RegDst(Saida_RegDST), .JAL(JAL), .JALR(JALR), .Escolhido_MultiplexadorDestino(Saida_DestinoFinal));

	Interruption ChamadaInterruption(.halt(Halt), .clk(novo_clock), .pc(valorPC), .int_halt(int_halt), .save_pc(save_pc_halt));

	PC Chamada5(.clock(novo_clock), .PCFunct(PCFunctHabilitaHalt), .ProximoEndereco(EnderecoFinalPC), .Indice(valorPC));

    BancodeRegistradores Chamada2(.clock(novo_clock), .ReadRegister1(InstMem[25:21]), .WriteEnable(RegWriteHabilitado), 
	.ReadRegister2(InstMem[20:16]), .WriteReg(Saida_DestinoFinal), .WriteData(Saida_WriteDataFinal), .ReadDataRS(ReadDataRS), .ReadDataRT(ReadDataRT));

    MuxALUSRC Chamada13 (.Dado2(ReadDataRT), .Imediato(InstMem[15:0]), .controle(ALUSrc), .Saida_AluSrc(Saida_AluSrc), .interruptores(resultado_entrada), .in(In));
    
	ULA Chamada1(.Output_Result(auxALUOut), .operand1(ReadDataRS), .operand2(Saida_AluSrc), .zero(auxZero), .Unit_Control_ALU(Unit_Control_ALU));
   
    MemoriadeDadosRAM Chamada7(.data(ReadDataRT), .addr(auxALUOut), .we(MemWrite), .re(MemRead), .clk(novo_clock), .q(Saida_MemDados));

    MuxMemReg Chamada10(.Dado_ULA(auxALUOut), .Dado_Mem(Saida_MemDados), .Saida_MemReg(Saida_MemToReg), .controle(MemtoReg));
	
	MultiplexadorJAL MuxJAL (    .ProximoPC({1'b0, ProximoPC}), .EscolhidoMemToReg(Saida_MemToReg), .JALR(JALR), .JUMPAL(JAL), .Escolhido_MultiplexadorJAL(Saida_WriteDataFinal));

	assign zero = auxZero;
	assign led = novo_clock;
	assign Out_ULA = auxALUOut;
	assign Inst = InstMem;
	assign auxRS = InstMem[25:21];
	assign auxRT = InstMem[20:16];
	assign Wave_Saida_RegDST = Saida_RegDST; 
	assign Wave_Saida_AluSrc = Saida_AluSrc;
	assign Wave_Saida_MemToReg = Saida_MemToReg;
	assign Wave_Dado1 = ReadDataRS;
	assign Wave_Unit_Control_ALU = Unit_Control_ALU;

endmodule