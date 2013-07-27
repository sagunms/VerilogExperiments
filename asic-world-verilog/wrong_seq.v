module wrong_seq();

reg q;
reg clk1, clk2, d1, d2;

always @ (posedge clk1 or posedge clk2)
if (clk1) begin
  q <= d1;
end else if (clk2) begin
  q <= d2;
end

initial begin
  $monitor ("CLK1 = %b CLK2 = %b D1 = %b D2 %b Q = %b", 
    clk1, clk2, d1, d2, q);
  clk1 = 0;
  clk2 = 0;
  d1 = 0;
  d2 = 1;
  #10 $finish;
end

always
 #1 clk1 = ~clk1;
 
always
 #1.9 clk2 = ~clk2;

endmodule
