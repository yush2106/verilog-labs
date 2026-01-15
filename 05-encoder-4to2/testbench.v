`timescale 1ns/1ns
module testbench;
reg[3:0] d_in;
wire[1:0] y_out;

encoder4to2 my_UUT(
  .d(d_in)
  , .y(y_out)
);

initial begin
  d_in = 4'b0001;
  #10;
  d_in = 4'b0010;
  #10;
  d_in = 4'b0100;
  #10;
  d_in = 4'b1000;
  #10;
end

endmodule