## Demultiplexer 1 to 4

There's a input d, the demultiplexer set one of the output y by the selection s.

![image](https://github.com/yush2106/verilog-labs/blob/main/06-demux-1to4/img/06-demux-1to4-01.jpg)

## Truth Table

|s[1]|s[0]|y[3]|y[2]|y[1]|y[0]|
|---|---|---|---|---|---|
|0|0|0|0|0|d|
|0|1|0|0|d|0|
|1|0|0|d|0|0|
|1|1|d|0|0|0|

## Process Step

Step 1: Demultiplexer module
```
module demux1to4(
  input wire d
  , input wire[1:0] s
  , output wire[3:0] y
);

assign y[0] = (~s[1] & ~s[0]) & d,    //s[1:0] = 2'b00
       y[1] = (~s[1] &  s[0]) & d,    //s[1:0] = 2'b01
       y[2] = ( s[1] & ~s[0]) & d,    //s[1:0] = 2'b10
       y[3] = ( s[1] &  s[0]) & d;    //s[1:0] = 2'b11

endmodule
```

Step 2: Testbench
```
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
```

Step 3: Simulation

When s[1:0] value is 2'b00, y[0] valiue is b.

When s[1:0] value is 2'b01, y[1] valiue is b.

When s[1:0] value is 2'b10, y[2] valiue is b.

When s[1:0] value is 2'b11, y[3] valiue is b.

![image](https://github.com/yush2106/verilog-labs/blob/main/06-demux-1to4/img/06-demux-1to4-02.jpg)

Step 4: Hardware Emulation

Set SW2 for input d, SW1 and SW0 for selection s[1:0], LEDR0 to LEDR3 for output y[3:0].

![image](https://github.com/yush2106/verilog-labs/blob/main/06-demux-1to4/img/06-demux-1to4-03.jpg)

When b value is 1'b1 and SW[0] to S[1] value is 2'b00, LEDR[0] to LEDR[3] value is 4'b0001.

![image](https://github.com/yush2106/verilog-labs/blob/main/06-demux-1to4/img/06-demux-1to4-04.jpg)

When b value is 1'b1 and SW[0] to S[1] value is 2'b01, LEDR[0] to LEDR[3] value is 4'b0010.

![image](https://github.com/yush2106/verilog-labs/blob/main/06-demux-1to4/img/06-demux-1to4-05.jpg)

When b value is 1'b1 and SW[0] to S[1] value is 2'b10, LEDR[0] to LEDR[3] value is 4'b0100.

![image](https://github.com/yush2106/verilog-labs/blob/main/06-demux-1to4/img/06-demux-1to4-06.jpg)

When b value is 1'b1 and SW[0] to S[1] value is 2'b11, LEDR[0] to LEDR[3] value is 4'b1000.

![image](https://github.com/yush2106/verilog-labs/blob/main/06-demux-1to4/img/06-demux-1to4-07.jpg)