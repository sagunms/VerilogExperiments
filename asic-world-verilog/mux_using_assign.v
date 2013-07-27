module mux_using_assign();
reg data_in_0, data_in_1;
wire data_out;
reg  sel;

assign data_out = (sel) ? data_in_1 : data_in_0; 

// Testbench code here
initial begin
  $monitor("TIME = %g SEL = %b DATA0 = %b DATA1 = %b OUT = %b",
    $time,sel,data_in_0,data_in_1,data_out);
  data_in_0 = 0;
  data_in_1 = 0;
  sel = 0;
  #10 sel = 1;
  #10 $finish;
end

// Toggel data_in_0 at #1
always
 #1 data_in_0 = ~data_in_0;

// Toggel data_in_1 at #2
always
 #2 data_in_1 = ~data_in_1;

endmodule
