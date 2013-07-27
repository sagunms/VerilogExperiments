module  function_calling(a, b, c, d, e, f);
                   
input a, b, c, d, e ;
output f;
wire f;
`include "myfunction.v"
  	 
assign f =  (myfunction (a,b,c,d)) ? e :0;
  	 
endmodule
