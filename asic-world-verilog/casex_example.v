module casex_example();
reg [3:0] opcode;
reg [1:0] a,b,c;
reg [1:0] out;

always @ (opcode or a or b or c)
casex(opcode)
  4'b1zzx : begin // Don't care  2:0 bits
              out = a; 
              $display("@%0dns 4'b1zzx is selected, opcode %b",$time,opcode);
            end
  4'b01?? : begin // bit 1:0 is don't care
              out = b; 
              $display("@%0dns 4'b01?? is selected, opcode %b",$time,opcode);
            end
  4'b001? : begin // bit 0 is don't care
              out = c;
              $display("@%0dns 4'b001? is selected, opcode %b",$time,opcode);
            end
  default : begin
              $display("@%0dns default is selected, opcode %b",$time,opcode);
            end
endcase 

// Testbench code goes here
always #2 a = $random;
always #2 b = $random;
always #2 c = $random;

initial begin
  opcode = 0;
  #2 opcode = 4'b101x;
  #2 opcode = 4'b0101;
  #2 opcode = 4'b0010;
  #2 opcode = 4'b0000;
  #2 $finish;
end

endmodule
