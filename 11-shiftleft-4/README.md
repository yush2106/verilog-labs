## Register 4 Bits Shift Left

The input click signal drives the process to shift left register.

Each register shift left 1 bit by the clock pulse, and the input d signal send to the right register y[0].

The output y[3:0] will be reset when the rst signal input.

![image](https://github.com/yush2106/verilog-labs/blob/main/11-shiftleft-4/img/11-shiftleft-4-01.jpg)

## Truth Table

|clk|d|y[3]|y[2]|y[1]|y[0]|
|---|---|---|---|---|---|
|clk_0|d_0|y[2]|y[1]|y[0]|d_0|
|clk_1|d_1|y[1]|y[0]|d_0|d_1|
|clk_2|d_2|y[0]|d_0|d_1|d_2|
|clk_3|d_3|d_0|d_1|d_2|d_3|

## Process Step

Step 1: Shift Left 4

```
module ShiftLeft4(
  input wire d
  , input wire clk
  , input wire rst
  , output reg[3:0] y
);

parameter length = 4;
integer i;

initial
begin
  y = 4'b0000;
end

always @(posedge clk, negedge rst)
begin
  if(!rst) begin
    y = 4'b0000;    //reset output
  end
  else
    begin
      y[0] <= d;    //data input
      //shift left register
      for(i = 0; i < length-1; i=i+1)
        y[i+1] <= y[i];
    end
end

endmodule
```

Step 2: Testbench

```
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
```

Step 3: Simulation

Input clock drives the process to sift left the registers for output signal when the rst was released.

![image](https://github.com/yush2106/verilog-labs/blob/main/11-shiftleft-4/img/11-shiftleft-4-02.jpg)

Step 4: Block Diagram

The 50Mhz clock, CLOCK_50, on the DE2-115 development board input signal drives the process through the Clock Divider which generate 2Hz pulse signal for the Shift Left block input.

It shifts left the registers when the clock inputs and sets the input d signal to the right signal LEDR[0].

![image](https://github.com/yush2106/verilog-labs/blob/main/11-shiftleft-4/img/11-shiftleft-4-03.jpg)

Step 5: Hardware Emulation

When SW0 signal is on, it sets the LEDR0 on.

Then, it shifts left registers when clock signal inputs by 2Hz.

![image](https://github.com/yush2106/verilog-labs/blob/main/11-shiftleft-4/img/11-shiftleft-4-04.jpg)