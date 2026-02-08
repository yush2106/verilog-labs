## Arithmetic and Logic Unit (ALU) 4 bits

The ALU performs arithmetic and logic operations.

In this project, use 4 bits input A, B and Selection, then Y is 4 bits output, carry is 1 bit and overflow is 1 bit.

![image](https://github.com/yush2106/verilog-labs/blob/main/09-alu-4/img/09-alu-4-01.jpg)

## Process Step

Step 1: ALU 4 bits
```
module ALU_4 #(parameter width = 4)
(
  input wire[width-1:0] A
  , input wire[width-1:0] B
  , input wire[width-1:0] Sel
  , output reg[width-1:0] Y
  , output reg carry
  , output reg overflow
);

reg[width:0] temp = {(width+1){1'b0}};

always @(*)
begin
  carry = 1'b0;
  overflow = 1'b0;
  
  case(Sel)
    //add
    4'b0000: begin
      temp = {1'b0, A} + {1'b0, B};
      Y = temp[width-1:0];
      carry = temp[width];
      //when A and B both are positive, but Y is negative.
      //when A and B both are negative, but Y is positive.
      overflow = (~(A[width-1] ^ B[width-1])) & (A[width-1] ^ Y[width-1]);
    end
    //sub
    4'b0001: begin
      temp = {1'b0, A} - {1'b0, B};
      Y = temp[width-1:0];
      carry = temp[width];    //borrow
      //when A is positive and B is negative, but Y is negative.
      //when A is negative and B is positive, but Y is positive.
      overflow = (A[width-1] ^ B[width-1]) & (A[width-1] ^ Y[width-1]);
    end
    4'b0010: Y = A & B;    //and
    4'b0011: Y = A | B;    //or
    4'b0100: Y = A ^ B;    //xor
    4'b0101: Y = ~(A & B);    //not and
    4'b0110: Y = ~(A | B);    //not or
    4'b0111: Y = ~(A ^ B);    //not xor
    4'b1000: Y = ~A;    //not A
    4'b1001: Y = A << 1;    //shift left
    4'b1010: Y = A >> 1;    //shift right
    default: Y = {width{1'b0}};    //default value
  endcase
end

endmodule
```

Step 2: Testbench
```
`timescale 1ns/1ns

module testbench();
reg[3:0] a_in;
reg[3:0] b_in;
reg[3:0] sel_in;
wire[3:0] y_out;
wire carry_out;
wire overflow_out;

ALU_4 myUUT(
  .A(a_in)
  , .B(b_in)
  , .Sel(sel_in)
  , .Y(y_out)
  , .carry(carry_out)
  , .overflow(overflow_out)
);

initial
begin

a_in = 4'b0110;    //set a is 6
b_in = 4'b1011;    //set b value, unsigned type is 11, signed type is -5
sel_in = 4'b0000;    //add

#10;
sel_in = 4'b0001;    //sub

#10;
sel_in = 4'b0010;    //and

#10;
sel_in = 4'b0011;    //or

#10;
sel_in = 4'b0100;    //xor

#10;
sel_in = 4'b0101;    //not and

#10;
sel_in = 4'b0110;    //not or

#10;
sel_in = 4'b0111;    //not xor

#10;
sel_in = 4'b1000;    //not A

#10;
sel_in = 4'b1001;    //A shift left

#10;
sel_in = 4'b1010;    //A shift right

#10;

end

endmodule
```

Step 3: Simulation

A is 4'b0110, both unsingned value and singned value are 6.
B is 4'b1011, unsingned value is 11, but singned value is -5.

When Sel is 4'b0000, A + B for output Y is 4'b0001.
In unsigned type, 6 + 11 = 17, then carry index is 1'b1 for 16.
In signed type, 6 + (-5) = 1, output Y is 4'b0001.

When Sel is 4'b0001, A - B for output Y is 4'b1011.
Since A less than B, unsigned type 6 - 11 = -5, the carry is 1'b1 for borrow index.
In signed type, 6 - (-5) = 11 for output Y, which exceeds the 4 bits signed range -8 to 7, then overflow index is 1'b1.

When Sel is 4'b0010, A and B for output Y is 4'b0010.

When Sel is 4'b0011, A or B for output Y is 4'b1111.

When Sel is 4'b0100, A xor B for output Y is 4'b1101.

When Sel is 4'b0101, A not and B for output Y is 4'b1101.

When Sel is 4'b0110, A not or B for output Y is 4'b0000.

When Sel is 4'b0111, A not xor B for output Y is 4'b0010.

When Sel is 4'b1000, not A for output Y is 4'b1001.

When Sel is 4'b1001, A shift left 1 bit for output Y is 4'b1100.

When Sel is 4'b1010, A shift right 1 bit for output Y is 4'b0011.

![image](https://github.com/yush2106/verilog-labs/blob/main/09-alu-4/img/09-alu-4-02.jpg)

Step 4: Hardware Emulation

Configure the block diagram, A is SW[3..0], B is SW[7..4], Sel is SW[11..8], Y is LEDR[3..0], carry is LEDR[4..4] and overflow is LEDR[5..5].

![image](https://github.com/yush2106/verilog-labs/blob/main/09-alu-4/img/09-alu-4-03.jpg)

When A is 4'b0110, B is 4'b1011, Sel is 4'b0000 for A + B, then Y is 4'b0001, carry index is 1'b1.

![image](https://github.com/yush2106/verilog-labs/blob/main/09-alu-4/img/09-alu-4-04.jpg)

When A is 4'b0110, B is 4'b1011, Sel is 4'b0001 for A - B, then Y is 4'b1011, carry index is 1'b1, overflow is 1'b1.

![image](https://github.com/yush2106/verilog-labs/blob/main/09-alu-4/img/09-alu-4-05.jpg)

When A is 4'b0110, B is 4'b1011, Sel is 4'b0010 for A and B, then Y is 4'b0010.

![image](https://github.com/yush2106/verilog-labs/blob/main/09-alu-4/img/09-alu-4-06.jpg)

When A is 4'b0110, B is 4'b1011, Sel is 4'b0011 for A or B, then Y is 4'b1111.

![image](https://github.com/yush2106/verilog-labs/blob/main/09-alu-4/img/09-alu-4-07.jpg)