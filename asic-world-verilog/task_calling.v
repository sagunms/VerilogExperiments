module  task_calling (temp_a, temp_b, temp_c, temp_d);
input [7:0] temp_a, temp_c;
output [7:0] temp_b, temp_d;
reg [7:0] temp_b, temp_d;
`include "mytask.v"
  	 
always @ (temp_a)
begin	
  convert (temp_a, temp_b);
end  

always @ (temp_c)
begin	
  convert (temp_c, temp_d);
end  
  	 
endmodule
