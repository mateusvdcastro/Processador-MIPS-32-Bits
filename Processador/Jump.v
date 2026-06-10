module Jump (
    input [25:0] Imediato26Bits,
    input JumpContext,
    input [31:0] Imediato,
    output [31:0] Instrucao
);

reg [31:0] RegImediato;
reg [31:0] ValorJumpContexto;

always @(*) begin
    RegImediato = {6'b0, Imediato26Bits}; // Extende o imediato de 26 bits para 32 bits
end


assign Instrucao = RegImediato; // A instrução de jump é o imediato estendido

endmodule