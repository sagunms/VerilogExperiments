module sequential();

reg a;

initial begin
  $monitor ("%g a = %b", $time, a);
  #10 a = 0;
  #11 a = 1;
  #12 a = 0;
  #13 a = 1;
  #14 $finish;
end

endmodule
