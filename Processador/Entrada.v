module Entrada(
	input clock,
	input botao_enter,
	input botao_continue,
	output novo_clock,
	input in,
	input out,
	input [15:0] interruptores,
	output [15:0] resultado_entrada,
	output pulso_entrada
);

	parameter DIV_NORMAL = 26'd781250;
	parameter STEP_HIGH_TICKS = 16'd50000;

	reg [25:0] div_count = 26'd0;
	reg [15:0] step_count = 16'd0;
	reg [15:0] resultado = 16'd0;
	reg RegClock = 1'b0;
	reg pending_step = 1'b0;
	reg pending_input = 1'b0;
	reg was_paused = 1'b0;
	reg pulso_entrada_reg = 1'b0;

	wire enter_pulse;
	wire continue_pulse;
	wire paused;

	assign paused = in | out;

	DebouncePulse db_enter(
		.clock(clock),
		.botao_n(botao_enter),
		.pulse(enter_pulse)
	);

	DebouncePulse db_continue(
		.clock(clock),
		.botao_n(botao_continue),
		.pulse(continue_pulse)
	);

	always @(posedge clock) begin
		pulso_entrada_reg <= 1'b0;

		if (paused) begin
			was_paused <= 1'b1;
			div_count <= 26'd0;

			if (step_count != 16'd0) begin
				RegClock <= 1'b1;
				step_count <= step_count - 16'd1;
			end else begin
				RegClock <= 1'b0;

				if (pending_step) begin
					pending_step <= 1'b0;
					step_count <= STEP_HIGH_TICKS;

					if (pending_input) begin
						pulso_entrada_reg <= 1'b1;
						pending_input <= 1'b0;
					end
				end else if (in && enter_pulse) begin
					resultado <= interruptores;
					pending_step <= 1'b1;
					pending_input <= 1'b1;
				end else if (out && continue_pulse) begin
					pending_step <= 1'b1;
					pending_input <= 1'b0;
				end
			end
		end else begin
			pending_step <= 1'b0;
			pending_input <= 1'b0;
			step_count <= 16'd0;

			if (was_paused) begin
				was_paused <= 1'b0;
				RegClock <= 1'b0;
				div_count <= 26'd0;
			end else if (div_count == DIV_NORMAL) begin
				div_count <= 26'd0;
				RegClock <= ~RegClock;
			end else begin
				div_count <= div_count + 26'd1;
			end
		end
	end

	assign novo_clock = RegClock;
	assign resultado_entrada = resultado;
	assign pulso_entrada = pulso_entrada_reg;

endmodule

module DebouncePulse(
	input clock,
	input botao_n,
	output reg pulse
);
	parameter COUNT_MAX = 20'd500000;

	reg [19:0] count = 20'd0;
	reg sync0 = 1'b1;
	reg sync1 = 1'b1;
	reg stable_pressed = 1'b0;

	wire pressed;

	assign pressed = ~sync1;

	always @(posedge clock) begin
		sync0 <= botao_n;
		sync1 <= sync0;
		pulse <= 1'b0;

		if (pressed == stable_pressed) begin
			count <= 20'd0;
		end else if (count == COUNT_MAX) begin
			stable_pressed <= pressed;
			count <= 20'd0;

			if (pressed) begin
				pulse <= 1'b1;
			end
		end else begin
			count <= count + 20'd1;
		end
	end
endmodule
