module n_in_primitive();

wire out1,out2,out3;
reg in1,in2,in3,in4;

// Two input AND gate
and u_and1 (out1, in1, in2);
// four input AND gate 
and u_and2 (out2, in1, in2, in3, in4);
// three input XNOR gate 
xnor u_xnor1 (out3, in1, in2, in3);

//Testbench Code
initial begin
  $monitor (
  "in1 = %b in2 = %b in3 = %b in4 = %b out1 = %b out2 = %b out3 = %b",
  in1, in2, in3, in4, out1, out2, out3);
  in1 = 0;
  in2 = 0;
  in3 = 0;
  in4 = 0;
  #1 in1 = 1;
  #1 in2 = 1;
  #1 in3 = 1;
  #1 in4 = 1;
  #1 $finish;
end

endmodule
