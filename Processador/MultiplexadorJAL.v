module MultiplexadorJAL (
    input [10:0] ProximoPC,
    input [31:0] EscolhidoMemToReg,
    input JALR, JUMPAL,
    output [31:0] Escolhido_MultiplexadorJAL
);

reg [31:0] Escolhido;

always @(*) begin
    if (JALR == 1 || JUMPAL == 1) begin
        Escolhido = {21'b0, ProximoPC}; // Se JALR ou JUMPAL for 1, escolhe o endereço de jump
    end else begin
        Escolhido = EscolhidoMemToReg; // Caso contrário, escolhe o resultado do MemToReg
    end
end

assign Escolhido_MultiplexadorJAL = Escolhido;

endmodule