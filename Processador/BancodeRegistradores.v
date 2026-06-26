module BancodeRegistradores (

input wire [4:0] ReadRegister1, ReadRegister2, WriteReg,
input wire [31:0] WriteData,
input wire [3:0] Unit_Control_RegWrite, // Remove
input clock, WriteEnable,
output wire [31:0] ReadDataRD, ReadDataRS, ReadDataRT,
output wire [31:0] FramePointer
);

integer First_clock = 1;
integer i;
integer init_i;

reg [31:0] registers [31:0];

initial
begin
	for (init_i = 0; init_i < 32; init_i = init_i + 1)
	begin
		registers[init_i] = 32'd0;
	end
end

always @(posedge clock)
begin
	if (First_clock == 1)
	begin
		for (i = 0; i < 32; i = i + 1)
		begin
			registers[i] = 32'd0;
		end
		First_clock = 2;
	end

	if (WriteEnable && WriteReg != 5'd31)
	begin
		registers[WriteReg] = WriteData;
	end
end

assign ReadDataRS = registers[ReadRegister1];
assign ReadDataRD = registers[WriteReg];
assign ReadDataRT = registers[ReadRegister2];
assign FramePointer = registers[29];

endmodule
