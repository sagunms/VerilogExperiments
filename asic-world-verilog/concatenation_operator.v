module concatenation_operator();

initial begin
  // concatenation
  $display (" {4'b1001,4'b10x1}  = %b", {4'b1001,4'b10x1});
  #10 $finish;
end

endmodule
