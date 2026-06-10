module MultiplexadorJump(
    input [10:0] NormalouBranch,
    input [31:0] Jump,
    input ControleJump,
    output [10:0] Escolhido_MultiplexadorJump
);

reg [10:0] Escolhido;

always @(*) begin
    if (ControleJump) begin
        Escolhido = Jump[10:0]; // Se ControleJump for 1, escolhe o endereço de jump
    end else begin
        Escolhido = NormalouBranch; // Caso contrário, escolhe o endereço normal ou de branch
    end
end

assign Escolhido_MultiplexadorJump = Escolhido;

endmodule