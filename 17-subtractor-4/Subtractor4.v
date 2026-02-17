module Subtractor4(
  input wire[3:0] a
  , input wire[3:0] b
  , input wire borrow_in
  , output wire[3:0] diff
  , output wire borrow_out
);

//a - b - borrow_in
//use 2's complement addition, -b = (not b) + 1
//a - b - borrow_in = a + (not b) + 1 - borrow_in
//convert (1 - borrow_in) = (borrow_in ? 0 : 1)

wire[3:0] inv_b;
assign inv_b = b ^ {4{1'b1}};    //(not b) = (b xor 4'b1111)

wire[4:0] sum;
assign sum = {1'b0, a} + {1'b0, inv_b} + {{4{1'b0}}, (borrow_in ? 0 : 1)};

assign diff = sum[3:0];
assign borrow_out = ~sum[4];

endmodule