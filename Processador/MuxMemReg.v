module MuxMemReg(
    input[31:0] Dado_ULA, Dado_Mem,
    input controle,
    output[31:0] Saida_MemReg
);

    reg [31:0] reg_auxiliar;
    
    always @(*) begin
        if(controle) begin
            reg_auxiliar = Dado_Mem;
        end
        else begin
            reg_auxiliar = Dado_ULA;
        end

    end

    assign Saida_MemReg = reg_auxiliar;
	 
	 
endmodule
