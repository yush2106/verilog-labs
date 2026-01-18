`timescale 1ns/1ns
module testbench();
reg CLK;
reg RST;
reg d_in;

wire[3:0] y_out;

blocking4 my_UUT(
  .d(d_in)
  , .Clock(CLK)
  , .Reset(RST)
  , .out(y_out)
);

initial
//display message
$monitor($time, "Data in=%b, CLK=%b, RST=%b, Y=%b", d_in, CLK, RST, y_out);

initial
begin
  CLK = 0;
  RST = 1;
  d_in = 0;
end

initial
begin
  #25 RST = 0;    //reset is 0
  #50 d_in = 1;
  #110 d_in = 0;
  #90 d_in = 1;
end

always #10 CLK = ~CLK;    //reverse clock

initial # 350 $finish;    //finish simulation
endmodule