primitive udp_sequential(q, clk, d);
output q; 
input clk, d;

reg q;

table
// obtain output on rising edge of clk
// clk         d        q       q+
   (01)         0   :   ?   :   0   ;
   (01)         1   :   ?   :   1   ;
   (0?)         1   :   1   :   1   ;
   (0?)         0   :   0   :   0   ;
// ignore negative edge of clk
   (?0)         ?   :   ?   :   -   ; 
// ignore d changes on steady clk
   ?      (??)      :   ?   :   -   ;
 endtable

endprimitive
