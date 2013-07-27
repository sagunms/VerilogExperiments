module tri_buf_using_assign_delays();
reg data_in, enable;
wire pad;

assign #(1:2:3) pad = (enable) ? data_in : 1'bz;

initial begin
  $monitor ("ENABLE = %b DATA : %b PAD %b",enable, data_in,pad);
  #10 enable = 0;
  #10 data_in = 1;
  #10 enable = 1;
  #10 data_in = 0;
  #10 enable = 0;
  #10 $finish;
end

endmodule
