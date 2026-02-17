## 4-Bit Full Subtractor

The 4 bit full subtractor has parameters, input a, input b, input borrow_in, output diff and output borrow_out. In this project, use the 2's complement addition instead of the subtraction.

![image](https://github.com/yush2106/verilog-labs/blob/main/17-subtractor-4/img/17-subtractor-4-01.jpg)

## Process Step

Step 1: 4 Bit Subtractor
```
module Subtractor4(
  input wire[3:0] a
  , input wire[3:0] b
  , input wire borrow_in
  , output wire[3:0] diff
  , output wire borrow_out
);

//a - b - borrow_in
//use 2's complement addition, -b = (not b) + 1
//a - b - borrow_in = a + (not b) + 1 - borrow_in
//convert (1 - borrow_in) = (borrow_in ? 0 : 1)

wire[3:0] inv_b;
assign inv_b = b ^ {4{1'b1}};    //(not b) = (b xor 4'b1111)

wire[4:0] sum;
assign sum = {1'b0, a} + {1'b0, inv_b} + {{4{1'b0}}, (borrow_in ? 0 : 1)};

assign diff = sum[3:0];
assign borrow_out = ~sum[4];

endmodule
```

Step 2: Testbench
```
`timescale 1ns/1ns
module testbench();

reg[3:0] a;
reg[3:0] b;
reg borrow_in;
wire[3:0] diff;
wire borrow_out;

Subtractor4 myUUT(
  .a(a)
  , .b(b)
  , .borrow_in(borrow_in)
  , .diff(diff)
  , .borrow_out(borrow_out)
);

initial begin
a = 0;
b = 0;
borrow_in = 0;

#10;
a = 4'd8;
b = 4'd5;
borrow_in = 1'b0;

#10;
a = 4'd12;
b = 4'd6;
borrow_in = 1'b1;

#10;
a = 4'd6;
b = 4'd10;
borrow_in = 1'b0;

#10;
a = 4'd3;
b = 4'd8;
borrow_in = 1'b1;

#10;
end

endmodule
```

Step 3: Simulation

When a is 8, b is 5, borrow in is 0, then diff is 3 and borrow is 0.

When a is 12, b is 6, borrow in is 1, then diff is 5 and borrow is 0.

When a is 6, b is 10, borrow in is 0, then diff is -4 (2's complement is 12) and borrow out is 1.

When a is 3, b is 8, borrow in is 1, then diff is -6 (unsigned is 10) and borrow out is 1.

![image](https://github.com/yush2106/verilog-labs/blob/main/17-subtractor-4/img/17-subtractor-4-02.jpg)

Step 4: Block Diagram

![image](https://github.com/yush2106/verilog-labs/blob/main/17-subtractor-4/img/17-subtractor-4-03.jpg)

Step 5: Hardware Emulation

![image](https://github.com/yush2106/verilog-labs/blob/main/17-subtractor-4/img/17-subtractor-4-04.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/17-subtractor-4/img/17-subtractor-4-05.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/17-subtractor-4/img/17-subtractor-4-06.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/17-subtractor-4/img/17-subtractor-4-07.jpg)