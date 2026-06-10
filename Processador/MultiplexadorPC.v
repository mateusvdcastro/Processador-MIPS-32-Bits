module MultiplexadorPC (
    input [10:0] valorPC,
    input [10:0] valorPCBuffer,
    input [31:0] dado,
    input [31:0] qualInterrupcao,
    input savePC,
    input savePCBuffer,
    input getInterruption,
    input getPC,
    output [31:0] Escolhido_MultiplexadorPC
);

assign Escolhido_MultiplexadorPC = savePC ? {21'b0, valorPC} : savePCBuffer ? {21'b0, valorPCBuffer} : getInterruption ? qualInterrupcao : dado;

endmodule