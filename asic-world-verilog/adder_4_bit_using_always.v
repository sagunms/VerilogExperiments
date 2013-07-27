module adder_4_bit_using_always ();
reg[3:0] a, b;
reg [3:0] sum;
reg carry;

always @ (a or b) 
begin 
  {carry,sum} = a + b; 
end 

initial begin
  $monitor (" A = %b B = %b CARRY = %b SUM = %b",a,b,carry,sum);
  #10 a = 8;
   b = 7;
   #10 a = 10;
   #10 b = 15;
   #10 a = 0; 
   #10 b = 0; 
   #10 $finish; 
end
  
endmodule  
