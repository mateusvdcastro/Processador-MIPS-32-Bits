module Branch(
    input [31:0] Imediato,
    input [9:0] PCAtual,
    input MuxBranch,
    output [9:0] NovoEndereco,
    output [9:0] ProximoPC
);

wire [9:0] PCMaisUm;
reg [9:0] InstrucaoModificada;

assign PCMaisUm = PCAtual + 10'd1;
assign ProximoPC = PCMaisUm;

always @(*) begin
    if (MuxBranch == 1'b1) begin
        InstrucaoModificada = Imediato[9:0];
    end else begin
        InstrucaoModificada = PCMaisUm;
    end
end

assign NovoEndereco = InstrucaoModificada;

endmodule