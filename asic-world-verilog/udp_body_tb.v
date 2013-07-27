`include "udp_body.v"
module udp_body_tb();

reg b,c;
wire a;

udp_body udp (a,b,c);

initial begin
  $monitor(" B = %b C = %b  A = %b",b,c,a);
  b = 0;
  c = 0;
  #1 b = 1;
  #1 b = 0;
  #1 c = 1;
  #1 b = 1'bx;
  #1 c = 0;
  #1 b = 1;
  #1 c = 1'bx;
  #1 b = 0;
  #1 $finish;
end  

endmodule
