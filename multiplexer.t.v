// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  reg addr0, addr1;
  reg in0,in1,in2,in3;
  wire out;

  // behavioralMultiplexer multiplexer (out,addr0,addr1,in0,in1,in2,in3);
  structuralMultiplexer multiplexer (out,addr0,addr1,in0,in1,in2,in3);

  initial begin
  $dumpfile("multiplexer.vcd");
  $dumpvars;
  $display("i0 i1 i2 i3 A0 A1| out | Expected Output");
  in0=0;in1=1'bX;in2=1'bX;in3=1'bX;addr0=0;addr1=0; #1000
  $display("%b  %b  %b  %b  %b  %b |  %b  | False", in0, in1, in2, in3, addr0, addr1, out);
  in0=1;in1=1'bX;in2=1'bX;in3=1'bX;addr0=0;addr1=0; #1000
  $display("%b  %b  %b  %b  %b  %b |  %b  | True", in0, in1, in2, in3, addr0, addr1, out);

  in0=1'bX;in1=0;in2=1'bX;in3=1'bX;addr0=1;addr1=0; #1000
  $display("%b  %b  %b  %b  %b  %b |  %b  | False", in0, in1, in2, in3, addr0, addr1, out);
  in0=1'bX;in1=1;in2=1'bX;in3=1'bX;addr0=1;addr1=0; #1000
  $display("%b  %b  %b  %b  %b  %b |  %b  | True", in0, in1, in2, in3, addr0, addr1, out);

  in0=1'bX;in1=1'bX;in2=0;in3=1'bX;addr0=0;addr1=1; #1000
  $display("%b  %b  %b  %b  %b  %b |  %b  | False", in0, in1, in2, in3, addr0, addr1, out);
  in0=1'bX;in1=1'bX;in2=1;in3=1'bX;addr0=0;addr1=1; #1000
  $display("%b  %b  %b  %b  %b  %b |  %b  | True", in0, in1, in2, in3, addr0, addr1, out);

  in0=1'bX;in1=1'bX;in2=1'bX;in3=0;addr0=1;addr1=1; #1000
  $display("%b  %b  %b  %b  %b  %b |  %b  | False", in0, in1, in2, in3, addr0, addr1, out);
  in0=1'bX;in1=1'bX;in2=1'bX;in3=1;addr0=1;addr1=1; #1000
  $display("%b  %b  %b  %b  %b  %b |  %b  | True", in0, in1, in2, in3, addr0, addr1, out);
  end
endmodule
