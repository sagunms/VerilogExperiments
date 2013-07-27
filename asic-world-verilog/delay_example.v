module delay_example();

wire out1,out2,out3,out4,out5,out6;
reg b,c;

// Delay for all transitions
or     #5                   u_or     (out1,b,c);
// Rise and fall delay
and    #(1,2)               u_and    (out2,b,c);
// Rise, fall and turn off delay
nor    #(1,2,3)             u_nor    (out3,b,c);
//One Delay, min, typ and max
nand   #(1:2:3)             u_nand   (out4,b,c);
//Two delays, min,typ and max
buf    #(1:4:8,4:5:6)       u_buf    (out5,b);
//Three delays, min, typ, and max
notif1 #(1:2:3,4:5:6,7:8:9) u_notif1 (out6,b,c);

//Testbench code
initial begin
  $monitor (
  "Time=%g b=%b c=%b  out1=%b out2=%b out3=%b out4=%b out5=%b out6=%b", 
    $time, b, c , out1, out2, out3, out4, out5, out6); 
  b = 0;
  c = 0;
  #10 b = 1;
  #10 c = 1;
  #10 b = 0;
  #10 $finish;
end	

endmodule
