module intra_assign();

reg a, b;

initial begin
  $monitor("TIME = %g  A = %b  B = %b",$time, a , b);
  a = 1; 
  b = 0; 
  a = #10 0; 
  b = a;
  #20 $display("TIME = %g  A = %b  B = %b",$time, a , b);
  $finish;
end 

endmodule
