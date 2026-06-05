module BNEandBEQ (
	input ControlBEQ,
	input ControlBNE,
	input Zero,
	output Control_Branch
);

assign Control_Branch = (Zero & ControlBEQ) | (~Zero & ControlBNE);

endmodule	