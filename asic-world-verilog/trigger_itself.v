module trigger_itself();

reg clk;

always @ (clk)
  #5 clk = !clk; 
  
// Testbench code here
initial begin
  $monitor("TIME = %d  CLK = %b",$time,clk);
  clk = 0;
  #500 $display("TIME = %d  CLK = %b",$time,clk);
  $finish;
end

endmodule
