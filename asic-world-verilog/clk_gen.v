module clk_gen ();

reg clk, reset; 

initial begin
  $monitor ("TIME = %g RESET = %b CLOCK = %b", $time, reset, clk);
  clk = 0; 
  reset = 0; 
  #2 reset = 1; 
  #5 reset = 0; 
  #10 $finish;
end 

always 
  #1 clk = !clk;

endmodule
