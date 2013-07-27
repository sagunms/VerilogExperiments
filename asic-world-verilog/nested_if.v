module nested_if();

reg [3:0] counter;
reg clk,reset,enable, up_en, down_en;

always @ (posedge clk)
// If reset is asserted
if (reset == 1'b0) begin
   counter <= 4'b0000; 
// If counter is enable and up count is asserted
end else if (enable == 1'b1 && up_en == 1'b1) begin
   counter <= counter + 1'b1;
// If counter is enable and down count is asserted
end else if (enable == 1'b1 && down_en == 1'b1) begin
   counter <= counter - 1'b1;
// If counting is disabled
end else begin
   counter <= counter; // Redundant code 
end

// Testbench code 
initial begin
  $monitor ("@%0dns reset=%b enable=%b up=%b down=%b count=%b",
             $time, reset, enable, up_en, down_en,counter);
  $display("@%0dns Driving all inputs to know state",$time);
  clk = 0;
  reset = 0;
  enable = 0;
  up_en = 0;
  down_en = 0;
  #3 reset = 1;
  $display("@%0dns De-Asserting reset",$time);
  #4 enable = 1;
  $display("@%0dns De-Asserting reset",$time);
  #4 up_en = 1;
  $display("@%0dns Putting counter in up count mode",$time);
  #10 up_en = 0;
  down_en = 1;
  $display("@%0dns Putting counter in down count mode",$time);
  #8 $finish;
end

always #1 clk = ~clk;

endmodule
