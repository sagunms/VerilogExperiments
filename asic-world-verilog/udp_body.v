// This code shows how UDP body looks like
primitive udp_body (
a, // Port a
b, // Port b
c  // Port c
);
output a;
input b,c;

// UDP function code here
// A = B | C;
table
 // B  C    : A
    ?  1    : 1;
    1  ?    : 1;
    0  0    : 0;
endtable

endprimitive
