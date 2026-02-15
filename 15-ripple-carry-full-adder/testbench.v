`timescale 1ns/1ns
module testbench();

reg[3:0] a;
reg[3:0] b;
reg c_in;
wire[3:0] sum;
wire c_out;

RippleCarryAdder myUUT(
  .a(a)
  , .b(b)
  , .c_in(c_in)
  , .sum(sum)
  , .c_out(c_out)
);

initial begin
  a = 4'b0000;
  b = 4'b0000;
  c_in = 1'b0;
  
  #10;
  a = 4'b0101;
  b = 4'b1011;
  c_in = 1'b1;
  
  #10;
  a = 4'b0111;
  b = 4'b1001;
  c_in = 1'b0;
  
  #10;
  a = 4'b0110;
  b = 4'b1100;
  c_in = 1'b1;
  
  #10;
end

endmodule