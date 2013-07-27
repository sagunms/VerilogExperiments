module dlatch_using_always();
reg q;

reg d, enable;

always @ (d or enable)
if (enable) begin
  q = d; 
end

initial begin
  $monitor (" ENABLE = %b D = %b  Q = %b",enable,d,q);
  #1 enable = 0;
  #1 d = 1;
  #1 enable = 1;
  #1 d = 0;
  #1 d = 1;
  #1 d = 0;
  #1 enable = 0;
  #10 $finish;
end

endmodule
