// This code find the lowest bit set
module named_block_disable();

reg [31:0] bit_detect;
reg [5:0]  bit_position;
integer i;

always @ (bit_detect)
begin : BIT_DETECT
  for (i = 0; i < 32 ; i = i + 1) begin
     // If bit is set, latch the bit position
     // Disable the execution of the block
     if (bit_detect[i] == 1) begin
        bit_position = i;
        disable BIT_DETECT;
     end  else begin
        bit_position = 32;
     end
  end
end

// Testbench code here
initial begin
  $monitor(" INPUT = %b  MIN_POSITION = %d", bit_detect, bit_position);
  #1 bit_detect = 32'h1000_1000;
  #1 bit_detect = 32'h1100_0000;
  #1 bit_detect = 32'h1000_1010;
  #10 $finish;
end

endmodule
