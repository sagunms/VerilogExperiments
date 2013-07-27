module mux_without_default (a,b,c,d,sel,y);
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
  2'bxx,2'bx0,2'bx1,2'b0x,2'b1x,
  2'bzz,2'bz0,2'bz1,2'b0z,2'b1z : $display("Error in SEL");
endcase 

endmodule
