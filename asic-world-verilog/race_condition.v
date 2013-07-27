module race_condition();
reg b;

initial begin
  b = 0;
end  
  	 
initial begin
  b = 1;
end

endmodule
