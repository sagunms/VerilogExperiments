  event terminate_sim;  
  initial begin  
  @ (terminate_sim); 
    #5 $finish; 
  end 
