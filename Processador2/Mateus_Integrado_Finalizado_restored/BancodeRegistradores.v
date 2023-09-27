module BancodeRegistradores (

input wire [4:0] ReadRegister1, ReadRegister2, WriteReg,
input wire [31:0] WriteData,
input wire [3:0] Unit_Control_RegWrite,
input clock, WriteEnable,
output wire [31:0] ReadDataRD, ReadDataRS, ReadDataRT
);

integer First_clock=1;

reg [31:0] registers [31:0];


always @(posedge clock)
begin
	if (First_clock == 1)
	begin
		// Separo os 2 últimos registradores do banco para iniciá-los com valores padrão
		registers[31] = 32'b00000000000000000000000001111111; // Último resgistrador do banco com valor 127 para traço (-) no display
		registers[30] = 32'b00000000000000000000000001111110; // Valor 126 para display apagado
        registers[1] = 32'd0;
        registers[2] = 32'd1;
//        registers[3] = 32'd10;
//        registers[4] = 32'd9;
		  registers[0] = 32'd0;
        First_clock = 2;
	end
	
	if (WriteEnable && WriteReg != 0) 
	begin
		registers[WriteReg] = WriteData; // Se a escrita no registrador estiver permitida pela UC, o dado será escrito no registrador
													  // que de endereço WriteRegRT
	end
end

assign ReadDataRS = registers[ReadRegister1];
assign ReadDataRD = registers[WriteReg]; // O dado que escrevi no registrador do banco agora deve ser passado para RD
assign ReadDataRT = registers[ReadRegister2];


endmodule

