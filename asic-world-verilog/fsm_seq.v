always @ (posedge clock)
begin : OUTPUT_LOGIC
  if (reset == 1'b1) begin
    gnt_0 <= #1 1'b0;
    gnt_1 <= #1 1'b0;
    gnt_2 <= #1 1'b0;
    gnt_3 <= #1 1'b0;
    state <= #1 IDLE;
  end else begin
    state <= #1 next_state;
    case(state)
       IDLE : begin
                gnt_0 <= #1 1'b0;
                gnt_1 <= #1 1'b0;
                gnt_2 <= #1 1'b0;
                gnt_3 <= #1 1'b0;
	       end
  	GNT0 : begin
  	         gnt_0 <= #1 1'b1;
  	       end
        GNT1 : begin
                 gnt_1 <= #1 1'b1;
               end
        GNT2 : begin
                 gnt_2 <= #1 1'b1;
               end
        GNT3 : begin
                 gnt_3 <= #1 1'b1;
               end
     default : begin
                 state <= #1 IDLE;
               end
    endcase
  end
end
