module Out (
	input [31:0] result_ULA,
	input controle, clock, 
	output [6:0] display1, display2, display3, display4
);

	reg [31:0] saidaDisplay1, saidaDisplay2, saidaDisplay3, saidaDisplay4;
   integer contador1 = 1;

	always @(negedge clock) begin
		if (contador1 == 1) begin
			saidaDisplay1 = 4'b1110;
			saidaDisplay2 = 4'b1110;
			saidaDisplay3 = 4'b1110;
			saidaDisplay4 = 4'b1110;
			contador1 = 0;
		end
		
		else begin
			if (controle) begin
				saidaDisplay1 = result_ULA%10;
				saidaDisplay2 = (result_ULA%100)/10;
				saidaDisplay3 = (result_ULA%1000)/100;
				saidaDisplay4 = (result_ULA%10000)/1000;
			end
		end		
	end

	Display1 bc1 (saidaDisplay1, display1);
	Display2 bc2 (saidaDisplay2, display2);
	Display3 bc3 (saidaDisplay3, display3);
	Display4 bc4 (saidaDisplay4, display4);
 
endmodule
