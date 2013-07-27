module forever_example ();

reg clk;

initial begin
  #1 clk = 0; 
  forever begin
    #5 clk = !clk; 
  end
end 

initial begin
  $monitor ("Time = %d  clk = %b",$time, clk);
  #100 $finish;
end

endmodule
