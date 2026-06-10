module PC (
	input wire clock,
	input wire PCFunct,
	input wire [9:0] ProximoEndereco, // Depende do tamanho do ADDR_WIDTH?
	output wire [9:0] Indice
);


// 	input wire clock, Selecao;
//   input wire [9:0] IndiceAux; // Depende do tamanho do ADDR_WIDTH?
//   output wire [9:0] Indice;
//   reg [9:0] IndiceAtual;
  
	reg [9:0] IndiceAtual;

	integer contador = 1; 

	initial begin
    	IndiceAtual = 10'd0;
	end

	always @(posedge clock) begin
    	if (PCFunct) begin
        	IndiceAtual <= ProximoEndereco;
    	end
	end


	// always @(posedge clock) begin
	// 	if (contador == 1) begin
	// 		IndiceAtual = 10'b0;
	// 		contador = 0;
	// 	end
		
	// 	else if (Selecao == 1) 
	// 	begin
	// 	IndiceAtual = IndiceAux;
	// 	end

	// 	else
		
	// 	begin
	// 	IndiceAtual = IndiceAtual + 1;
	// 	end

	// end

	assign Indice = IndiceAtual;
	
endmodule
