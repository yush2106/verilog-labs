module BinaryFullAdder(
  input wire a
  , input wire b
  , input wire c_in
  , output wire sum
  , output wire c_out
);

assign sum = a ^ b ^ c_in;    //summation
assign c_out = ((a & b) | c_in & (a ^ b));    //carry out

endmodule