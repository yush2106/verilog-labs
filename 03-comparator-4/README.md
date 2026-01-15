## 4 Bits Comparator

This project creates a comparator, there are 2 input parameter for 4 bits signals.

Compare a, b input signal, then output 3 bits results.

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-01.jpg)

| Conditions | c |
|---|---|
| a[3:0] > b[3:0] | 3'b001 |
| a[3:0] = b[3:0] | 3'b010 |
| a[3:0] < b[3:0] | 3'b100 |

## Process Step

Step 1: Comparator module

```
module comparator4(
  input wire [3:0] a
  , input wire [3:0] b
  , output reg [2:0] c
);

  always @(a or b) begin
    if(a > b)    //greater than
	   c = 3'b001;
	 else if (a == b)    //equal
	   c = 3'b010;
	 else    //less than
	   c = 3'b100;
  end
endmodule
```

Step 2: Testbench module

```
`timescale 1ns/1ns

module testbench;
  reg [3:0] a_in;
  reg [3:0] b_in;
  wire [2:0] c_out;

  //comparator 4 bits
  comparator4 MyComparator(
    .a(a_in)
	 , .b(b_in)
	 , .c(c_out)
  );
  
  initial
  begin
    a_in = 4'b0000;
    b_in = 4'b0000;

    #10;    //time 10
    a_in = 4'b0001;
    b_in = 4'b0000;

    #10;    //time 20
    a_in = 4'b0000;
    b_in = 4'b0001;

    #10;    //time 30
    a_in = 4'b1010;
    b_in = 4'b1010;

    #10;    //time 40
  end
endmodule
```

Step 3: Start Analysis & Synthesis

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-02.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-03.jpg)

Step 4: Simulation

Assignments -> Settings

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-04.jpg)

EDA Tool Settings -> Simulation

Tool name: **Questa Altera FPGA**

Format for output netlist: **Verilog HDL**

Compile test bench -> Test Benches

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-05.jpg)

New

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-06.jpg)

Testbench name: **testbench**

Top level module in test bench: **testbench**

Select testbench file -> Add -> OK

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-07.jpg)

OK

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-08.jpg)

OK

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-09.jpg)

Tools -> Run Simulation Tool -> RTL Simulation

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-10.jpg)

Convert input and output signal to binary type.

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-11.jpg)

The initial status, a is 4'b0000, b is 4'b0000.
Value a and value b are equal, the output value c is 3'b010.

At 10ns, a is 4'b0001, b is 4'b0000.
Value a is grater than value b, the output value c is 3'b001.

At 20ns, a is 4'b0000, b is 4'b0001.
Value a is less than value b, the output value c is 3'b100.

At 30ns, a is 4'b1010, b is 4'b1010.
Value a and value b are equal, the output value c is 3'b010.

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-12.jpg)

Step 5: Hardware Emulation

Select the comparator4.v file.

File -> Create / Update -> Crearte Symbol File for Current File

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-13.jpg)

File -> New

Block Diagram/Schematic File -> OK

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-14.jpg)

Insert -> Symbol

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-15.jpg)

Select comparator4 symbol -> OK

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-16.jpg)

Add the input pins and output pins.

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-17.jpg)

Set a[3:0] is SW[3..0], b[3:0] is SW[7..4], c[2:0] is LEDR[2:0].

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-18.jpg)

Assignments -> Import Assignments

Load pin list to set input and output pins for the development board Altera DE2-115.

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-19.jpg)

Save the block diagram as file name block_comparator4.bdf.

Project -> Set as Top-Level Entity

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-20.jpg)

Set unused pins as input tri-stated.

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-24.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-25.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-26.jpg)

Processing -> Start Compilation

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-21.jpg)

Tools -> Programmer

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-22.jpg)

Hardware Setup

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-23.jpg)

Currently selected hardware: **USB-Blaster[USB-0]**

Close

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-24.jpg)

Start

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-25.jpg)


When a[3:0] value is 4'b0000, b[3:0] value is 4'b0000, then c[2:0] value is 3'b010.

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-26.jpg)

When a[3:0] value is 4'b0001, b[3:0] value is 4'b0000, then c[2:0] value is 3'b001.

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-27.jpg)

When a[3:0] value is 4'b0000, b[3:0] value is 4'b0001, then c[2:0] value is 3'b100.

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-28.jpg)

When a[3:0] value is 4'b1010, b[3:0] value is 4'b1010, then c[2:0] value is 3'b010.

![image](https://github.com/yush2106/verilog-labs/blob/main/03-comparator-4/img/03-comparator-4-29.jpg)