`timescale 1ns/1ns
module testbench();

reg[3:0] a;
reg[3:0] b;
reg borrow_in;
wire[3:0] diff;
wire borrow_out;

Subtractor4 myUUT(
  .a(a)
  , .b(b)
  , .borrow_in(borrow_in)
  , .diff(diff)
  , .borrow_out(borrow_out)
);

initial begin
a = 0;
b = 0;
borrow_in = 0;

#10;
a = 4'd8;
b = 4'd5;
borrow_in = 1'b0;

#10;
a = 4'd12;
b = 4'd6;
borrow_in = 1'b1;

#10;
a = 4'd6;
b = 4'd10;
borrow_in = 1'b0;

#10;
a = 4'd3;
b = 4'd8;
borrow_in = 1'b1;

#10;
end

endmodule