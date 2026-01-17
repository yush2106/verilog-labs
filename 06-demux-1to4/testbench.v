`timescale 1ns/1ns

module testbench();

reg d_in;
reg[1:0] sel;
wire[3:0] y_out;

demux1to4 my_UUT(
  .d(d_in)
  , .s(sel)
  , .y(y_out)
);

initial
begin
  d_in = 0;
  sel = 2'b00;
  
  #10;  //10ns
  sel = 2'b01;
  
  #10;  //20ns
  sel = 2'b10;
  
  #10;  //30ns
  sel = 2'b11;
  
  #10;  //40ns
  d_in = 1;
  sel = 2'b00;
  
  #10;  //50ns
  sel = 2'b01;
  
  #10;  //60ns
  sel = 2'b10;

  #10;  //70ns
  sel = 2'b11;
  
  #10;  //80ns
end

endmodule