`timescale 1ns / 1ps

module barrel_shifter_stage
   (
    input wire [7:0] a,
    input wire [2:0] amt,
    output wire [7:0] y
   );

   // signal declaration
   wire [7:0] s0, s1;

   // body
   // stage 0, shift 0 or 1 bit
   assign s0 = amt[0] ? {a[0], a[7:1]} : a;
   // stage 1, shift 0 or 2 bits
   assign s1 = amt[1] ? {s0[1:0], s0[7:2]} : s0;
   // stage 2, shift 0 or 4 bits
   assign y = amt[2] ? {s1[3:0], s1[7:4]} : s1;

endmodule
/*
module barrel_shifter_stage (
	input wire [3:0] a,
	input wire [1:0] amt,
	output wire [3:0] y
	);
	//signal declaration
	wire [3:0] s0;	//, s1;
	//body
	//stage 0, shift 0 or 1 bit
	assign s0 = amt[0] ? {a[0], a[3:1]} : a;
	//stage 1, shift 0 or 2 bits
	assign y = amt[1] ? {s0[1:0], s0[3:2]} : s0;
	//assign s1 = amt[1] ? {s0[1:0], s0[3:2]} : s0;
	//stage 2, shift 0 or 4 bits
	//assign y = amt[2] ? {s1[3:0], s1[7:4]} : s1;
endmodule
*/

