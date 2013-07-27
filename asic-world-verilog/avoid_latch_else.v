module avoid_latch_else ();

reg q;
reg enable, d;

always @ (enable or d)
if (enable) begin
  q = d;
end else begin
  q = 0;
end

initial begin
  $monitor (" ENABLE = %b  D = %b Q = %b",enable,d,q);
  #1 enable = 0;
  #1 d = 0;
  #1 enable = 1;
  #1 d = 1;
  #1 d = 0;
  #1 d = 1;
  #1 d = 0;
  #1 d = 1;
  #1 enable = 0;
  #1 $finish;
end

endmodule
