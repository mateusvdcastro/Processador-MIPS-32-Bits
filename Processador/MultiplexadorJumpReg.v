module MultiplexadorJumpReg (
    input [31:0] Dado1,
    input [10:0] Jump,
    input JALR, JReg,
    output [10:0] Escolhido_MultiplexadorJumpReg
);

reg [10:0] Escolhido;

always @(*) begin
    if (JALR == 1 || JReg == 1) begin
        Escolhido = Dado1[10:0]; // Se JALR ou JReg for 1, escolhe o endereço de jump do registrador
    end else begin
        Escolhido = Jump; // Caso contrário, escolhe o endereço de jump normal
    end
end

assign Escolhido_MultiplexadorJumpReg = Escolhido;

endmodule