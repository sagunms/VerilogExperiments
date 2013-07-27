module reduction_operators();

initial begin
  // Bit Wise AND reduction
  $display (" &  4'b1001 = %b", (&  4'b1001));
  $display (" &  4'bx111 = %b", (&  4'bx111));
  $display (" &  4'bz111 = %b", (&  4'bz111));
  // Bit Wise NAND reduction
  $display (" ~& 4'b1001 = %b", (~& 4'b1001));
  $display (" ~& 4'bx001 = %b", (~& 4'bx001));
  $display (" ~& 4'bz001 = %b", (~& 4'bz001));
  // Bit Wise OR reduction
  $display (" |  4'b1001 = %b", (|  4'b1001));
  $display (" |  4'bx000 = %b", (|  4'bx000));
  $display (" |  4'bz000 = %b", (|  4'bz000));
  // Bit Wise OR reduction
  $display (" ~| 4'b1001 = %b", (~| 4'b1001));
  $display (" ~| 4'bx001 = %b", (~| 4'bx001));
  $display (" ~| 4'bz001 = %b", (~| 4'bz001));
  // Bit Wise XOR reduction
  $display (" ^  4'b1001 = %b", (^  4'b1001));
  $display (" ^  4'bx001 = %b", (^  4'bx001));
  $display (" ^  4'bz001 = %b", (^  4'bz001));
  // Bit Wise XNOR
  $display (" ~^ 4'b1001 = %b", (~^ 4'b1001));
  $display (" ~^ 4'bx001 = %b", (~^ 4'bx001));
  $display (" ~^ 4'bz001 = %b", (~^ 4'bz001));
  #10 $finish;
end

endmodule
