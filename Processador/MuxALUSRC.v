module MuxALUSRC(
    input[31:0] Dado2, 
    input [15:0] Imediato,
	 input [15:0] interruptores,
    input controle, in,
    output[31:0] Saida_AluSrc
);

    reg [31:0] reg_auxiliar;
    
    always @(*) begin
        if(controle == 1 && in == 0) begin
            reg_auxiliar = {16'd0, Imediato};
        end
		  else if(controle == 1 && in == 1) begin
				reg_auxiliar = {16'd0, interruptores};
		  end
        else begin
            reg_auxiliar = Dado2;
        end
    end

    assign Saida_AluSrc = reg_auxiliar;
	 
 endmodule
 