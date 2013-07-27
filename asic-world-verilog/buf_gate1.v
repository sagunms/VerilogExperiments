module  buf_gate1 ();
reg in;
wire out;
	 
buf #(2,3) (out,in);

initial begin
  $monitor ("Time = %g in = %b out=%b", $time, in, out);
  in = 0;
  #10 in = 1;
  #10 in = 0;
  #10 $finish;
end
  	 
endmodule
