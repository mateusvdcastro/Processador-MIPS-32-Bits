module Display3 (
	input [3:0] bcd,
	output reg [6:0] saida_display 
);



	always @(*) begin
		case (bcd)
			4'b0000 : saida_display = 7'b1000000;
			4'b0001 : saida_display = 7'b1111001;
			4'b0010 : saida_display = 7'b0100100;
			4'b0011 : saida_display = 7'b0110000;
			4'b0100 : saida_display = 7'b0011001;
			4'b0101 : saida_display = 7'b0010010;
			4'b0110 : saida_display = 7'b0000010;
			4'b0111 : saida_display = 7'b1111000;
			4'b1000 : saida_display = 7'b0000000;
			4'b1001 : saida_display = 7'b0011000;
		default : saida_display = 7'b1111111;
		endcase
	end
endmodule
