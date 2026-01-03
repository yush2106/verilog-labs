## MUX 2 to 1

There are two inputs, a and b, the output is c.
The value of output c is controled by the input sel.

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-01.jpg)

## Truth Table

| a | b | sel | c |
|---|---|---|---|
| **0** | 0 | 0 | 0 <- a |
| **1** | 0 | 0 | 1 <- a |
| **0** | 1 | 0 | 0 <- a |
| **1** | 1 | 0 | 1 <- a |
| 0 | **0** | 1 | 0 <- b |
| 1 | **0** | 1 | 0 <- b |
| 0 | **1** | 1 | 1 <- b |
| 1 | **1** | 1 | 1 <- b |

## Process step

Step 1: Create a project

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-02.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-03.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-04.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-05.jpg)

Select the device for development board Altera DE2-115.

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-06.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-07.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-08.jpg)

Step 2: Edit the Verilog HDL File

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-09.jpg)

Save the Verilog HDL File when finished editing.

```
module mux2to1(a, b, sel, c);
  input wire a, b, sel;    //input
  output wire c;    //output
  
  wire not_sel, and_s_a, and_s_b;    //wire
  //not sel
  not n_g_s(not_sel, sel);
  
  //and gate: not_sel, a for input, and_s_a for output
  and a_g_a(and_s_a, not_sel, a);
  //and gate: sel, b for input, and_s_b for output
  and a_g_b(and_s_b, sel, b);
  
  //or gate: and_s_a, and_s_b for input, c for output
  or o_g(c, and_s_a, and_s_b);
endmodule

```

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-10.jpg)

Step 3: Compilation

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-11.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-12.jpg)

Step 4: Simulation

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-13.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-14.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-15.jpg)

Adjust input and output nodes order.
Set the value Forcing High for all nodes in different period.

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-16.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-17.jpg)

Run Functional Simulation.

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-18.jpg)

When input sel is **0**, output c value is a. When input sel is **1**, output c value is b.

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-19.jpg)

Run Timing Simulation, the output c will be late for a while.

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-20.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-21.jpg)

Step 5: Hardware Emulation

Set input a is SW[0] (PIN_AB28), input b is SW[1] (PIN_AC28), sel is SW[2] (PIN_AC27), output c is LEDR[0] (PIN_G19).

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-22.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-23.jpg)

Set unused pins as input tri-stated.

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-24.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-25.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-26.jpg)

Restart Compilation

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-11.jpg)

Upload to development board Altera DE2-115.

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-27.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-28.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-29.jpg)

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-30.jpg)

When input a (SW[0]) is 1 (On), input b (SW[1]) is 0 (Off), input sel (SW[2]) is 0 (Off), then output c (LEDR[0]) is 1 (On).

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-31.jpg)

When input a (SW[0]) is 0 (Off), input b (SW[1]) is 1 (On), input sel (SW[2]) is 0 (Off), then output c (LEDR[0]) is 0 (Off).

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-32.jpg)

When input a (SW[0]) is 0 (Off), input b (SW[1]) is 1 (On), input sel (SW[2]) is 1 (On), then output c (LEDR[0]) is 1 (On).

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-33.jpg)

When input a (SW[0]) is 1 (On), input b (SW[1]) is 0 (Off), input sel (SW[2]) is 1 (On), then output c (LEDR[0]) is 0 (Off).

![image](https://github.com/yush2106/verilog-labs/blob/main/01-mux-2to1/img/01-mux-2to1-34.jpg)