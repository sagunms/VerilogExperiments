module switch_primitives();

wire  net1, net2, net3;
wire  net4, net5, net6;

tranif0 my_gate1 (net1, net2, net3);
rtranif1 my_gate2 (net4, net5, net6);

endmodule
