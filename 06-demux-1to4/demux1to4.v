module demux1to4(
  input wire d
  , input wire[1:0] s
  , output wire[3:0] y
);

assign y[0] = (~s[1] & ~s[0]) & d,    //s[1:0] = 2'b00
       y[1] = (~s[1] &  s[0]) & d,    //s[1:0] = 2'b01
       y[2] = ( s[1] & ~s[0]) & d,    //s[1:0] = 2'b10
       y[3] = ( s[1] &  s[0]) & d;    //s[1:0] = 2'b11

endmodule