module ExtensorSinal(
    input [15:0] Imediato16,
    output [31:0] ImediatoExtenso32
);

    assign ImediatoExtenso32 = {{16{Imediato16[15]}}, Imediato16};

endmodule