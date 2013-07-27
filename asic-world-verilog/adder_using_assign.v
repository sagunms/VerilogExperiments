module adder_using_assign ();
reg a, b;
wire sum, carry;

assign #5 {carry,sum} = a+b; 

initial begin
  $monitor (" A = %b  B = %b CARRY = %b SUM = %b",a,b,carry,sum);
  #10 a = 0;
  b = 0;
  #10  a = 1;
  #10  b = 1;
  #10  a = 0;
  #10  b = 0;
  #10 $finish;
end

endmodule 
