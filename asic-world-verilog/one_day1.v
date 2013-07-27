module arbiter (
// Two slashes make a comment line.
clock      , // clock
reset      , // Active high, syn reset
req_0      , // Request 0
req_1      , // Request 1
gnt_0      , // Grant 0
gnt_1        // Grant 1
);
//-------------Input Ports-----------------------------
// Note : all commands are semicolon-delimited
input           clock               ;
input           reset               ;
input           req_0               ;
input           req_1               ;
//-------------Output Ports----------------------------
output        gnt_0                 ;
output        gnt_1                 ;
