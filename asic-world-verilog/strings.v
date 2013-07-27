//-----------------------------------------------------
// Design Name : strings
// File Name   : strings.v
// Function    : This program shows how string
//               can be stored in reg
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module strings();
// Declare a register variable that is 21 bytes
reg [8*21:0] string ;

initial begin
  string = "This is sample string";
  $display ("%s \n", string);
end

endmodule
