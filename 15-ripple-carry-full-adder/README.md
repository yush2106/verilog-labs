## Ripple Carry Full Adder

The ripple carry full adder contains 4 bit binary adders. It can do addition through lower bit to upper bit.

![image](https://github.com/yush2106/verilog-labs/blob/main/15-ripple-carry-full-adder/img/15-ripple-carry-full-adder-01.jpg)

## Process Step

Step 1: Binary Full Adder
```
module BinaryFullAdder(
  input wire a
  , input wire b
  , input wire c_in
  , output wire sum
  , output wire c_out
);

assign sum = a ^ b ^ c_in;    //summation
assign c_out = ((a & b) | c_in & (a ^ b));    //carry out

endmodule
```

Step 2: Ripple Carry Adder
```
module RippleCarryAdder(
  input wire[3:0] a
  , input wire[3:0] b
  , input wire c_in
  , output wire[3:0] sum
  , output wire c_out
);

wire c1, c2, c3;
//bit0
BinaryFullAdder adder0(.a(a[0]), .b(b[0]), .c_in(c_in), .sum(sum[0]), .c_out(c1));
//bit1
BinaryFullAdder adder1(.a(a[1]), .b(b[1]), .c_in(c1), .sum(sum[1]), .c_out(c2));
//bit2
BinaryFullAdder adder2(.a(a[2]), .b(b[2]), .c_in(c2), .sum(sum[2]), .c_out(c3));
//bit3
BinaryFullAdder adder3(.a(a[3]), .b(b[3]), .c_in(c3), .sum(sum[3]), .c_out(c_out));

endmodule
```

Step 3: Testbench
```
`timescale 1ns/1ns
module testbench();

reg[3:0] a;
reg[3:0] b;
reg c_in;
wire[3:0] sum;
wire c_out;

RippleCarryAdder myUUT(
  .a(a)
  , .b(b)
  , .c_in(c_in)
  , .sum(sum)
  , .c_out(c_out)
);

initial begin
  a = 4'b0000;
  b = 4'b0000;
  c_in = 1'b0;
  
  #10;
  a = 4'b0101;
  b = 4'b1011;
  c_in = 1'b1;
  
  #10;
  a = 4'b0111;
  b = 4'b1001;
  c_in = 1'b0;
  
  #10;
  a = 4'b0110;
  b = 4'b1100;
  c_in = 1'b1;
  
  #10;
end

endmodule
```

Step 4: Simulation

When input A is 4'b0101, B is 4'b1011, carry in is 1'b1, then output sum is 4'b0001, carry out is 1'b1.

When input A is 4'b0111, B is 4'b1001, carry in is 1'b0, then output sum is 4'b0000, carry out is 1'b1.

When input A is 4'b0110, B is 4'b1100, carry in is 1'b1, then output sum is 4'b0011, carry out is 1'b1.

![image](https://github.com/yush2106/verilog-labs/blob/main/15-ripple-carry-full-adder/img/15-ripple-carry-full-adder-02.jpg)

Step 5: Block Diagram

Set input a is SW[3..0], b is SW[7..4], c_in is SW[8]. Set output sum is LEDG[3..0], c_out is LEDG[4].

![image](https://github.com/yush2106/verilog-labs/blob/main/15-ripple-carry-full-adder/img/15-ripple-carry-full-adder-03.jpg)

Step 6: Hardware Emulation

![image](https://github.com/yush2106/verilog-labs/blob/main/15-ripple-carry-full-adder/img/15-ripple-carry-full-adder-04.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/15-ripple-carry-full-adder/img/15-ripple-carry-full-adder-05.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/15-ripple-carry-full-adder/img/15-ripple-carry-full-adder-06.jpg)