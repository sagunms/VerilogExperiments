//-----stop_watch_test module-------
module stop_watch_test(
	//port declaration
	input wire clk,
	input wire [1:0] btn,
	output wire [3:0] an,
	output wire [7:0] sseg
	);
	
	//signal declaration
	wire [3:0] d2, d1, d0;
	
	//instantiate 7-seg LED display module
	disp_hex_mux disp_unit(
		.clk(clk), .reset(1'b0),
		.hex3(4'b0), .hex2(d2), .hex1(d1), .hex0(d0),
		.dp_in(4'b1101), .an(an), .sseg(sseg)
		);
		
	//instantiate stopwatch
	stop_watch_if counter_unit(
		.clk(clk), .go(btn[1]), .clr(btn[0]),
		.d2(d2), .d1(d1), .d0(d0)
		);
endmodule

//-----stop_watch_if module-------
module stop_watch_if(
	//port declaration
	input wire clk,
	input wire go, clr,
	output wire [3:0] d2, d1, d0
	);
	
	//declaration
	localparam DVSR = 5000000;
	reg [22:0] ms_reg;
	wire [22:0] ms_next;
	reg [3:0] d2_reg, d1_reg, d0_reg;
	reg [3:0] d2_next, d1_next, d0_next;
	wire ms_tick;
	
	//----BODY----
	//register
	always @(posedge clk) begin
		ms_reg <= ms_next;
		d2_reg <= d2_next;
		d1_reg <= d1_next;
		d0_reg <= d0_next;
	end
	
	//next-state logic
	//0.1 sec tick generator: mod - 5000000
	assign ms_next = (clr || (ms_reg == DVSR && go)) ? 4'b0 :
						(go) ? ms_reg + 1 :
								ms_reg;
	assign ms_tick = (ms_reg == DVSR) ? 1'b1 : 1'b0;
	
	//3-digit BCD counter
	always @* begin
		//default: keep the previous values
		d0_next = d0_reg;
		d1_next = d1_reg;
		d2_next = d2_reg;
		if(clr) begin
			d0_next = 4'b0;
			d1_next = 4'b0;
			d2_next = 4'b0;
		end
		else if(ms_tick)		
			if(d0_reg != 9)
				d0_next = d0_reg + 1;
			else begin	//reach xx9
				d0_next = 4'b0;
				if(d1_reg != 9)
					d1_next = d1_reg + 1;
				else begin
					d0_next = 4'b0;
					if(d1_reg != 9)
						d1_next = d1_reg + 1;
					else begin	//reach x99
						d1_next = 4'b0;
						if(d2_reg != 9)
							d2_next = d2_reg + 1;
						else	//reach 999
							d2_next = 4'b0;
					end
				end
	end
	
	//output logic
	assign d0 = d0_reg;
	assign d1 = d1_reg;
	assign d2 = d2_reg;
	
endmodule
	