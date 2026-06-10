module Branch(
	input [31:0] Imediato,
	input [9:0] PCAtual,
	input MuxBranch,
	output [9:0] NovoEndereco,
	output [9:0] ProximoPC
);

wire [31:0] PCExtendido;
wire [31:0] PCMaisUm;
wire [31:0] EnderecoBranch;

assign PCExtendido = {22'd0, PCAtual}; // Extende o PCAtual para 32 bits
assign PCMaisUm = PCExtendido + 32'sd1; // Incrementa o PCAtual em 1
assign EnderecoBranch = PCMaisUm + Imediato; // Calcula o endereço de branch


assign ProximoPC = PCMaisUm[9:0]; // O próximo PC é o PCAtual + 1
assign NovoEndereco = MuxBranch ? EnderecoBranch[9:0] : PCMaisUm[9:0]; // Se MuxBranch for 1, o novo endereço é o endereço de branch, caso contrário, é o próximo PC

endmodule