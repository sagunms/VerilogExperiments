module replication_operator();

initial begin
  // replication
  $display (" {4{4'b1001}}      = %b", {4{4'b1001}});
  // replication and concatenation
  $display (" {4{4'b1001,1'bz}} = %b", {4{4'b1001,1'bz}});
  #10 $finish;
end

endmodule
