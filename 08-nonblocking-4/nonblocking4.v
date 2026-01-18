module nonblocking4(
  input wire d
  , input wire Clock
  , input wire Reset
  , output reg[3:0] out
);

always @(posedge Clock or posedge Reset)
if(Reset)
  out = 4'b0000;
else
  begin
    //non-blocking assignment
    out[0] <= d;
	 out[1] <= out[0];
	 out[2] <= out[1];
	 out[3] <= out[2];
  end
endmodule