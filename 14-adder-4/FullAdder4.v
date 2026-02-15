module FullAdder4(
  input wire[3:0] A
  , input wire[3:0] B
  , input wire c_in
  , output wire[3:0] sum
  , output wire c_out
);

//temp sum
wire [4:0] temp;

assign temp = A + B + c_in;
assign c_out = temp[4];    //carry out
assign sum = temp[3:0];    //summary number

endmodule