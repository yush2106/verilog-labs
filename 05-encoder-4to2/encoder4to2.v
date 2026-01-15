module encoder4to2(
  input wire[3:0] d
  , output wire[1:0] y
);

assign y[0] = ((~d[0] & ~d[2]) & ((d[1] & ~d[3]) | (~d[1] & d[3]))),
  y[1] = ((~d[0] & ~d[1]) & ((d[2] & ~d[3]) | (~d[2] & d[3])));

endmodule