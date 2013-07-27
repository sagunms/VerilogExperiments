module tri_buf_using_assign();
reg data_in, enable;
wire pad;

assign pad = (enable) ? data_in : 1'bz;

initial begin
  $monitor ("TIME = %g ENABLE = %b DATA : %b PAD %b", 
    $time, enable, data_in, pad);
  #1 enable = 0;
  #1 data_in = 1;
  #1 enable = 1;
  #1 data_in = 0;
  #1 enable = 0;
  #1 $finish;
end

endmodule
