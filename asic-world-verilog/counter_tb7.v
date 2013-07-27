 initial  
  begin : TEST_CASE 
    #10 -> reset_trigger; 
    @ (reset_done_trigger); 
    fork  
      repeat (10) begin 
         @ (negedge clk); 
        enable = $random; 
      end	
      repeat (10) begin 
        @ (negedge clk); 
        reset = $random; 
      end 
    join 
  end 
