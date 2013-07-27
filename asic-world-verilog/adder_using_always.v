module adder_using_always ();
reg a, b;
reg sum, carry; 

always @ (a or b) 
begin 
  {carry,sum} = a + b; 
end

initial begin 
  $monitor (" A = %b B = %b CARRY = %b SUM = %b",a,b,carry,sum);
  #10 a = 0; 
   b = 0; 
   #10 a = 1; 
   #10 b = 1; 
   #10 a = 0; 
   #10 b = 0; 
   #10 $finish; 
end  
  
endmodule
