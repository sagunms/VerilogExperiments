`timescale 1ns / 1ps

module eq1
	// I/0 ports
	(
		input wire i0, i1,
		output wire eq
	);
	
	//signal declaration
	wire p0, p1;
	
	//body
	//sum of two product terms
	assign eq = p0 | p1;
	//product terms
	assign p0 = ~i0 & ~i1;
	assign p1 = i0 & i1;
endmodule
