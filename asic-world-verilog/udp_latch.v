primitive udp_latch(q, clk, d) ;
output q;   
input clk, d;

reg q;

table
  //clk d    q     q+
  0     1  : ? :   1   ;
  0     0  : ? :   0   ;
  1     ?  : ? :   -   ; 
endtable

endprimitive
