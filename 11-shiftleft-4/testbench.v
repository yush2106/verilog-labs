`timescale 1ns/1ns
module testbench();

reg d_in;
reg clk_in;
reg rst_in;

wire[3:0] y_out;

ShiftLeft4 myUUT(
  .d(d_in)
  , .clk(clk_in)
  , .rst(rst_in)
  , .y(y_out)
);

initial
$monitor($time, "d_in=%b, clk=%b, rst=%b, y=%b", d_in, clk_in, rst_in, y_out);

initial
begin
  d_in = 0;
  clk_in = 0;
  rst_in = 0;
end

initial
begin
  #20  d_in = 1;
  #25  rst_in = 1;
  #50  d_in = 0;
  #30  d_in = 1;
  #20  rst_in = 0;    //reset pressed
  #30  d_in = 0;
  #40  d_in = 1;
  #30  rst_in = 1;
  #40  d_in = 0;
end

always #5 clk_in = ~clk_in;

initial #500 $stop;

endmodule