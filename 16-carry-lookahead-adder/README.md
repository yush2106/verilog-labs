## Carry Lookahead Adder

The carry lookahead adder improves the process efficiency and reduce the latency in the addition of ripple carry adder.

![image](https://github.com/yush2106/verilog-labs/blob/main/16-carry-lookahead-adder/img/16-carry-lookahead-adder-01.jpg)

There are 2 carry concepts, generate carry and propagate carry, in the carry lookahead adder.

### Generate Carry
*G[i] = a[i] & b[i]*

### Propagate Carry
*P[i] = a[i] ^ b[i]*

Then lookahead carry in for next bit should be

*C[i + 1] = G[i] | ( P[i] & C[i] )*

## Process Step

Step 1: Carry Lookahead Adder
```
module CarryLookaheadAdder(
  input wire[3:0] a
  , input wire[3:0] b
  , input wire c_in
  , output wire[3:0] sum
  , output wire c_out
);

wire[3:0] G;    //Generate
wire[3:0] P;    //Propagate
wire[4:0] C;    //Carry

assign C[0] = c_in;

assign G = a & b;    //a and b
assign P = a ^ b;    //a xor b

//carry lookahead
assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] &
  G[0] | (P[0] & C[0])
);
assign C[3] = G[2] | (P[2] & (
  G[1] | (P[1] &
  G[0] | (P[0] & C[0])
)));
assign C[4] = G[3] | (P[3] & (
  G[2] | (P[2] & (
  G[1] | (P[1] &
  G[0] | (P[0] & C[0])
)))));

assign sum = P ^ C[3:0];    //A xor B xor c_in
assign c_out = C[4];    //upper bit carry out

endmodule
```

Step 2: Testbench
```
`timescale 1ns/1ns
module testbench();

reg[3:0] a;
reg[3:0] b;
reg c_in;
wire[3:0] sum;
wire c_out;

CarryLookaheadAdder myUUT(
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

Step 3: Simulation

When input A is 4'b0101, B is 4'b1011, carry in is 1'b1, then output sum is 4'b0001, carry out is 1'b1.

When input A is 4'b0111, B is 4'b1001, carry in is 1'b0, then output sum is 4'b0000, carry out is 1'b1.

When input A is 4'b0110, B is 4'b1100, carry in is 1'b1, then output sum is 4'b0011, carry out is 1'b1.

![image](https://github.com/yush2106/verilog-labs/blob/main/15-ripple-carry-full-adder/img/15-ripple-carry-full-adder-02.jpg)

Step 4: Block Diagram

![image](https://github.com/yush2106/verilog-labs/blob/main/16-carry-lookahead-adder/img/16-carry-lookahead-adder-02.jpg)

Step 5: Hardware Emulation

![image](https://github.com/yush2106/verilog-labs/blob/main/15-ripple-carry-full-adder/img/15-ripple-carry-full-adder-04.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/15-ripple-carry-full-adder/img/15-ripple-carry-full-adder-05.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/15-ripple-carry-full-adder/img/15-ripple-carry-full-adder-06.jpg)