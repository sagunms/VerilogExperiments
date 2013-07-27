module assign_deassign ();

reg clk,rst,d,preset;
wire q;

initial begin
  $monitor("@%g clk %b rst %b preset %b d %b q %b", 
    $time, clk, rst, preset, d, q);
  clk = 0;
  rst = 0;
  d  = 0;
  preset = 0;
  #10 rst = 1;
  #10 rst = 0;
  repeat (10) begin
    @ (posedge clk);
    d <= $random;
    @ (negedge clk) ;
    preset <= ~preset;
  end
  #1 $finish;
end
// Clock generator
always #1 clk = ~clk;

// assign and deassign q of flip flop module
always @(preset)
if (preset) begin
  assign U.q = 1; // assign procedural statement
end else begin
 deassign U.q;    // deassign procedural statement
end

d_ff U (clk,rst,d,q);

endmodule

// D Flip-Flop model
module d_ff (clk,rst,d,q);
input clk,rst,d;
output q;
reg q;

always @ (posedge clk)
if (rst) begin
  q <= 0;
end else begin
  q <= d;
end

endmodule
