initial  
  begin: TEST_CASE 
    #10 -> reset_trigger; 
    @ (reset_done_trigger); 
    @ (negedge clk); 
    enable = 1; 
    repeat (10) begin 
      @ (negedge clk); 
    end 
    enable = 0; 
    #5 -> terminate_sim; 
  end 

