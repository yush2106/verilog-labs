## Decoder 3 To 8

There are 3 inputs and 8 outputs in the decoder.

Compose 3 input signal, switch one bit of the output signals.

![image](https://github.com/yush2106/verilog-labs/blob/main/04-decoder-3to8/img/04-decoder-3to8-01.jpg)

## Truth Table

|d[2]|d[1]|d[0]|y[7]|y[6]|y[5]|y[4]|y[3]|y[2]|y[1]|y[0]|
|---|---|---|---|---|---|---|---|---|---|---|
|0|0|0|1|1|1|1|1|1|1|0|
|0|0|1|1|1|1|1|1|1|0|1|
|0|1|0|1|1|1|1|1|0|1|1|
|0|1|1|1|1|1|1|0|1|1|1|
|1|0|0|1|1|1|0|1|1|1|1|
|1|0|1|1|1|0|1|1|1|1|1|
|1|1|0|1|0|1|1|1|1|1|1|
|1|1|1|0|1|1|1|1|1|1|1|

## Process Step

Step 1: Decoder module

```
module decoder3to8(
  input wire[2:0] d,
  output wire[7:0] y
);

assign
  y[0] = ~( ~d[2] & ~d[1] & ~d[0] ),    //d[2:0] = 3'b000
  y[1] = ~( ~d[2] & ~d[1] &  d[0] ),    //d[2:0] = 3'b001
  y[2] = ~( ~d[2] &  d[1] & ~d[0] ),    //d[2:0] = 3'b010
  y[3] = ~( ~d[2] &  d[1] &  d[0] ),    //d[2:0] = 3'b011
  y[4] = ~(  d[2] & ~d[1] & ~d[0] ),    //d[2:0] = 3'b100
  y[5] = ~(  d[2] & ~d[1] &  d[0] ),    //d[2:0] = 3'b101
  y[6] = ~(  d[2] &  d[1] & ~d[0] ),    //d[2:0] = 3'b110
  y[7] = ~(  d[2] &  d[1] &  d[0] );    //d[2:0] = 3'b111

endmodule
```

Step 2: Testbench

```
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
```

Step 3: Simulation

When input d[2:0] is 3'b000, output y[7:0] is 8'b11111110.

When input d[2:0] is 3'b001, output y[7:0] is 8'b11111101.

When input d[2:0] is 3'b010, output y[7:0] is 8'b11111011.

When input d[2:0] is 3'b011, output y[7:0] is 8'b11110111.

When input d[2:0] is 3'b100, output y[7:0] is 8'b11101111.

When input d[2:0] is 3'b101, output y[7:0] is 8'b11011111.

When input d[2:0] is 3'b110, output y[7:0] is 8'b10111111.

When input d[2:0] is 3'b111, output y[7:0] is 8'b01111111.

![image](https://github.com/yush2106/verilog-labs/blob/main/04-decoder-3to8/img/04-decoder-3to8-02.jpg)

Step 4: Hardware Emulation

Build a block diagram. Set the block diagram is Top-Level Entity.

![image](https://github.com/yush2106/verilog-labs/blob/main/04-decoder-3to8/img/04-decoder-3to8-03.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/04-decoder-3to8/img/04-decoder-3to8-04.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/04-decoder-3to8/img/04-decoder-3to8-05.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/04-decoder-3to8/img/04-decoder-3to8-06.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/04-decoder-3to8/img/04-decoder-3to8-07.jpg)