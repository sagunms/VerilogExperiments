module fork_join();

reg clk,reset,enable,data;

initial  begin
  $display ("Starting simulation");
  $monitor("%g clk=%b reset=%b enable=%b data=%b", 
    $time, clk, reset, enable, data);
  fork : FORK_VAL
    #1 clk = 0;
    #5 reset = 0;
    #5 enable = 0;
    #2 data = 0;
  join
  #10 $display ("%g Terminating simulation", $time);
  $finish;
end

endmodule
