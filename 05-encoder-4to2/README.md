## Encoder 4 To 2

There are 4 input signals of Encoder, switch one of the 4 input signals, then export 2 bit signals.

![image](https://github.com/yush2106/verilog-labs/blob/main/05-encoder-4to2/img/05-encoder-4to2-01.jpg)

## Truth Table

|d[3]|d[2]|d[1]|d[0]|y[1]|y[0]|
|---|---|---|---|---|---|
|0|0|0|1|0|0|
|0|0|1|0|0|1|
|0|1|0|0|1|0|
|1|0|0|0|1|1|

## Process Step

Step1: Encoder module

```
module encoder4to2(
  input wire[3:0] d
  , output wire[1:0] y
);

assign y[0] = ((~d[0] & ~d[2]) & ((d[1] & ~d[3]) | (~d[1] & d[3]))),
  y[1] = ((~d[0] & ~d[1]) & ((d[2] & ~d[3]) | (~d[2] & d[3])));

endmodule
```

Step2: Testbench

```
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
```

Step 3: Simulation

When d[3:0] value is 4'b0001, y[1:0] is value 2'b00.

When d[3:0] value is 4'b0010, y[1:0] is value 2'b01.

When d[3:0] value is 4'b0100, y[1:0] is value 2'b10.

When d[3:0] value is 4'b1000, y[1:0] is value 2'b11.

![image](https://github.com/yush2106/verilog-labs/blob/main/05-encoder-4to2/img/05-encoder-4to2-02.jpg)

Step 4: Hardware Emulation

Set SW0 to SW3 for input d[3:0], LEDR0 to LEDR1 for output y[1:0].

![image](https://github.com/yush2106/verilog-labs/blob/main/05-encoder-4to2/img/05-encoder-4to2-03.jpg)

When SW[0] to S[3] value is 4'b0001, LEDR[0] to LEDR[1] value is 2'b00.

![image](https://github.com/yush2106/verilog-labs/blob/main/05-encoder-4to2/img/05-encoder-4to2-04.jpg)

When SW[0] to S[3] value is 4'b0010, LEDR[0] to LEDR[1] value is 2'b01.

![image](https://github.com/yush2106/verilog-labs/blob/main/05-encoder-4to2/img/05-encoder-4to2-05.jpg)

When SW[0] to S[3] value is 4'b0100, LEDR[0] to LEDR[1] value is 2'b10.

![image](https://github.com/yush2106/verilog-labs/blob/main/05-encoder-4to2/img/05-encoder-4to2-06.jpg)

When SW[0] to S[3] value is 4'b1000, LEDR[0] to LEDR[1] value is 2'b11.

![image](https://github.com/yush2106/verilog-labs/blob/main/05-encoder-4to2/img/05-encoder-4to2-07.jpg)