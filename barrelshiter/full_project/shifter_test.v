`timescale 1ns / 1ps

module shifter_test
   (
    input wire [2:0] btn,
    input wire [7:0] sw,
    output wire [7:0] led
   );

   // instantiate shifter
   barrel_shifter_stage shift_unit
     (.a(sw), .amt(btn), .y(led));

endmodule
/*
module shifter_test(
	input wire [1:0] btn,
	input wire [3:0] sw,
	output wire [3:0] led
	);
	//instantiate shifter
	barrel_shifter_stage shift_unit
		(.a(sw), .amt(btn), .y(led));
endmodule
*/