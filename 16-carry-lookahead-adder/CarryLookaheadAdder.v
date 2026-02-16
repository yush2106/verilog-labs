module CarryLookaheadAdder(
  input wire[3:0] a
  , input wire[3:0] b
  , input wire c_in
  , output wire[3:0] sum
  , output wire c_out
);

wire[3:0] G;    //Generate
wire[3:0] P;    //Propagate
wire[4:0] C;    //Carry

assign C[0] = c_in;

assign G = a & b;    //a and b
assign P = a ^ b;    //a xor b

//carry lookahead
assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] &
  G[0] | (P[0] & C[0])
);
assign C[3] = G[2] | (P[2] & (
  G[1] | (P[1] &
  G[0] | (P[0] & C[0])
)));
assign C[4] = G[3] | (P[3] & (
  G[2] | (P[2] & (
  G[1] | (P[1] &
  G[0] | (P[0] & C[0])
)))));

assign sum = P ^ C[3:0];    //A xor B xor c_in
assign c_out = C[4];    //upper bit carry out

endmodule