module case_xz(enable);
input enable;

always @ (enable)
case(enable)
  1'bz : $display ("enable is floating"); 
  1'bx : $display ("enable is unknown"); 
  default : $display ("enable is %b",enable); 
endcase 

endmodule
