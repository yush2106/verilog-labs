## 4-Bit Full Adder

The 4 bit full adder can do the addition which includes input parameters A, B and carry in. The output parameters are summary number and carry out.

![image](https://github.com/yush2106/verilog-labs/blob/main/14-adder-4/img/14-adder-4-01.jpg)

## Process Step

Step 1: Full Adder 4-Bit
```
module FullAdder4(
  input wire[3:0] A
  , input wire[3:0] B
  , input wire c_in
  , output wire[3:0] sum
  , output wire c_out
);

//temp sum
wire [4:0] temp;

assign temp = A + B + c_in;
assign c_out = temp[4];    //carry out
assign sum = temp[3:0];    //summary number

endmodule
```

Step 2: Simulation

When input A is 4'b0011, B is 4'b1010, carry in is 1'b0, then output sum is 4'b1101, carry out is 1'b0.

When input A is 4'b0110, B is 4'b1011, carry in is 1'b1, then output sum is 4'b0010, carry out is 1'b1.

When input A is 4'b0101, B is 4'b1101, carry in is 1'b1, then output sum is 4'b0011, carry out is 1'b1.

![image](https://github.com/yush2106/verilog-labs/blob/main/14-adder-4/img/14-adder-4-02.jpg)

Step 3: Block Diagram

Set SW[3..0] is input A, SW[7..4] is input B, SW[8] is carry in. Set LEDG[3..0] is output sum, LEDG[4] is output carry out.

![image](https://github.com/yush2106/verilog-labs/blob/main/14-adder-4/img/14-adder-4-03.jpg)

Step 4: Hardware Emulation

![image](https://github.com/yush2106/verilog-labs/blob/main/14-adder-4/img/14-adder-4-04.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/14-adder-4/img/14-adder-4-05.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/14-adder-4/img/14-adder-4-06.jpg)