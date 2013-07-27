module mux (a,b,c,d,sel,y); 
input a, b, c, d; 
input [1:0] sel; 
output y; 

reg y;

always @ (a or b or c or d or sel) 
case (sel) 
  0 : y = a; 
  1 : y = b; 
  2 : y = c; 
  3 : y = d; 
  default : $display("Error in SEL"); 
endcase 
    
endmodule
