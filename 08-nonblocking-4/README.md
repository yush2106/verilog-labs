## Non-Blocking Procedural Assignment

This project demonstrates the non-blocking procedual assignment.

The output signals are assigned, but are updated when the next clock event occurs.

## Process Step

Step 1: Non-Blocking Module
```
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
```

Step 2: Testbench
```
`timescale 1ns/1ns
module testbench();
reg CLK;
reg RST;
reg d_in;

wire[3:0] y_out;

nonblocking4 my_UUT(
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
```

Step 3: Simulation

When a clock event is triggered, the output signals value are assigned.

The output signals value will be updated on the next clock event.

![image](https://github.com/yush2106/verilog-labs/blob/main/08-nonblocking-4/img/08-nonblocking-4-01.jpg)