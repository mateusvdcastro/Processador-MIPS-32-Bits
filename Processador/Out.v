module Out (
	input [31:0] result_ULA,
	input [15:0] valor_entrada,
	input input_valid,
	input controle,
	input clock,
	output [6:0] display1, display2, display3, display4
);

	reg [3:0] saidaDisplay1 = 4'd0;
	reg [3:0] saidaDisplay2 = 4'd0;
	reg [3:0] saidaDisplay3 = 4'd0;
	reg [3:0] saidaDisplay4 = 4'd0;

	always @(posedge clock) begin
		if (input_valid) begin
			saidaDisplay1 <= valor_entrada % 10;
			saidaDisplay2 <= (valor_entrada % 100) / 10;
			saidaDisplay3 <= (valor_entrada % 1000) / 100;
			saidaDisplay4 <= (valor_entrada % 10000) / 1000;
		end else if (controle) begin
			saidaDisplay1 <= result_ULA % 10;
			saidaDisplay2 <= (result_ULA % 100) / 10;
			saidaDisplay3 <= (result_ULA % 1000) / 100;
			saidaDisplay4 <= (result_ULA % 10000) / 1000;
		end
	end

	Display1 bc1(saidaDisplay1, display1);
	Display2 bc2(saidaDisplay2, display2);
	Display3 bc3(saidaDisplay3, display3);
	Display4 bc4(saidaDisplay4, display4);

endmodule
