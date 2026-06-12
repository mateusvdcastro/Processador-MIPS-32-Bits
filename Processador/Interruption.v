module Interruption (
    input halt,
    input clk,
    input [9:0] pc,
    output reg int_halt,
    output reg [9:0] save_pc
);

initial begin
    int_halt = 1'b0;
    save_pc = 10'b0;
end

always @(posedge clk) begin
    if (halt) begin
        int_halt <= 1'b1; // Sinaliza que a interrupção de halt foi acionada
        save_pc <= pc; // Salva o valor do PC no momento da interrupção
    end 
end

endmodule