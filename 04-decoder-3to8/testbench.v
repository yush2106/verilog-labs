`timescale 1ns/1ns
module testbench;

reg [2:0] d_in;
wire [7:0] y_out;

decoder3to8 my_UUT(
  .d(d_in)
  , .y(y_out)
);

initial
begin
  d_in = 3'b000;    //y[7:0] = 8'b11111110
  #10;
  d_in = 3'b001;    //y[7:0] = 8'b11111101
  #10;
  d_in = 3'b010;    //y[7:0] = 8'b11111011
  #10;
  d_in = 3'b011;    //y[7:0] = 8'b11110111
  #10;
  d_in = 3'b100;    //y[7:0] = 8'b11101111
  #10;
  d_in = 3'b101;    //y[7:0] = 8'b11011111
  #10;
  d_in = 3'b110;    //y[7:0] = 8'b10111111
  #10;
  d_in = 3'b111;    //y[7:0] = 8'b01111111
  #10;
end

endmodule