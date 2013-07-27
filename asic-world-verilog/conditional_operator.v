module conditional_operator();

wire out;
reg enable,data;
// Tri state buffer
assign out = (enable) ? data : 1'bz;

initial begin
  $display ("time\t enable data out");
  $monitor ("%g\t %b      %b    %b",$time,enable,data,out);
  enable = 0;
  data = 0;
  #1 data = 1;
  #1 data = 0;
  #1 enable = 1;
  #1 data = 1;
  #1 data = 0;
  #1 enable = 0;
  #10 $finish;
end	

endmodule
