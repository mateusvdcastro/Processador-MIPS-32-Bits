module MultiplexadorDestino (
    input [4:0] RegDst,
    input JAL, JALR,
    output [4:0] Escolhido_MultiplexadorDestino
);

reg [4:0] Escolhido;

always @(*) begin
    if (JAL == 1 || JALR == 1) begin
        Escolhido = 5'd30; // Se JAL ou JALR for 1, escolhe o registrador $ra (registrador 31) para armazenar o endereço de retorno
    end else begin
        Escolhido = RegDst; // Caso contrário, escolhe o registrador determinado por RegDst
    end
end

assign Escolhido_MultiplexadorDestino = Escolhido;

endmodule