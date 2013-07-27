event reset_trigger; 
  event  reset_done_trigger; 
    
  initial begin 
    forever begin 
      @ (reset_trigger); 
      @ (negedge clk); 
      reset = 1; 
      @ (negedge clk); 
      reset = 0; 
      -> reset_done_trigger; 
    end 
  end
