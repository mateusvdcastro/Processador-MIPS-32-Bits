module MuxRegDst(
    input[4:0] reg1, reg2,
    input controle,
    output[4:0] reg_saida
);

    reg [4:0] reg_auxiliar;
    
    always @(*) begin
        if(controle) begin
            reg_auxiliar = reg2;
        end
        else begin
            reg_auxiliar = reg1;
        end

    end

    assign reg_saida = reg_auxiliar;
	 
endmodule 