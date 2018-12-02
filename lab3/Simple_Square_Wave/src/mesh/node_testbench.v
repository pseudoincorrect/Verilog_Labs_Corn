`timescale 1ns /100ps

module node_testbench ();

	reg clk, reset_n, start;
	reg [17:0] stimu;
	wire [17:0] u_in_left;
	wire [17:0] u_in_right;
	wire [17:0] u_in_bottom;
	wire [17:0] u_in_top;
	wire [17:0] u_out;

	sound_node sound_node_i_0 (
	.clk         (clk),
	.reset_n     (reset_n),
	.start       (start),
	.stimu       (stimu),
	.u_in_left   (u_in_left),
	.u_in_right  (u_in_right),
	.u_in_bottom (u_in_bottom),
	.u_in_top    (u_in_top),
	.u_out		 (u_out)
	);


	// fixed point calculator 
	//http://www.rfwireless-world.com/calculators/floating-vs-fixed-point-converter.html

	assign u_in_top    = 18'b0;
	assign u_in_bottom = 18'b0;
	assign u_in_right  = 18'b0;
	assign u_in_left   = 18'b0;

	always begin
		clk = 1; #5; clk = 0; #5;
	end

	initial begin
		clk = 0;
		reset_n = 0;
		stimu = 18'h0_2F00;
		start = 0;
		#5; reset_n = 1;
		#20; start = 1;
		#20; start = 0;
		#30; stimu = 18'h0;

		forever begin
			 start = 1;
			 #10;
			 start = 0;
			 #10;
		end
	end

endmodule