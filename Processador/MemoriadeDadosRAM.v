// Quartus Prime Verilog Template
// Single port RAM with single read/write address 

module MemoriadeDadosRAM 
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=10)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, re, clk,
	output reg [(DATA_WIDTH-1):0] q
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	always @ (posedge clk)
	begin
		// Write
		if (we)
			ram[addr] <= data;

	end

	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.
	always @ (negedge clk)
	begin
		if (re)
			q <= ram[addr];
	end
	


endmodule



