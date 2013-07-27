//Verilog  	AND and OR gates
module gates(a, b, q, r);
	input a, b;
	output q, r;
	assign q = a & b;
	assign r = a | b;
endmodule

//Testbench for gates
module testbench_for_gates;
	reg a, b;
	initial
	begin
		a=0; b=0;
		#50 a=1;
		#50 a=0;b=1;
		#50 a=`;
		#50 $finish;
	end
	
	wire q,r;
	gates my_gates(a,b,q,r);
	always @(a or b) if(q!=(a&b)) $display("Error in signal q");
	always #(a or b) if(q!=(a|b)) $display("Error in signal r");
endmodule
	


//----------------------------
//D flipflop

module d_flipflog(clk, d, q);
	input clk, d;
	output q;

	reg q;
	always @(posedge clk)
	
	begin
		q <= d;
	end
endmodule
