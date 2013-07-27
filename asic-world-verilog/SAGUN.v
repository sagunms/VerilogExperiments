module arbiter (
// hehe
clock	,
reset	,
req_0	,
);

input clock;
output gnt_0;

//bidirectional
inout read_enable;
//vector signals (biderectional)
inout [7:0] address;	//port address is bidrectional	little endian 8-bit register

//if else
if (enable = 1'b1) begin
	data = 10;	//decimal assigned
	address 16'hDEAD;	//hexadecimal
	wr_enable = 1'b1; //binary
end else begin
	data = 32'b0;
	wr_enable = 1'b0;
	address = adddress + 1;
end

//case
case(address)
	0: $display ("sdflksadfj");
	1: $display ("sdjklf;a");
	default: $display ("hahaha");
endcase

//example of paralel execution of Verilog
module counter (clk,rst,enable,count);
input clk,rst,enable;
output [3:0] count;
reg [3:0] count;

always @ (posedge clk or posedge rst)
if (rst) begin
	count <= 0;
end
else begin:COUNT
	while (enable) begin
		count <= count + 1;
		disable COUNT;
	end
end

endmodule

//REPEAT
repeat (16) begin
	$display
	i = i+1;
end

//initial
initial begin


end

//2:1 MUX Combinational logic i.e. level sensitive. Block assignment "=" executes sequentially in combinational logics
always @(a or b or sel)
begin
	y = 0;
	if (sel == 0) begin
		y = a;
	end else begin
		y = b;
	end
end

//MUX 2:1 Edge sensitive for flip-flops	//non-blocking assignment "<=" executes in parallel in case of flipflops
always @ (posedge clk)
if (reset == 0) begin
	y <= 0;
end else if (sel == 0) begin
	y <= a;
end else begin
	y <= b;
end

//always block without sensitive list (DELAY needed)
always begin
	#5 clk = ~clk;
end

//Assign statement for combinational lgic only. (tri-state buffer)
assign out = (enable) ? data : 1'bz;

//Buffer
assign out = data;

/////////////task and function
function parity;
	input [31:0] data;
	integer i;
	begin
		parity = 0;
		for (i = 0; i < 32; i = i + 1) begin
			parity = parity ^ data[i];
		end
	end
endfunction

//////////////////////////////////	MY FIRST PROGRAM IN VERILOG ////////////////////////
//Hello world
module hello_world;
	initial begin
		$display ("Hello World");
		#10 $finish;
	end
endmodule

//////////////
input [range_val:range_var] list_of_identifiers;
output
inout


/////////////////
/*
Instantiating a module
*/
moduel parity {
	a	,
	b	,
	c	,
	d	,
	y
);
//input output declaration
input	a	;
input	b	;
input	c	;
input	d	;
output	y	;

//port datatypes
wire a;
wire b;
wire c;
wire d;
wire y;

//internal variables
wire out_0;
wire out_1;
//start here
xor u0 (out_0,a,b);
xor u1 (out_1,c,d);
xor u2 (y,out_0,out_1);
endmodule

// Implicit and Explicit Unconnected Port
module implicit();	//Implicit
	reg clk,d,rst,pre;
	wire q;

	dff u0 (q,,clk,d,rst,pre);
endmodule

module explicit();	//for explicit
	reg clk,d,rst,pre;
	wire q;
	dff u0 (.q(q), .d(d), .clk(clk), .q_bar(), .rst(rst), .pre(pre));
endmodule

//D flipflop
module dff (q, q_bar, clk, d, rst, pre);
	input clk, d, rst, pre;
	output q, q_bar;
	reg q;
	
	assign q_bar=~q;
	
	always @ (posedge clk)
		if(rst == 1'b1) begin
			q <= 0;
		end else if (pre == 1'b1) begin
			q <= 1;
		end else begin
			q <= d;
		end
		
endmodule



//Strings \n \t \\ \" \ddd %%
module strings();
	reg [8*21:0] string;
	initial begin
		string = "This is sample string";
		$display (%s \n", string);
	end
endmodule

/////////////////////////////////////////////
////	GATE LEVEL MODELLING
/////////////////////////////////////////////


module delay_example()
	wire out1,out2,out3,out4,out5,out6;
	reg b,c;
	
	or		#5						u_or		(out1,b,c);
	and		#(1,2)					u_and		(out2,b,c);
	nor		#(1,2,3)				u_nor		(out3,b,c);
	nand	#(1:2:3)				u_nand		(out4,b,c);	//one delay
	notif1	#(1:2:3,4:5:6,7:8:9) 	u_notif1	(out6,b,c);	//three delays
	
	//testbench code
	initial begin
		$monitor (
			"Time=%g b=%b c=%b out1=%b out2=%b out3=%b out4=%b out5=%b out6=%b",
			$time, b, c, out1, out2, out3, out4, out5, out6);
		b=0;
		c=0;
		#10 b=1;
		#10 c=1;
		#10 b=0;
		#10 $finish;
	end
endmodule

///////////User Defined Primitives
primitive udp_body(a,b,c);
	output a;
	input b,c;
	table
		? 1 : 1;
		1 ? : 1;
		0 0 : 0;
	endtable
endprimitive

//testbench
'include "udp_body.v"
module udp_body_tb();
	reg b,c;
	wire a;
	udp_body udp(a,b,c);
	initial begin
		$monitor("b = %b, c = %b, a = %b", b,c,a);
		b = 0;
		c = 0;
		#1 b = 1;
		#1 c = 1'bx;
		#1 $finish;
	end
endmodule

//////////////////////
//Sequential UDP (edge sensitive with initial)

primitive udp_sequential_initial(q,clk,d);
	output q;
	input clk,d;
	
	reg q;
	
	initial begin
		q=0;
	end
	
	table
		//clk	d	:	q	:	q+
		(01)	0	:	?	:	0;
		(01)	1	:	?	:	1;
		(0?)	1	:	1	:	1;
		(0?)	0	:	0	:	0;
	//ignore negative edge of clk
		(?0)	?	:	?	:	-;
	//ignore d changes on steady clk
		?		(??):	?	:	-;
	endtable
endprimitive
	
////////////////
//VERILOG BEHAVIOR MODELING PART III
////////////////
//FOR STATEMENT

module for_example();
	integer i;
	reg [7:0] ram [0:255];
	initial begin
		for(i=0; i<256; i=i+1) begin
			#1 $display("Address = %g Data = %h",i,ram[i]);
			ram[i] <= 0;	//Initialize the RAM with 0s
			#1 $display("Address = %g Data = %h",i,ram[i]);
		end
		#1 $finish;
	end
endmodule

//----------------------
//Continuous assignment statements
module tri_buf_using_assign_delays();
	reg data_in, enable;
	reg a,b;
	wire pad;
	wire carry, sum;
	assign #(1:2:3) pad = (enable) ? data_in : 1'bz;	//Tri-state buffer
	assign #5 {carry, sum} = a + b;						//1-bit adder
	initial begin
	
	end
endmodule

///Named Blocks
// code to find the lowest bit set
module named_block_disable();
	reg [31:0] bit_detect;
	reg [5:0] bit_position;
	integer i;
	
	always @ (bit_detect)
	begin: BIT_DETECT
		for(i=0; i<32; i=i+1) begin
			if(bit_detect[i] == 1) begin
				bit_position=i;
				disable BIT_DETECT;
			end else begin
				bit_position=32;
			end
		end
	end
end
//testbench
initial begin
	$monitor("....
	#1 bit_detect=32'h1100_1000;
	#10 $finish;
end

	
	